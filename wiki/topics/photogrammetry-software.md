# Photogrammetry Software

**Photogrammetry Software** turns a folder of overlapping drone photos into point clouds, elevation models, and orthomosaics. The underlying math is broadly shared across products, so the real differences are workflow philosophy, cost structure, and where your data lives. The market splits into desktop packages that trade convenience for control, cloud platforms that trade control for convenience, and open source tools that trade polish for freedom.

## Agisoft Metashape

Metashape is the desktop power tool of the field. Every pipeline stage is exposed, from alignment parameters through depth map quality to seamline editing, and it adds Python scripting and network processing for automation [1]. That control is exactly what makes it attractive for teaching, since the pipeline is visible rather than hidden behind an upload button. The Professional edition carries the mapping features that matter, including georeferencing, ground control support, and DEM and orthomosaic generation, while the cheaper Standard edition targets 3D modeling and lacks the survey toolset [2]. Licensing is a one-time perpetual purchase rather than a subscription, and education pricing is aggressive. Accredited institutions pay 549 dollars for a Professional educational license and 59 dollars for Standard, both rehostable node-locked licenses, with floating educational licenses available by quote [3]. Data ownership is total because nothing ever leaves the machine.

## Pix4D

Pix4D sells a suite rather than a single product. PIX4Dmatic is the current desktop photogrammetry engine for large survey projects, PIX4Dcloud is the browser-based processing and collaboration platform, and PIX4Dfields serves agriculture, with PIX4Dcatch covering ground-based capture [4]. PIX4Dmapper, the product that built the company, is legacy at this point. Pix4D announced that the Pix4Dmapper pipeline would be fully decommissioned from its cloud products at the end of February 2026 [5]. Recent PIX4Dmatic releases have absorbed the survey and vectorization tooling that previously lived in a separate PIX4Dsurvey license, though tier details keep shifting and should be checked against current Pix4D pages before budgeting. Pix4D is subscription-first with per-product pricing, and it offers educational licensing programs. It occupies a middle ground, more guided than Metashape and more capable of survey rigor than the pure cloud services.

## DroneDeploy

DroneDeploy is the simplicity end of the spectrum. Flight planning, upload, cloud processing, and browser-based analysis live in one subscription platform, so a user can go from mission to shareable map without owning serious hardware or understanding the pipeline. Published pricing starts at 329 dollars per month for an individual plan, billed annually, with higher tiers and enterprise quotes above that [6]. Processing happens on DroneDeploy's servers with typical turnaround measured in hours. The tradeoffs are the mirror image of Metashape. There is little control over reconstruction parameters, the recurring cost is high for an education budget, plan tiers cap images per map, and imagery must be uploaded to a vendor cloud, which raises data ownership and retention questions that matter for some clients and agencies.

## OpenDroneMap and WebODM

OpenDroneMap is the open source option, a command line toolkit that produces orthomosaics, classified point clouds, DSMs and DTMs, and textured meshes [7]. WebODM wraps the engine in a self-hosted web interface with project management, measurement, and volume tools, and it runs fully offline on your own hardware for free [8]. The ecosystem is evolving. In 2026 the WebODM project announced it had decoupled from OpenDroneMap and now fronts multiple processing engines, including its own ODX engine, through a REST API layer [8]. A paid hosted option, WebODM Lightning, exists for those who want cloud processing without self-hosting. For a program, open source offers zero license cost, complete data ownership, and the pedagogical benefit of inspectable source, at the price of rougher edges and community-level support.

## Other players

Two more are worth knowing. RealityScan, formerly RealityCapture and now owned by Epic Games, is a very fast desktop engine that is free for students, educators, and users under 1 million dollars in annual revenue [9]. It leans toward 3D modeling and visual effects more than survey deliverables, but the price is hard to ignore. DJI Terra is DJI's own desktop mapping package, tightly integrated with DJI aircraft including the Matrice series. It is Windows-only with an NVIDIA GPU requirement, and licensing runs through subscriptions and dealer-sold perpetual seats [10].

## Hardware requirements and processing time

Desktop photogrammetry is one of the few classroom workloads that genuinely stresses a workstation. Agisoft's published basic configuration is a 4 to 12 core CPU, 16 to 32 GB of RAM, and a mid-range GPU with at least 1024 shader units, with an RTX 2060 given as an example. Its advanced configuration moves to 32 to 128 GB of RAM and one or two GPUs of RTX 3080 class [11]. Agisoft is blunt that available RAM caps the maximum project size a machine can process [11]. OpenDroneMap publishes a similar scaling table, roughly 16 GB of RAM for a 250 image project, 32 GB for 500 images, and 64 GB for 1500 [12]. Storage needs are easy to underestimate. Raw images, intermediate depth maps, and exports mean a single project can consume tens of gigabytes, so a fast NVMe SSD with generous free space is a practical requirement.

For planning purposes, a typical student dataset of 200 to 500 images processed at medium to high quality on hardware near Agisoft's basic configuration generally completes in the range of one to a few hours end to end, while cloud services quote similar turnaround for standard jobs. Vendors do not publish firm benchmarks, and times swing widely with image resolution, quality settings, and GPU, so pilot runs on the actual lab machines are the only trustworthy estimate.

## Related

- [Structure from Motion](/topics/structure-from-motion.md) for the pipeline these products implement.
- [Orthomosaics](/topics/orthomosaics.md) and [Elevation Models](/topics/elevation-models.md) for the outputs.
- [Mission Planning Software](/topics/mission-planning-software.md) for the capture side of the toolchain.
- [Geospatial Data Management](/topics/geospatial-data-management.md) for handling what the software produces.

## Citations

[1] Agisoft Metashape Professional Edition User Manual, version 2.2. https://www.agisoft.com/pdf/metashape-pro_2_2_en.pdf
[2] Agisoft, Licensing Options and edition comparison. https://www.agisoft.com/buy/licensing-options/
[3] Agisoft, Educational License online store. https://www.agisoft.com/buy/online-store/educational-license/
[4] Pix4D, product overview. https://www.pix4d.com/
[5] Pix4D Support, Uploading Project Files from PIX4Dmapper to PIX4Dcloud for Processing. https://support.pix4d.com/hc/en-us/articles/202558589
[6] DroneDeploy, Pricing. https://www.dronedeploy.com/pricing
[7] OpenDroneMap, ODM open source toolkit. https://opendronemap.org/odm/
[8] WebODM, drone mapping software. https://webodm.org/
[9] RealityScan, RealityScan 2.0 release announcement. https://www.realityscan.com/news/realityscan-20-new-release-brings-powerful-new-features-to-a-rebranded-realitycapture
[10] DJI Enterprise, DJI Terra. https://enterprise.dji.com/dji-terra
[11] Agisoft, Metashape System Requirements. https://www.agisoft.com/downloads/system-requirements/
[12] OpenDroneMap Documentation, Installation and Hardware Recommendations. https://docs.opendronemap.org/installation/
