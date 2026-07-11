"use strict";
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/main.ts
var main_exports = {};
__export(main_exports, {
  default: () => CommentsPlugin
});
module.exports = __toCommonJS(main_exports);
var import_obsidian4 = require("obsidian");

// src/author.ts
var AUTHOR_OVERRIDE_KEY = "author-name-override";
var FALLBACK_AUTHOR = "Me";
function detectOsUsername() {
  var _a, _b;
  try {
    if (typeof require !== "function") return null;
    const os = require("os");
    const name = (_b = (_a = os.userInfo) == null ? void 0 : _a.call(os).username) == null ? void 0 : _b.trim();
    return name ? name : null;
  } catch (e) {
    return null;
  }
}
function resolveAuthorName(override, osUsername) {
  const trimmedOverride = override == null ? void 0 : override.trim();
  if (trimmedOverride) return trimmedOverride;
  if (osUsername) return osUsername;
  return FALLBACK_AUTHOR;
}

// src/editor-extension.ts
var import_state = require("@codemirror/state");
var import_view = require("@codemirror/view");

// src/reanchor.ts
function mapAnchors(anchors, changes) {
  return anchors.map((a) => ({ id: a.id, from: changes.mapPos(a.from, 1), to: changes.mapPos(a.to, -1) })).filter((a) => a.to > a.from);
}
function isFullReplace(changes) {
  let covered = 0;
  changes.iterChangedRanges((fromA, toA) => {
    covered += toA - fromA;
  });
  return changes.length > 0 && covered / changes.length > 0.5;
}

// src/store.ts
var SCHEMA_HINT_LINES = [
  '// Schema: { "<id>": { anchor:{exact,prefix,suffix,pos?}, status:open|resolved, thread:[{author,ts,text}] } }',
  '// Anchor = quote from the prose. To locate: search for "exact", disambiguate via prefix/suffix.'
];
var FENCE_OPEN = "```tandem-comments";
var CONTEXT_LEN = 20;
function parseBlockBody(body) {
  const lines = body.split("\n");
  let i = 0;
  while (i < lines.length && (lines[i].startsWith("//") || lines[i].trim() === "")) i++;
  const data = JSON.parse(lines.slice(i).join("\n"));
  if (typeof data !== "object" || data === null || Array.isArray(data)) {
    throw new Error("tandem-comments: top level must be an object");
  }
  return data;
}
function findBlock(raw) {
  const idx = raw.lastIndexOf("\n" + FENCE_OPEN + "\n");
  let proseEnd;
  let bodyStart;
  if (idx >= 0) {
    proseEnd = idx;
    bodyStart = idx + FENCE_OPEN.length + 2;
  } else if (raw.startsWith(FENCE_OPEN + "\n")) {
    proseEnd = 0;
    bodyStart = FENCE_OPEN.length + 1;
  } else {
    return null;
  }
  const rest = raw.slice(bodyStart);
  let closeIdx = rest.indexOf("\n```");
  while (closeIdx >= 0 && closeIdx + 4 < rest.length && rest[closeIdx + 4] !== "\n") {
    closeIdx = rest.indexOf("\n```", closeIdx + 1);
  }
  if (closeIdx < 0) return null;
  const trailing = closeIdx + 5 <= rest.length ? rest.slice(closeIdx + 5) : "";
  return { proseEnd, body: rest.slice(0, closeIdx), trailing };
}
function parseDocument(raw) {
  const blk = findBlock(raw);
  if (!blk) return { prose: raw, comments: {} };
  try {
    const comments = parseBlockBody(blk.body);
    const doc = { prose: raw.slice(0, blk.proseEnd), comments };
    if (blk.trailing) doc.trailing = blk.trailing;
    return doc;
  } catch (e) {
    return { prose: raw, comments: {}, error: e instanceof Error ? e.message : String(e) };
  }
}
function serializeDocument(doc, schemaHint) {
  var _a;
  if (doc.error) throw new Error("refusing to serialize a document with a parse error: " + doc.error);
  const trailing = (_a = doc.trailing) != null ? _a : "";
  if (Object.keys(doc.comments).length === 0) return doc.prose + trailing;
  const hint = schemaHint ? SCHEMA_HINT_LINES.join("\n") + "\n" : "";
  return doc.prose + "\n" + FENCE_OPEN + "\n" + hint + JSON.stringify(doc.comments, null, 2) + "\n```\n" + trailing;
}
function normalizeTrailingChanges(raw, doc) {
  if (doc.error || !doc.trailing || doc.trailing.trim() === "") return null;
  const blockStart = doc.prose.length;
  const blockEnd = raw.length - doc.trailing.length;
  const block = raw.slice(blockStart, blockEnd);
  const blockText = block.startsWith("\n") ? block.slice(1) : block;
  const sep = raw.endsWith("\n") ? "" : "\n";
  return [
    { from: blockStart, to: blockEnd, insert: blockStart === 0 ? "" : "\n" },
    { from: raw.length, to: raw.length, insert: sep + blockText }
  ];
}
function contextMatches(prose, at, len, anchor) {
  if (anchor.prefix && prose.slice(Math.max(0, at - anchor.prefix.length), at) !== anchor.prefix) return false;
  if (anchor.suffix && prose.slice(at + len, at + len + anchor.suffix.length) !== anchor.suffix) return false;
  return true;
}
function resolveAnchor(prose, anchor) {
  const exact = anchor.exact;
  if (!exact) return { kind: "orphaned" };
  const matches = [];
  let i = prose.indexOf(exact);
  while (i !== -1) {
    matches.push(i);
    i = prose.indexOf(exact, i + 1);
  }
  if (matches.length === 0) return { kind: "orphaned" };
  let cands = matches;
  if (cands.length > 1) {
    const filtered = cands.filter((m) => contextMatches(prose, m, exact.length, anchor));
    if (filtered.length > 0) cands = filtered;
  }
  if (cands.length === 1) return { kind: "resolved", start: cands[0], end: cands[0] + exact.length };
  let best = cands[0];
  if (anchor.pos != null) {
    const pos = anchor.pos;
    best = cands.reduce((a, b) => Math.abs(b - pos) < Math.abs(a - pos) ? b : a);
  }
  return { kind: "resolved", start: best, end: best + exact.length, ambiguous: true };
}
function makeAnchor(prose, start, end) {
  const anchor = { exact: prose.slice(start, end), pos: start };
  const prefix = prose.slice(Math.max(0, start - CONTEXT_LEN), start);
  const suffix = prose.slice(end, Math.min(prose.length, end + CONTEXT_LEN));
  if (prefix) anchor.prefix = prefix;
  if (suffix) anchor.suffix = suffix;
  return anchor;
}
function addComment(comments, id, anchor, author, ts, text) {
  comments[id] = { anchor, status: "open", thread: [{ author, ts, text }] };
}
function addReply(comments, id, author, ts, text) {
  const c = comments[id];
  if (!c) throw new Error(`tandem-comments: unknown comment id "${id}"`);
  c.thread.push({ author, ts, text });
}
function setStatus(comments, id, status) {
  const c = comments[id];
  if (!c) throw new Error(`tandem-comments: unknown comment id "${id}"`);
  c.status = status;
}
function removeComment(comments, id) {
  delete comments[id];
}
function generateId(existing) {
  for (; ; ) {
    const id = Math.floor(Math.random() * 65535).toString(16).padStart(4, "0");
    if (!(id in existing)) return id;
  }
}
function resolveAll(prose, comments) {
  return Object.entries(comments).map(([id, comment]) => ({
    id,
    comment,
    resolution: resolveAnchor(prose, comment.anchor)
  }));
}

