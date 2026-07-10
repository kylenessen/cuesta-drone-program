# Prescription Maps

A **prescription map**, also called a variable-rate or targeted-application map, is a spatial instruction that tells farm machinery how much of an input to apply at each location in a field, so that fertilizer, seed, water, or spray is varied across the field instead of applied at one flat rate. It is the step that turns a drone survey from a picture into an action, and it is the most concrete answer to the question a skeptical grower asks, which is what the map actually does for them. Teaching this pipeline matters because it connects the sensor and index work in [Vegetation Indices](/topics/vegetation-indices.md) and [Agricultural Drone Applications](/topics/agricultural-drone-applications.md) to the tractor in the field, and it is where drone data either proves its value or fails to. This page walks the pipeline from an index map to a file a machine can run, and the honest limits along the way.

## From index map to management zones

A raw index map has a value for every pixel, and no machine or agronomist wants to act on tens of millions of individual pixels. The first step is to reduce the continuous map into a small number of management zones, meaning contiguous areas the equipment will treat as uniform. Software groups pixels with similar index values, and often similar values across several data layers, into a handful of zones, typically somewhere between two and five, that are large enough for a machine to respond to at working speed. This zonation step is where agronomy enters, because the zones only make sense if they correspond to a real cause the grower can act on, and the person building the map decides how many zones are useful and whether the pattern reflects something manageable rather than noise. The resulting zonation map can be exported on its own as a shapefile, KML, or GeoJSON for review before any rates are attached [1].

## Attaching a rate to each zone

A zone map becomes a prescription when someone assigns an application rate to each zone, meaning the pounds of nitrogen, seeds per acre, or gallons of spray that zone should receive. This is an agronomic decision, not a drone one. The imagery says where the field differs, and the grower or their agronomist decides what to do about each difference, drawing on the crop, the input, the economics, and often a soil test or tissue sample the drone never sees. A vigor map might drive more nitrogen into the weak zones to even the field out, or less input into them if they are weak for a reason more inputs will not fix, and only agronomic judgment settles which. The exported prescription shapefile carries these rates in its attribute table alongside the zone geometry, with columns for the assigned amount and rate per unit area [1].

## The file the machine consumes

The last step is getting the prescription into a format the tractor or sprayer's control terminal understands, and this is where the pipeline meets a fragmented equipment world. Two formats dominate. A shapefile is read by most terminals on the market and is the common recommendation, and the prescription is delivered as a shapefile whose attribute table holds the per-zone rates [1] [2]. ISOXML, the data format defined under the ISO 11783 standard better known as ISOBUS, is the standardized alternative, and it is what many major-brand terminals expect, including Case, New Holland, AGCO, Trimble, CLAAS, Topcon, Kubota, and others [3] [4]. Agricultural mapping software such as Pix4Dfields exports both, and newer versions add direct integrations with manufacturer platforms like John Deere Operations Center so the file moves to the machine without a memory card [2] [5]. The practical teaching point is that a beautiful prescription is useless if it will not load into the specific terminal in the specific tractor, so the professional confirms the target machine's format and coordinate expectations before delivering, and sometimes has to convert between formats for a particular brand [1].

## Closing the loop

The pipeline does not end when the machine applies the input. Modern equipment records an as-applied map, meaning what was actually put down where, which the grower can compare against the prescription to verify the operation happened as planned and to feed the next season's decisions. This closes the loop from observation to action to verification, and it is the fullest form of the value proposition, because it shows the drone survey producing a measurable change in how the field was managed rather than just an image on a screen. Where a follow-up drone flight later in the season shows how the crop responded, the loop extends into the multi-date monitoring covered in [Change Detection and Repeat Mapping](/topics/change-detection-and-repeat-mapping.md).

## Where the pipeline breaks

Several honest limits are worth teaching alongside the workflow. The prescription is only as good as the index map behind it, so an uncalibrated or badly timed survey produces a confident-looking map of noise, which is why the calibration discipline in [Multispectral Field Practice](/topics/multispectral-field-practice.md) is upstream of everything here. Zones drawn from a single date can reflect a transient condition rather than a stable management pattern, so durable zonation often blends several dates or several data layers. The geometry has to be accurate enough that the right rate lands on the right ground at machine speed, which ties the survey's positioning back to the accuracy topics in the mapping layer. And the whole exercise only pays when the input is expensive enough, and the field variable enough, that varying the rate beats a flat rate by more than the cost of making the map. On a small, uniform field, a flat rate is the right answer and the prescription is overhead.

## Related

- [Agricultural Drone Applications](/topics/agricultural-drone-applications.md) for the nutrient and stress maps that feed prescriptions.
- [Vegetation Indices](/topics/vegetation-indices.md) for the index choices behind the zones.
- [Multispectral Field Practice](/topics/multispectral-field-practice.md) for the calibration a trustworthy prescription depends on.
- [Change Detection and Repeat Mapping](/topics/change-detection-and-repeat-mapping.md) for verifying crop response across dates.
- [Mission Cost Analysis](/topics/mission-cost-analysis.md) for when variable-rate mapping is worth its cost.

## Citations

[1] PIX4Dfields, How to export a variable application rate map to a tractor terminal. https://support.pix4d.com/hc/en-us/articles/360038644731
[2] PIX4Dfields, Inputs and outputs. https://support.pix4d.com/hc/en-us/articles/360000897346
[3] PIX4Dfields, How to export ISOXML / ISOBUS format in PIX4Dfields. https://support.pix4d.com/hc/en-us/articles/14602334120477
[4] PIX4Dfields, How to export a variable rate map to terminals of different tractor/sprayer brands. https://support.pix4d.com/hc/en-us/articles/360038644731
[5] Pix4D, PIX4Dfields 2.5: John Deere integration and ISOBUS export. https://www.pix4d.com/blog/pix4dfields-JohnDeere-integration-isobus-export
