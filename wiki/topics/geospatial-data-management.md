---
type: Topic
title: Geospatial Data Management
description: Professional practices for organizing, archiving, and delivering drone mapping data, from folder structures and flight logs to cloud optimized GeoTIFFs and client delivery packages.
tags: [mapping]
acs_area: general
timestamp: 2026-07-09T18:00:00Z
---

# Geospatial Data Management

**Geospatial Data Management** is the unglamorous half of drone mapping. Flying the mission produces data. Everything after that, organizing it, archiving it, and getting it into a client's hands in a form they can actually use, is what makes the work professional. A mapping operation that cannot find last year's raw imagery, or that delivers a 40 gigabyte orthomosaic the client cannot open, has failed at the part of the job the client is paying for. The habits below are conventions, not regulations, but they are the conventions that separate durable operations from piles of SD cards.

## Project structure and naming

Every project should live in one self contained folder with a predictable internal layout. A common pattern starts with a date and site identifier, for example 2026-07-09_morro-bay-marsh, and splits into subfolders for raw imagery, ground control, processing projects, exports, flight logs, and delivery. The date-first ISO format (YYYY-MM-DD) sorts chronologically by default, which matters once a site has been flown twenty times. Names should avoid spaces and special characters, since both still break command line tools and some GIS software. The test of a good structure is whether a stranger could locate the raw images and the final orthomosaic without asking. Consistency across projects matters more than the specific scheme chosen.

## What to archive and how big it gets

Raw imagery is the irreplaceable asset. Processed products can be regenerated from raw photos and ground control, but the photos cannot be reflown, at least not for the same date. Archive the raw images untouched, the GCP coordinates and field notes, the photogrammetry project file, the key exports, and the flight logs. Sizing is easy to underestimate. A modern mapping camera produces images around 10 to 25 megabytes each, and a modest site can require several hundred to several thousand photos, so raw imagery alone commonly runs 5 to 50 gigabytes per flight day. Processing multiplies that, since dense point clouds, meshes, and orthomosaics often exceed the raw data in size. A busy operator should plan in terabytes per year and follow the standard backup rule of three copies, on two different media, with one offsite. Cloud object storage works well as the offsite copy for archives that are written once and rarely read. USGS guidance on UAS data management reflects the same principle: preserve raw data and document processing so products are reproducible [1].

## Flight logs and their compliance value

Most flight platforms and ground control apps record telemetry logs automatically, and services such as AirData, Aloft, and DroneLogbook sync and archive them. Under Part 107 there is no general logbook requirement, but logs earn their keep in three ways. They document compliance if the FAA investigates an incident or complaint, they establish the maintenance and battery history that FAA Advisory Circular 107-2A recommends operators track [2], and they satisfy clients and insurers who increasingly ask for proof of where and when an aircraft flew. On federally funded or agency work, the flight log is often a contract deliverable in its own right. Treat logs as project records and archive them with the imagery.

## Delivering orthomosaics

A processed orthomosaic is typically a GeoTIFF, and at survey resolution the files get large. A few centimeters per pixel over a few hundred acres easily produces a file of several gigabytes to tens of gigabytes. Handing a client a raw file that size is rarely the right move. The modern answer is the cloud optimized GeoTIFF, a regular GeoTIFF whose internal tiling and overviews let software read just the needed portion over HTTP instead of downloading the whole file [3]. A COG sitting in cloud storage can feed QGIS, ArcGIS, and web viewers directly. Always generate with internal overviews and sensible compression. JPEG compression inside a COG can shrink an RGB ortho dramatically with little visual loss, while lossless options like DEFLATE or LZW suit analytical products.

For clients who want to click a link rather than load a file, tile services and web viewers do the job. ArcGIS Online is the common institutional choice, publishing the ortho as a hosted tile or imagery layer in a shareable web map [4]. Open alternatives include serving XYZ tiles from a COG with lightweight tools such as TiTiler or gdal2tiles, or platform services like Esri Site Scan, DroneDeploy, and Pix4Dcloud, and the open source WebODM includes its own viewer [5]. For GIS-literate clients, the simplest professional handoff is a plain QGIS package, meaning the COG plus a .qgz project file with the layers styled and a defined coordinate reference system, which opens identically on any machine with free software [6].

## The delivery package

A clean delivery package is a folder or download link containing the products, the documentation, and nothing else. Convention is a top level README or report stating the flight date, aircraft and sensor, ground sample distance, coordinate reference system and datum, ground control method and accuracy, and processing software with version. Alongside it go the orthomosaic as a COG, any elevation products (DSM and DTM as GeoTIFFs), the point cloud if contracted (LAS or compressed LAZ), and a processing report exported from the photogrammetry software. State the CRS explicitly in the documentation, not just in the file headers. Unstated datums are the most common source of client-side confusion, especially where clients mix NAD83 and WGS84 based data. Deliver via a stable link, keep a copy of exactly what was sent, and version any revisions rather than overwriting them.

## Related

- [Orthomosaics](/topics/orthomosaics.md) and [Elevation Models](/topics/elevation-models.md) for the products being packaged.
- [Map Projections and Coordinate Systems](/topics/map-projections-and-coordinate-systems.md) and [Vertical Datums and Geoid Models](/topics/vertical-datums-and-geoid-models.md) for the CRS documentation the package must carry.
- [Photogrammetry Software](/topics/photogrammetry-software.md) for the processing reports and project files worth archiving.
- [Mission Cost Analysis](/topics/mission-cost-analysis.md) for the desk hours this work represents.

## Citations

[1] USGS, National Uncrewed Systems Office resources. https://www.usgs.gov/uas
[2] FAA Advisory Circular 107-2A, Small Unmanned Aircraft System (Small UAS). https://www.faa.gov/documentLibrary/media/Advisory_Circular/AC_107-2A.pdf
[3] Cloud Optimized GeoTIFF specification and overview. https://cogeo.org/
[4] Esri, ArcGIS Online documentation, publish hosted imagery and tile layers. https://doc.arcgis.com/en/arcgis-online/manage-data/publish-tiles.htm
[5] OpenDroneMap / WebODM documentation. https://docs.opendronemap.org/
[6] QGIS documentation, working with projects and raster data. https://docs.qgis.org/latest/en/docs/user_manual/