// src/table-highlight.ts
var DELIMITER = /^\s*\|?\s*:?-{1,}:?\s*(\|\s*:?-{1,}:?\s*)*\|?\s*$/;
function splitLines(text, limit) {
  const lines = [];
  let from = 0;
  for (const part of text.slice(0, limit).split("\n")) {
    lines.push({ text: part, from });
    from += part.length + 1;
  }
  return lines;
}
function splitRow(line) {
  const segments = [];
  let start = 0;
  for (let i = 0; i < line.text.length; i++) {
    if (line.text[i] === "\\") {
      i++;
      continue;
    }
    if (line.text[i] === "|") {
      segments.push({ start, end: i });
      start = i + 1;
    }
  }
  segments.push({ start, end: line.text.length });
  if (segments.length > 1 && line.text.slice(segments[0].start, segments[0].end).trim() === "") {
    segments.shift();
  }
  if (segments.length > 1) {
    const last = segments[segments.length - 1];
    if (line.text.slice(last.start, last.end).trim() === "") segments.pop();
  }
  return segments.map((s) => ({ from: line.from + s.start, to: line.from + s.end }));
}
function findTables(text, limit = text.length) {
  const lines = splitLines(text, limit);
  const tables = [];
  for (let i = 0; i < lines.length; i++) {
    const header = lines[i];
    const delim = lines[i + 1];
    if (!delim || !header.text.includes("|") || !DELIMITER.test(delim.text)) continue;
    if (splitRow(header).length !== splitRow(delim).length) continue;
    let end = i;
    for (let j = i + 2; j < lines.length; j++) {
      if (lines[j].text.trim() === "" || !lines[j].text.includes("|")) break;
      end = j;
    }
    if (end < i + 2) end = i;
    const cells = [];
    for (let r = i; r <= end; r++) {
      if (r === i + 1) continue;
      const rowIndex = r - i;
      splitRow(lines[r]).forEach((span, col) => cells.push({ row: rowIndex, col, ...span }));
    }
    const last = lines[end];
    tables.push({ from: header.from, to: last.from + last.text.length, cells });
    i = end;
  }
  return tables;
}
function rangesTouchTable(text, proseLen, ranges) {
  const tables = findTables(text, proseLen);
  return tables.some((t) => ranges.some((r) => r.from <= t.to && r.to >= t.from));
}
function locateCell(table, pos) {
  for (const c of table.cells) {
    if (pos >= c.from && pos < c.to) return c;
  }
  return null;
}
function visibleText(md) {
  return md.replace(/\[\[([^\]|]+)\|([^\]]+)\]\]/g, "$2").replace(/\[\[([^\]]+)\]\]/g, "$1").replace(/!?\[([^\]]*)\]\([^)]*\)/g, "$1").replace(/(\*\*|__)(.+?)\1/g, "$2").replace(/(\*|_)(.+?)\1/g, "$2").replace(/~~(.+?)~~/g, "$1").replace(/==(.+?)==/g, "$1").replace(/`([^`]+)`/g, "$1");
}
function findDomTable(view, table) {
  const tables = view.contentDOM.querySelectorAll("table");
  for (const el of Array.from(tables)) {
    let pos;
    try {
      pos = view.posAtDOM(el);
    } catch (e) {
      continue;
    }
    if (pos >= table.from && pos <= table.to) return el;
  }
  return null;
}
function domCell(domTable, cell) {
  var _a, _b, _c, _d, _e;
  if (cell.row === 0) {
    const headerRow = (_b = (_a = domTable.tHead) == null ? void 0 : _a.rows[0]) != null ? _b : domTable.rows[0];
    return (_c = headerRow == null ? void 0 : headerRow.cells[cell.col]) != null ? _c : null;
  }
  const body = domTable.tBodies[0];
  return (_e = (_d = body == null ? void 0 : body.rows[cell.row - 2]) == null ? void 0 : _d.cells[cell.col]) != null ? _e : null;
}
function wrapRange(root, start, len, id, onClick) {
  var _a, _b;
  const doc = root.ownerDocument;
  const end = start + len;
  const walker = doc.createTreeWalker(root, NodeFilter.SHOW_TEXT);
  const targets = [];
  let pos = 0;
  let n;
  while (n = walker.nextNode()) {
    const node = n;
    const nodeLen = (_b = (_a = node.nodeValue) == null ? void 0 : _a.length) != null ? _b : 0;
    const nodeStart = pos;
    const nodeEnd = pos + nodeLen;
    if (nodeEnd > start && nodeStart < end) {
      targets.push({ node, s: Math.max(0, start - nodeStart), e: Math.min(nodeLen, end - nodeStart) });
    }
    pos = nodeEnd;
    if (pos >= end) break;
  }
  if (targets.length === 0) return false;
  for (const t of targets) {
    const range = doc.createRange();
    range.setStart(t.node, t.s);
    range.setEnd(t.node, t.e);
    const span = doc.createElement("span");
    span.className = "tc-highlight";
    span.dataset.tcId = id;
    span.dataset.tcTable = "1";
    const swallow = (e) => {
      e.preventDefault();
      e.stopImmediatePropagation();
    };
    span.addEventListener("pointerdown", (e) => {
      swallow(e);
      onClick(id);
    });
    span.addEventListener("mousedown", swallow);
    span.addEventListener("click", swallow);
    try {
      range.surroundContents(span);
    } catch (e) {
      return false;
    }
  }
  return true;
}
function clearTableHighlights(view) {
  view.contentDOM.querySelectorAll("span.tc-highlight[data-tc-table]").forEach((span) => {
    const parent = span.parentNode;
    if (!parent) return;
    while (span.firstChild) parent.insertBefore(span.firstChild, span);
    parent.removeChild(span);
    parent.normalize();
  });
}
function applyTableHighlights(view, anchors, text, proseLen, onClick) {
  var _a, _b;
  clearTableHighlights(view);
  const tables = findTables(text, proseLen);
  if (tables.length === 0) return;
  for (const a of anchors) {
    try {
      const table = tables.find((t) => a.from >= t.from && a.to <= t.to);
      if (!table) continue;
      const cell = locateCell(table, a.from);
      if (!cell) continue;
      const domTable = findDomTable(view, table);
      if (!domTable) continue;
      const cellEl = domCell(domTable, cell);
      if (!cellEl) continue;
      const visible = visibleText(text.slice(a.from, a.to));
      if (!visible) continue;
      const k = (_b = (_a = cellEl.textContent) == null ? void 0 : _a.indexOf(visible)) != null ? _b : -1;
      if (k >= 0) wrapRange(cellEl, k, visible.length, a.id, onClick);
    } catch (e) {
    }
  }
}

// src/editor-extension.ts
var selfEdit = import_state.Annotation.define();
var REANCHOR_DEBOUNCE_MS = 800;
var NORMALIZE_DEBOUNCE_MS = 500;
function buildEditorExtension(plugin) {
  return import_view.ViewPlugin.fromClass(
    class {
      constructor(view) {
        this.view = view;
        this.anchors = [];
        this.dirty = false;
        this.timer = null;
        this.normalizeTimer = null;
        this.syncFromDoc(view.state.doc.toString());
        this.decorations = this.buildDecorations();
        this.scheduleTableHighlight();
        this.scheduleNormalize();
      }
      destroy() {
        if (this.timer !== null) window.clearTimeout(this.timer);
        if (this.normalizeTimer !== null) window.clearTimeout(this.normalizeTimer);
      }
      syncFromDoc(text) {
        const doc = parseDocument(text);
        this.anchors = [];
        this.dirty = false;
        if (doc.error) return;
        for (const [id, c] of Object.entries(doc.comments)) {
          if (c.status === "resolved") continue;
          const r = resolveAnchor(doc.prose, c.anchor);
          if (r.kind === "resolved") this.anchors.push({ id, from: r.start, to: r.end });
        }
        this.anchors.sort((a, b) => a.from - b.from);
      }
      update(u) {
        if (u.docChanged || u.selectionSet || u.viewportChanged) this.scheduleTableHighlight();
        if (!u.docChanged) return;
        this.scheduleNormalize();
        const text = u.state.doc.toString();
        const isSelf = u.transactions.some((tr) => tr.annotation(selfEdit));
        if (isSelf || isFullReplace(u.changes)) {
          this.syncFromDoc(text);
        } else {
          let minFrom = Infinity;
          const ranges = [];
          u.changes.iterChangedRanges((_fromA, _toA, fromB, toB) => {
            minFrom = Math.min(minFrom, fromB);
            ranges.push({ from: fromB, to: toB });
          });
          const proseLen = parseDocument(text).prose.length;
          if (minFrom >= proseLen) {
            this.syncFromDoc(text);
          } else if (rangesTouchTable(text, proseLen, ranges)) {
            const mapped = mapAnchors(this.anchors, u.changes);
            const survived = new Set(mapped.map((a) => a.id));
            this.anchors = mapped;
            const doc = parseDocument(text);
            for (const [id, c] of Object.entries(doc.comments)) {
              if (c.status === "resolved" || survived.has(id)) continue;
              const r = resolveAnchor(doc.prose, c.anchor);
              if (r.kind === "resolved") this.anchors.push({ id, from: r.start, to: r.end });
            }
            this.anchors.sort((a, b) => a.from - b.from);
            this.dirty = true;
            this.scheduleReanchor();
          } else {
            this.anchors = mapAnchors(this.anchors, u.changes);
            this.dirty = true;
            this.scheduleReanchor();
          }
        }
        this.decorations = this.buildDecorations();
      }
      buildDecorations() {
        const b = new import_state.RangeSetBuilder();
        const len = this.view.state.doc.length;
        for (const a of this.anchors) {
          if (a.from >= a.to || a.to > len) continue;
          b.add(a.from, a.to, import_view.Decoration.mark({ class: "tc-highlight", attributes: { "data-tc-id": a.id } }));
        }
        return b.finish();
      }
      /**
       * Highlights innerhalb gerenderter Tabellen-Widgets müssen direkt ins DOM
       * geschrieben werden (CM-mark-Dekorationen werden dort verschluckt). Das
       * läuft in der Measure-/Write-Phase, nachdem Obsidian die Widgets gebaut hat.
       */
      scheduleTableHighlight() {
        this.view.requestMeasure({
          key: "tc-table-highlight",
          read: () => null,
          write: () => {
            const text = this.view.state.doc.toString();
            const proseLen = parseDocument(text).prose.length;
            applyTableHighlights(this.view, this.anchors, text, proseLen, (id) => void plugin.openSidebar(id));
          }
        });
      }
      scheduleNormalize() {
        if (this.normalizeTimer !== null) window.clearTimeout(this.normalizeTimer);
        this.normalizeTimer = window.setTimeout(() => {
          this.normalizeTimer = null;
          this.performNormalize();
        }, NORMALIZE_DEBOUNCE_MS);
      }
      /**
       * Faltet Inhalt hinter dem Block (getippte Prosa, Fußnoten-Definitionen)
       * zurück vor den Block, damit der Block das letzte Element der Datei bleibt —
       * sonst landet der Text im nicht kommentierbaren trailing-Bereich.
       */
      performNormalize() {
        if (this.dirty) this.performReanchor();
        const text = this.view.state.doc.toString();
        const changes = normalizeTrailingChanges(text, parseDocument(text));
        if (!changes) return;
        this.view.dispatch({
          changes,
          annotations: [selfEdit.of(true), import_state.Transaction.addToHistory.of(false)]
        });
      }
      scheduleReanchor() {
        if (this.timer !== null) window.clearTimeout(this.timer);
        this.timer = window.setTimeout(() => {
          this.timer = null;
          this.performReanchor();
        }, REANCHOR_DEBOUNCE_MS);
      }
      /**
       * Schreibt nach editierter Prosa die aktuellen Zitate/Kontexte der noch
       * lebenden Anker zurück in den Block (nur die Block-Region wird ersetzt).
       */
      performReanchor() {
        if (!this.dirty) return;
        this.dirty = false;
        const text = this.view.state.doc.toString();
        const doc = parseDocument(text);
        if (doc.error || Object.keys(doc.comments).length === 0) return;
        let changed = false;
        for (const t of this.anchors) {
          const c = doc.comments[t.id];
          if (!c || c.status === "resolved") continue;
          if (t.to > doc.prose.length) continue;
          const cur = c.anchor;
          if (resolveAnchor(doc.prose, cur).kind === "resolved") continue;
          const next = makeAnchor(doc.prose, t.from, t.to);
          if (next.exact && (next.exact !== cur.exact || next.prefix !== cur.prefix || next.suffix !== cur.suffix || next.pos !== cur.pos)) {
            c.anchor = next;
            changed = true;
          }
        }
        if (!changed) return;
        const serialized = serializeDocument(doc, plugin.settings.schemaHint);
        this.view.dispatch({
          changes: { from: doc.prose.length, to: text.length, insert: serialized.slice(doc.prose.length) },
          annotations: selfEdit.of(true)
        });
      }
    },
    {
      decorations: (v) => v.decorations,
      eventHandlers: {
        mousedown(e) {
          var _a;
          const target = e.target;
          const el = (_a = target.closest) == null ? void 0 : _a.call(target, ".tc-highlight");
          if (!el) return false;
          const id = el.getAttribute("data-tc-id");
          if (id) void plugin.openSidebar(id);
          return false;
        }
      }
    }
  );
}

// src/export.ts
function formatTs(ts) {
  const d = new Date(ts);
  return isNaN(d.getTime()) ? ts : d.toLocaleString();
}
function formatComment(r, opts) {
  var _a;
  const fmt = (_a = opts.formatTs) != null ? _a : ((ts) => ts);
  const thread = r.comment.thread.map((e) => `**${e.author}** (${fmt(e.ts)}): ${e.text}`).join("\n");
  if (!opts.includeQuote) return thread;
  const quote = r.comment.anchor.exact.split("\n").map((l) => "> " + l).join("\n");
  return quote + "\n\n" + thread;
}
var INVALID_FILENAME_CHARS = /[\\/:*?"<>|#^[\]]/g;
function renderExportFileName(template, filename, date) {
  const rendered = template.replaceAll("{{filename}}", filename).replaceAll("{{date}}", date).replace(INVALID_FILENAME_CHARS, "-").trim();
  return rendered || `${filename.replace(INVALID_FILENAME_CHARS, "-")} \u2013 Comments`;
}
function buildExportNote(sourceName, all, opts) {
  const startOf = (r) => r.resolution.kind === "resolved" ? r.resolution.start : 0;
  const open = all.filter((r) => r.comment.status === "open" && r.resolution.kind === "resolved").sort((a, b) => startOf(a) - startOf(b));
  const orphans = all.filter((r) => r.comment.status === "open" && r.resolution.kind === "orphaned");
  const done = opts.scope === "all" ? all.filter((r) => r.comment.status === "resolved") : [];
  if (!open.length && !orphans.length && !done.length) return null;
  const fmt = (r) => formatComment(r, { includeQuote: true, formatTs: opts.formatTs });
  const sections = [`# Comments: ${sourceName}`, `Exported from [[${sourceName}]] on ${opts.date}`];
  if (open.length) sections.push("## Open", ...open.map(fmt));
  if (done.length) sections.push("## Resolved", ...done.map(fmt));
  if (orphans.length) sections.push("## Orphaned", ...orphans.map(fmt));
  return sections.join("\n\n") + "\n";
}

// src/reading-view.ts
var import_obsidian = require("obsidian");
function registerReadingView(plugin) {
  plugin.registerMarkdownCodeBlockProcessor("tandem-comments", (source, el, ctx) => {
    ctx.addChild(new BlockPill(el, source, plugin));
  });
}
var BlockPill = class extends import_obsidian.MarkdownRenderChild {
  constructor(containerEl, source, plugin) {
    super(containerEl);
    this.source = source;
    this.plugin = plugin;
    this.unloaded = false;
  }
  onload() {
    this.render();
  }
  onunload() {
    this.unloaded = true;
  }
  render() {
    const el = this.containerEl;
    el.empty();
    if (!el.isConnected) {
      requestAnimationFrame(() => {
        if (!this.unloaded) this.render();
      });
      return;
    }
    if (!el.closest(".markdown-preview-view")) {
      const widget = el.closest(".cm-embed-block");
      if (widget instanceof HTMLElement) widget.addClass("tc-lp-hidden");
      return;
    }
    let open = 0;
    let resolved = 0;
    try {
      for (const c of Object.values(parseBlockBody(this.source))) {
        if (c.status === "resolved") resolved++;
        else open++;
      }
    } catch (e) {
      el.createDiv({ text: "\u{1F4AC} tandem-comments \u2014 invalid JSON", cls: "tc-pill tc-pill-error" });
      return;
    }
    if (open === 0) return;
    const label = resolved > 0 ? `\u{1F4AC} ${open} open \xB7 ${resolved} resolved` : `\u{1F4AC} ${open} comment${open === 1 ? "" : "s"}`;
    const pill = el.createEl("button", { text: label, cls: "tc-pill" });
    pill.onclick = () => void this.plugin.openSidebar();
  }
};

// src/settings.ts
var import_obsidian2 = require("obsidian");

// src/skill-export.ts
var SKILL_MARKDOWN = `---
name: obsidian-tandem-comments
description: Read, write, reply to and resolve comments in Markdown files that use the tandem-comments format (a \`\`\`tandem-comments fenced JSON block near the end of the file, quote-anchored via W3C TextQuoteSelector). Trigger whenever a Markdown file contains a tandem-comments block, or the user asks to comment on / annotate / review text in an Obsidian note, reply to a comment, or resolve comments.
---

# Obsidian Tandem Comments \u2014 comments in Markdown

Comments live in a fenced block at the **end of the file** (footnote definitions
that Obsidian appends after the block are fine and must be preserved). The prose
stays **100% untouched** \u2014 never write markers into the body text.

\`\`\`\`markdown
\`\`\`tandem-comments
// Schema: { "<id>": { anchor:{exact,prefix,suffix,pos?}, status:open|resolved, thread:[{author,ts,text}] } }
// Anchor = quote from the prose. To locate: search for "exact", disambiguate via prefix/suffix.
{
  "a1f3": {
    "anchor": { "exact": "cut prices hard", "prefix": "we should ", "suffix": " in Q3", "pos": 22 },
    "status": "open",
    "thread": [
      { "author": "Leon", "ts": "2026-06-10T10:24:00Z", "text": "Too aggressive?" }
    ]
  }
}
\`\`\`
\`\`\`\`

## Rules

- **Locating a passage:** search the prose for \`anchor.exact\`; on multiple hits
  disambiguate via \`prefix\`/\`suffix\`, falling back to the hit closest to \`pos\`
  (character offset into the prose).
- **Replying:** append \`{ "author": "Claude", "ts": "<ISO-8601 UTC>", "text": "..." }\`
  to the \`thread\` array.
- **New comment:** add a new key (4-digit hex id, e.g. \`"7c2e"\`) with \`anchor\` +
  \`status: "open"\` + \`thread\`. Anchor: \`exact\` = exact quote from the prose,
  \`prefix\`/\`suffix\` = ~20 chars of context before/after, \`pos\` = character offset.
- **Resolving:** **remove the entry entirely** \u2014 the user wants Markdown files kept
  clean. Only if history is explicitly requested, set \`status\` to \`"resolved"\` instead.
- **Block lifecycle:** when no comments remain, **remove the block entirely**
  (including the single separating newline before it). If no block exists yet, append
  it at the end of the file: exactly one \\n between prose and the \`\`\`tandem-comments line.
- **Content after the block:** anything following the closing \`\`\` (e.g. footnote
  definitions like \`[^1]: ...\` that Obsidian appends at the very end) is legitimate \u2014
  keep it byte-exact and leave it after the block when rewriting.
- **Never** modify the prose while commenting. Comment text may contain Markdown;
  JSON strings escape newlines as \\\\n.
`;
function exportSkill() {
  if (typeof require !== "function") {
    throw new Error("Skill export is only available in the desktop app.");
  }
  const fs = require("fs");
  const os = require("os");
  const path = require("path");
  const dir = path.join(os.homedir(), ".claude", "skills", "obsidian-tandem-comments");
  fs.mkdirSync(dir, { recursive: true });
  const file = path.join(dir, "SKILL.md");
  fs.writeFileSync(file, SKILL_MARKDOWN, "utf8");
  return file;
}

// src/settings.ts
var DEFAULT_SETTINGS = {
  highlightColor: "#ffd54a",
  showResolvedByDefault: false,
  resolveBehavior: "remove",
  schemaHint: true,
  copyIncludeQuote: true,
  exportNameTemplate: "{{filename}} \u2013 Comments",
  exportScope: "all"
};
var CommentsSettingTab = class extends import_obsidian2.PluginSettingTab {
  constructor(app, plugin) {
    super(app, plugin);
    this.plugin = plugin;
  }
  display() {
    const { containerEl } = this;
    containerEl.empty();
    const detected = this.plugin.detectedAuthor();
    new import_obsidian2.Setting(containerEl).setName("Display name").setDesc(
      `Author label for your comments. Leave empty to use your detected account name ("${detected}"). Stored per device and not synced, so collaborators sharing this vault keep separate names.`
    ).addText(
      (t) => t.setPlaceholder(detected).setValue(this.plugin.authorOverride()).onChange((v) => this.plugin.setAuthorOverride(v))
    );
    new import_obsidian2.Setting(containerEl).setName("Highlight color").setDesc("Color for open comment highlights in the text.").addColorPicker(
      (c) => c.setValue(this.plugin.settings.highlightColor).onChange(async (v) => {
        this.plugin.settings.highlightColor = v;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Show resolved by default").setDesc("Show resolved comments in the sidebar without using the toggle.").addToggle(
      (t) => t.setValue(this.plugin.settings.showResolvedByDefault).onChange(async (v) => {
        this.plugin.settings.showResolvedByDefault = v;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Resolve behavior").setDesc('What happens when you resolve a comment. "Remove entirely" keeps Markdown files clean (default).').addDropdown(
      (d) => d.addOption("remove", "Remove entirely on resolve").addOption("keep", "Keep entry as history").setValue(this.plugin.settings.resolveBehavior).onChange(async (v) => {
        this.plugin.settings.resolveBehavior = v === "remove" ? "remove" : "keep";
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Schema hint in block").setDesc("Writes two //-comment lines with the format rules at the top of the block (travels with each file).").addToggle(
      (t) => t.setValue(this.plugin.settings.schemaHint).onChange(async (v) => {
        this.plugin.settings.schemaHint = v;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Include quote when copying").setDesc("Copy the quoted passage along with the comment text when using the Copy button.").addToggle(
      (t) => t.setValue(this.plugin.settings.copyIncludeQuote).onChange(async (v) => {
        this.plugin.settings.copyIncludeQuote = v;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Export note name").setDesc("Name of the exported note. Placeholders: {{filename}}, {{date}}. The note is created next to the source file and overwritten on re-export.").addText(
      (t) => t.setPlaceholder(DEFAULT_SETTINGS.exportNameTemplate).setValue(this.plugin.settings.exportNameTemplate).onChange(async (v) => {
        this.plugin.settings.exportNameTemplate = v.trim() || DEFAULT_SETTINGS.exportNameTemplate;
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Export scope").setDesc("Which comments to include when exporting a file's comments.").addDropdown(
      (d) => d.addOption("all", "All (open, resolved, orphaned)").addOption("open", "Open only").setValue(this.plugin.settings.exportScope).onChange(async (v) => {
        this.plugin.settings.exportScope = v === "open" ? "open" : "all";
        await this.plugin.saveSettings();
      })
    );
    new import_obsidian2.Setting(containerEl).setName("Export Claude skill").setDesc("Writes the bundled skill file to ~/.claude/skills/obsidian-tandem-comments/SKILL.md").addButton(
      (b) => b.setButtonText("Export").onClick(() => {
        try {
          new import_obsidian2.Notice("Skill exported: " + exportSkill());
        } catch (e) {
          new import_obsidian2.Notice("Export failed: " + (e instanceof Error ? e.message : String(e)));
        }
      })
    );
  }
};

// src/sidebar.ts
var import_obsidian3 = require("obsidian");
var VIEW_TYPE_COMMENTS = "tandem-comments-sidebar";
function truncate(s, n) {
  return s.length <= n ? s : s.slice(0, n - 1) + "\u2026";
}
var CommentSidebar = class extends import_obsidian3.ItemView {
  constructor(leaf, plugin) {
    super(leaf);
    this.plugin = plugin;
    this.draft = null;
    this.focusedId = null;
    this.showResolved = plugin.settings.showResolvedByDefault;
  }
  getViewType() {
    return VIEW_TYPE_COMMENTS;
  }
  getDisplayText() {
    return "Comments";
  }
  getIcon() {
    return "message-square";
  }
  async onOpen() {
    this.registerEvent(this.app.workspace.on("file-open", () => void this.render()));
    this.registerEvent(
      this.app.vault.on("modify", (f) => {
        var _a;
        if (f.path === ((_a = this.app.workspace.getActiveFile()) == null ? void 0 : _a.path) && !this.hasPendingInput()) {
          void this.render();
        }
      })
    );
    await this.render();
  }
  startDraft(file, anchor) {
    this.draft = { filePath: file.path, anchor };
    void this.render();
  }
  focusComment(id) {
    this.focusedId = id;
    void this.render();
  }
  toggleResolved() {
    this.showResolved = !this.showResolved;
    void this.render();
  }
  /** Nicht neu rendern, während in einem Eingabefeld getippter Text verloren ginge. */
  hasPendingInput() {
    return Array.from(this.contentEl.querySelectorAll("textarea")).some((t) => t.value.trim() !== "");
  }
  async render() {
    const container = this.contentEl;
    const prevScroll = container.scrollTop;
    container.empty();
    container.addClass("tc-sidebar");
    const file = this.app.workspace.getActiveFile();
    if (!file || file.extension !== "md") {
      container.createDiv({ text: "No active Markdown file.", cls: "tc-empty" });
      return;
    }
    const doc = await this.plugin.readDoc(file);
    if (doc.error) {
      container.createDiv({ text: "tandem-comments block is invalid: " + doc.error, cls: "tc-error" });
      return;
    }
    const header = container.createDiv({ cls: "tc-header" });
    header.createSpan({ text: "Comments", cls: "tc-title" });
    const toggle = header.createEl("button", {
      text: this.showResolved ? "Hide resolved" : "Show resolved",
      cls: "tc-toggle"
    });
    toggle.onclick = () => this.toggleResolved();
    const exportBtn = header.createEl("button", { text: "Export", cls: "tc-toggle" });
    exportBtn.onclick = () => void this.plugin.exportComments(file);
    if (this.draft && this.draft.filePath === file.path) this.renderDraft(container, file);
    else this.draft = null;
    const all = resolveAll(doc.prose, doc.comments);
    const open = all.filter((r) => r.comment.status === "open" && r.resolution.kind === "resolved").sort(
      (a, b) => (a.resolution.kind === "resolved" ? a.resolution.start : 0) - (b.resolution.kind === "resolved" ? b.resolution.start : 0)
    );
    const orphans = all.filter((r) => r.comment.status === "open" && r.resolution.kind === "orphaned");
    const done = all.filter((r) => r.comment.status === "resolved");
    if (!open.length && !orphans.length && !(this.showResolved && done.length) && !this.draft) {
      container.createDiv({ text: "No comments in this file.", cls: "tc-empty" });
      return;
    }
    for (const r of open) this.renderComment(container, file, r);
    if (orphans.length) {
      container.createDiv({ text: "Orphaned \u2014 text passage not found", cls: "tc-section" });
      for (const r of orphans) this.renderComment(container, file, r);
    }
    if (this.showResolved && done.length) {
      container.createDiv({ text: "Resolved", cls: "tc-section" });
      for (const r of done) this.renderComment(container, file, r);
    }
    container.scrollTop = prevScroll;
  }
  renderDraft(container, file) {
    const draft = this.draft;
    if (!draft) return;
    const card = container.createDiv({ cls: "tc-card tc-draft" });
    card.createDiv({ text: `"${truncate(draft.anchor.exact, 80)}"`, cls: "tc-quote" });
    const input = card.createEl("textarea", {
      cls: "tc-input",
      attr: { placeholder: "Comment\u2026 (Enter = save, Esc = cancel)", rows: "3" }
    });
    window.setTimeout(() => input.focus(), 0);
    input.onkeydown = (e) => {
      if (e.key === "Escape") {
        this.draft = null;
        void this.render();
      } else if (e.key === "Enter" && !e.shiftKey) {
        e.preventDefault();
        const text = input.value.trim();
        if (!text) return;
        void this.plugin.updateDoc(file, (d) => {
          addComment(
            d.comments,
            generateId(d.comments),
            draft.anchor,
            this.plugin.currentAuthor(),
            this.plugin.nowTs(),
            text
          );
        }).then((ok) => {
          if (ok) {
            this.draft = null;
            void this.render();
          }
        });
      }
    };
  }
  renderComment(container, file, r) {
    const cls = ["tc-card"];
    if (r.comment.status === "resolved") cls.push("tc-resolved");
    if (r.resolution.kind === "orphaned") cls.push("tc-orphan");
    const card = container.createDiv({ cls: cls.join(" ") });
    if (r.id === this.focusedId) {
      card.addClass("tc-focused");
      window.setTimeout(() => card.scrollIntoView({ block: "nearest" }), 0);
      this.focusedId = null;
    }
    const quote = card.createDiv({ text: `"${truncate(r.comment.anchor.exact, 80)}"`, cls: "tc-quote" });
    if (r.resolution.kind === "resolved") {
      quote.addClass("tc-quote-link");
      quote.onclick = () => this.plugin.revealAnchor(file, r.comment.anchor);
    }
    for (const entry of r.comment.thread) {
      const row = card.createDiv({ cls: "tc-entry" });
      const meta = row.createDiv({ cls: "tc-meta" });
      meta.createSpan({ text: entry.author, cls: "tc-author" });
      meta.createSpan({ text: formatTs(entry.ts), cls: "tc-ts" });
      row.createDiv({ text: entry.text, cls: "tc-text" });
    }
    const actions = card.createDiv({ cls: "tc-actions" });
    if (r.comment.status === "open") {
      const resolveBtn = actions.createEl("button", { text: "Resolve" });
      resolveBtn.onclick = () => void this.plugin.updateDoc(file, (d) => {
        if (this.plugin.settings.resolveBehavior === "remove") removeComment(d.comments, r.id);
        else setStatus(d.comments, r.id, "resolved");
      });
    } else {
      const reopenBtn = actions.createEl("button", { text: "Reopen" });
      reopenBtn.onclick = () => void this.plugin.updateDoc(file, (d) => setStatus(d.comments, r.id, "open"));
    }
    if (r.resolution.kind === "orphaned") {
      const reBtn = actions.createEl("button", { text: "Re-anchor to selection" });
      reBtn.onclick = () => this.reanchorFromSelection(file, r.id);
    }
    const copyBtn = actions.createEl("button", { text: "Copy" });
    copyBtn.onclick = () => void navigator.clipboard.writeText(formatComment(r, { includeQuote: this.plugin.settings.copyIncludeQuote, formatTs })).then(() => new import_obsidian3.Notice("Comment copied."));
    const delBtn = actions.createEl("button", { text: "Delete" });
    delBtn.onclick = () => void this.plugin.updateDoc(file, (d) => removeComment(d.comments, r.id));
    if (r.comment.status === "open") {
      const reply = card.createEl("textarea", {
        cls: "tc-input",
        attr: { placeholder: "Reply\u2026 (Enter = send)", rows: "2" }
      });
      reply.onkeydown = (e) => {
        if (e.key === "Enter" && !e.shiftKey) {
          e.preventDefault();
          const text = reply.value.trim();
          if (!text) return;
          reply.value = "";
          void this.plugin.updateDoc(
            file,
            (d) => addReply(d.comments, r.id, this.plugin.currentAuthor(), this.plugin.nowTs(), text)
          );
        }
      };
    }
  }
  reanchorFromSelection(file, id) {
    const sel = this.plugin.getProseSelection(file);
    if (!sel) {
      new import_obsidian3.Notice("Select the new text passage in the editor first.");
      return;
    }
    void this.plugin.updateDoc(file, (d) => {
      const c = d.comments[id];
      if (c) c.anchor = sel.anchor;
    });
  }
};

// src/main.ts
var CommentsPlugin = class extends import_obsidian4.Plugin {
  constructor() {
    super(...arguments);
    this.settings = DEFAULT_SETTINGS;
  }
  async onload() {
    await this.loadSettings();
    this.applyHighlightColor();
    this.registerView(VIEW_TYPE_COMMENTS, (leaf) => new CommentSidebar(leaf, this));
    this.registerEditorExtension(buildEditorExtension(this));
    registerReadingView(this);
    this.addSettingTab(new CommentsSettingTab(this.app, this));
    this.addCommand({
      id: "add-comment",
      name: "Add comment",
      icon: "message-square-plus",
      editorCallback: (editor) => this.addCommentFromSelection(editor)
    });
    this.addCommand({
      id: "open-sidebar",
      name: "Open comment sidebar",
      icon: "message-square",
      callback: () => void this.openSidebar()
    });
    this.addCommand({
      id: "toggle-resolved",
      name: "Toggle resolved comments",
      icon: "check-check",
      callback: () => void this.openSidebar().then((v) => v == null ? void 0 : v.toggleResolved())
    });
    this.addCommand({
      id: "purge-resolved",
      name: "Remove resolved comments from file",
      icon: "trash-2",
      callback: () => {
        const file = this.app.workspace.getActiveFile();
        if (!file || file.extension !== "md") return;
        void this.updateDoc(file, (d) => {
          let n = 0;
          for (const [id, c] of Object.entries(d.comments)) {
            if (c.status === "resolved") {
              delete d.comments[id];
              n++;
            }
          }
          new import_obsidian4.Notice(n > 0 ? `${n} resolved comment${n === 1 ? "" : "s"} removed.` : "No resolved comments in this file.");
        });
      }
    });
    this.addCommand({
      id: "export-comments",
      name: "Export comments of active file",
      icon: "file-output",
      callback: () => {
        const file = this.app.workspace.getActiveFile();
        if (!file || file.extension !== "md") {
          new import_obsidian4.Notice("No active Markdown file.");
          return;
        }
        void this.exportComments(file);
      }
    });
    this.registerEvent(
      this.app.workspace.on("editor-menu", (menu, editor) => {
        if (!editor.somethingSelected()) return;
        menu.addItem(
          (item) => item.setTitle("Add comment").setIcon("message-square").onClick(() => this.addCommentFromSelection(editor))
        );
      })
    );
    this.registerEvent(
      this.app.workspace.on("window-open", (win) => {
        win.doc.body.style.setProperty("--tc-highlight-color", this.settings.highlightColor);
      })
    );
  }
  onunload() {
    for (const doc of this.allDocuments()) {
      doc.body.style.removeProperty("--tc-highlight-color");
    }
  }
  async loadSettings() {
    var _a;
    const data = (_a = await this.loadData()) != null ? _a : {};
    const hadLegacy = "authorName" in data;
    this.migrateLegacyAuthorName(data);
    this.settings = Object.assign({}, DEFAULT_SETTINGS, data);
    if (hadLegacy) await this.saveData(this.settings);
  }
  async saveSettings() {
    await this.saveData(this.settings);
    this.applyHighlightColor();
  }
  /**
   * The author label attached to new comments/replies from this device: the
   * manual override if set, otherwise the detected OS account username, else a
   * generic fallback. See {@link resolveAuthorName}.
   */
  currentAuthor() {
    return resolveAuthorName(this.authorOverride(), detectOsUsername());
  }
  /** The name auto-detection would use — shown as the settings placeholder. */
  detectedAuthor() {
    var _a;
    return (_a = detectOsUsername()) != null ? _a : FALLBACK_AUTHOR;
  }
  /** Device-local manual override for the author label ("" when unset). Never synced. */
  authorOverride() {
    const v = this.app.loadLocalStorage(AUTHOR_OVERRIDE_KEY);
    return typeof v === "string" ? v : "";
  }
  /** Persist the override to per-vault localStorage; an empty value clears it. */
  setAuthorOverride(value) {
    const trimmed = value.trim();
    this.app.saveLocalStorage(AUTHOR_OVERRIDE_KEY, trimmed || null);
  }
  /**
   * One-time transition: the author name used to live in synced settings. Seed
   * it as this device's local override (unless one already exists) and drop it
   * from the settings object so it stops being synced.
   */
  migrateLegacyAuthorName(data) {
    var _a;
    const legacy = (_a = data.authorName) == null ? void 0 : _a.trim();
    if (legacy && legacy !== FALLBACK_AUTHOR && !this.authorOverride()) {
      this.setAuthorOverride(legacy);
    }
    delete data.authorName;
  }
  /** Haupt-Fenster + alle Popout-Fenster. */
  allDocuments() {
    const docs = /* @__PURE__ */ new Set([activeDocument]);
    this.app.workspace.iterateAllLeaves((leaf) => docs.add(leaf.view.containerEl.ownerDocument));
    return docs;
  }
  applyHighlightColor() {
    for (const doc of this.allDocuments()) {
      doc.body.style.setProperty("--tc-highlight-color", this.settings.highlightColor);
    }
  }
  nowTs() {
    return (/* @__PURE__ */ new Date()).toISOString();
  }
  async readDoc(file) {
    return parseDocument(await this.app.vault.read(file));
  }
  /** Alle Mutationen laufen hierdurch: read → parse → mutate → serialize → write. */
  async updateDoc(file, mutate) {
    const raw = await this.app.vault.read(file);
    const doc = parseDocument(raw);
    if (doc.error) {
      new import_obsidian4.Notice("tandem-comments block is invalid \u2014 please fix the JSON: " + doc.error);
      return false;
    }
    mutate(doc);
    const out = serializeDocument(doc, this.settings.schemaHint);
    if (out !== raw) await this.app.vault.modify(file, out);
    return true;
  }
  /** Exportiert alle Kommentare der Datei als Notiz neben der Quelldatei (überschreibt bei erneutem Export). */
  async exportComments(file) {
    const doc = await this.readDoc(file);
    if (doc.error) {
      new import_obsidian4.Notice("tandem-comments block is invalid \u2014 please fix the JSON: " + doc.error);
      return;
    }
    const now = /* @__PURE__ */ new Date();
    const date = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, "0")}-${String(now.getDate()).padStart(2, "0")}`;
    const content = buildExportNote(file.basename, resolveAll(doc.prose, doc.comments), {
      scope: this.settings.exportScope,
      date,
      formatTs
    });
    if (!content) {
      new import_obsidian4.Notice("No comments to export.");
      return;
    }
    const name = renderExportFileName(this.settings.exportNameTemplate, file.basename, date);
    const folder = file.parent && file.parent.path !== "/" ? file.parent.path + "/" : "";
    const path = (0, import_obsidian4.normalizePath)(folder + name + ".md");
    if (path === file.path) {
      new import_obsidian4.Notice("Export name matches the source file \u2014 change the template in settings.");
      return;
    }
    const existing = this.app.vault.getAbstractFileByPath(path);
    if (existing instanceof import_obsidian4.TFile) await this.app.vault.modify(existing, content);
    else if (existing) {
      new import_obsidian4.Notice("Export target is a folder: " + path);
      return;
    } else await this.app.vault.create(path, content);
    new import_obsidian4.Notice("Comments exported to " + path);
  }
  addCommentFromSelection(editor) {
    const file = this.app.workspace.getActiveFile();
    if (!file) return;
    if (!editor.somethingSelected()) {
      new import_obsidian4.Notice("Select some text first.");
      return;
    }
    const from = editor.posToOffset(editor.getCursor("from"));
    const to = editor.posToOffset(editor.getCursor("to"));
    const doc = parseDocument(editor.getValue());
    if (to > doc.prose.length) {
      new import_obsidian4.Notice("Only prose can be commented (not the comment block).");
      return;
    }
    const anchor = makeAnchor(doc.prose, from, to);
    void this.openSidebar().then((view) => view == null ? void 0 : view.startDraft(file, anchor));
  }
  /** Aktuelle Editor-Selektion als Anker (für Re-Anchoring von Orphans). */
  getProseSelection(file) {
    const leaf = this.app.workspace.getLeavesOfType("markdown").find((l) => {
      var _a;
      return l.view instanceof import_obsidian4.MarkdownView && ((_a = l.view.file) == null ? void 0 : _a.path) === file.path;
    });
    if (!leaf) return null;
    const editor = leaf.view.editor;
    if (!editor.somethingSelected()) return null;
    const from = editor.posToOffset(editor.getCursor("from"));
    const to = editor.posToOffset(editor.getCursor("to"));
    const doc = parseDocument(editor.getValue());
    if (to > doc.prose.length || from === to) return null;
    return { anchor: makeAnchor(doc.prose, from, to) };
  }
  async openSidebar(focusId) {
    const { workspace } = this.app;
    let leaf = workspace.getLeavesOfType(VIEW_TYPE_COMMENTS)[0];
    if (!leaf) {
      const right = workspace.getRightLeaf(false);
      if (!right) return null;
      leaf = right;
      await leaf.setViewState({ type: VIEW_TYPE_COMMENTS, active: true });
    }
    await workspace.revealLeaf(leaf);
    const view = leaf.view instanceof CommentSidebar ? leaf.view : null;
    if (view && focusId) view.focusComment(focusId);
    return view;
  }
  /** Scrollt im Markdown-Editor zur aufgelösten Anker-Stelle. */
  revealAnchor(file, anchor) {
    const leaf = this.app.workspace.getLeavesOfType("markdown").find((l) => {
      var _a;
      return l.view instanceof import_obsidian4.MarkdownView && ((_a = l.view.file) == null ? void 0 : _a.path) === file.path;
    });
    if (!leaf) {
      new import_obsidian4.Notice("File is not open in any editor.");
      return;
    }
    const view = leaf.view;
    void this.app.workspace.revealLeaf(leaf);
    const editor = view.editor;
    const doc = parseDocument(editor.getValue());
    const r = resolveAnchor(doc.prose, anchor);
    if (r.kind !== "resolved") {
      new import_obsidian4.Notice("Comment is orphaned \u2014 text passage not found.");
      return;
    }
    const fromPos = editor.offsetToPos(r.start);
    const toPos = editor.offsetToPos(r.end);
    editor.setSelection(fromPos, toPos);
    editor.scrollIntoView({ from: fromPos, to: toPos }, true);
  }
};

/* nosourcemap */