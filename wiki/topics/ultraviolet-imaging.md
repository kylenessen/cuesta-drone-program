# Ultraviolet Imaging

**Ultraviolet imaging** captures light in the band just beyond violet, at shorter wavelengths and higher energy than the eye can see. It has fewer drone applications than visible or infrared imaging, which is why the brainstorm flagged it as a topic to research rather than assume, but the applications it does have are vivid and teachable. On a drone the leading use is inspecting power lines for corona discharge, and off the aircraft ultraviolet imaging is a long-established tool in forensics and in the study of flowers and their pollinators. This page collects what a literature search actually turns up, so the section can be taught rather than hand-waved. [1]

## Why UV Imaging Is Harder to Build

An ordinary camera sensor is silicon, which responds well to visible and near-infrared light but poorly to ultraviolet, and ordinary camera glass absorbs much of the UV band before it ever reaches the sensor. Capturing ultraviolet therefore means deliberate engineering: quartz or fused-silica optics that pass UV, filters that block the far brighter visible and infrared light so the faint UV signal is not swamped, and detectors chosen or coated for UV sensitivity. This is the same filtering logic described in [Electromagnetic Spectrum](electromagnetic-spectrum.md) and [Digital Imaging](digital-imaging.md), pushed to the short-wavelength end of the range, and it is a large part of why UV payloads are specialized instruments rather than a mode on a standard camera.

## Corona Discharge Inspection

The one UV application built specifically for drones is corona-discharge detection on high-voltage equipment. When the electric field around a conductor, insulator, or fitting is strong enough to ionize the surrounding air, the discharge emits a small amount of ultraviolet light along with audible noise and radio interference. That UV emission is a direct early-warning signature of contamination, damaged insulators, loose or sharp hardware, and other faults that waste energy and can progress to failure. [2]

The engineering trick that makes this practical in daylight is the solar-blind camera. The atmosphere's ozone layer absorbs the sun's shortest ultraviolet wavelengths almost completely, leaving a "solar-blind" window in the deep UV, roughly the 240 to 280 nanometer range, where essentially no sunlight reaches the ground. A camera filtered to see only that window sees a black world with the corona's UV flashes standing out sharply, so inspection can run in broad daylight rather than only at night. Manufacturers such as Ofil build drone-mountable solar-blind UV corona cameras, typically paired with a visible camera so the operator can overlay the discharge onto a normal image and pinpoint the offending component from a safe standoff. [2] This makes corona inspection a natural companion to the thermal inspection work covered in [Drone Payloads](drone-payloads.md), catching a different class of electrical fault than a hot spot alone would reveal.

## Forensics

Away from drones, ultraviolet imaging is a standard forensic technique, worth showing students as a case of light revealing what visible photography cannot. Reflected-UV photography records how surfaces reflect and absorb ultraviolet differently than they do visible light, which brings out evidence that is otherwise invisible. It is used to photograph bruises and bite marks after they have faded from view, because long-wave UV interacts with marks absorbed below the skin surface; to detect and photograph latent fingerprints on non-porous surfaces, including with reflected-UV imaging systems that need no powder or chemical development; and to examine questioned documents, inks, and biological stains. Because it is non-destructive, ultraviolet examination is recommended as an early step before more invasive tests. [3][4]

## Floral Ecology and Pollinators

The example the developer reached for, flowers that look different under ultraviolet, is real and well documented. Many bee-pollinated flowers carry a "nectar guide," commonly a bull's-eye pattern of UV-absorbing petal bases and UV-reflecting tips, that is invisible to humans but conspicuous to bees and other pollinators, which see into the ultraviolet. These patterns steer a pollinator toward the flower's center and its reward, and experiments show they increase how readily pollinators find and handle the flower. [5][6] Ultraviolet photography is how researchers see these patterns at all, making floral UV imaging a clean teaching example of a sensor extending human perception into a band an animal already exploits. The developer also raised UV patterning in animals such as snakes; that case is less firmly documented than the floral one, so it is better presented as an open example than a settled fact.

## Related

- [Electromagnetic Spectrum](electromagnetic-spectrum.md) places ultraviolet beyond the violet end of visible light and explains the prefix.
- [Drone Payloads](drone-payloads.md) covers the solar-blind UV corona camera as a specialized inspection payload.
- [Digital Imaging](digital-imaging.md) covers the sensors and filters that ultraviolet imaging pushes to the short-wavelength end.
- [Multispectral Imaging](multispectral-imaging.md) covers the neighboring near-infrared band and its vegetation applications.

## Citations

[1] [Drone Course Content Brainstorm](../sources/drone-course-content-brainstorm.md), July 2026 course-content voice memo, section on the electromagnetic spectrum, flagging a literature search on ultraviolet imaging applications.
[2] Ofil Systems, UAV UV corona cameras for detecting partial discharge and arcing on power grids and substations. https://ofilsystems.com/products/uav-cameras/
[3] Crime-Scene-Investigator.net, "Ultraviolet Photography," on reflected-UV imaging of bruises, latent prints, documents, and biological evidence. https://www.crime-scene-investigator.net/ultravio.html
[4] Universe Optics, "UV Light in Forensics," on reflected ultraviolet imaging systems and their forensic uses. https://www.universeoptics.com/uv-light-in-forensics/
[5] USDA Forest Service, "Visual Cues," on ultraviolet nectar guides and how bees perceive UV floral patterns. https://www.fs.usda.gov/wildflowers/pollinators/Plant_Strategies/visualcues.shtml
[6] Koski, M.H., and Ashman, T.-L., "Dissecting pollinator responses to a ubiquitous ultraviolet floral pattern in the wild," Functional Ecology (2014). https://besjournals.onlinelibrary.wiley.com/doi/10.1111/1365-2435.12242

```tandem-comments
{
  "solar-blind": {
    "anchor": {
      "exact": "roughly the 240 to 280 nanometer range"
    },
    "status": "open",
    "thread": [
      {
        "author": "Claude",
        "ts": "2026-07-11T00:00:00Z",
        "text": "The solar-blind window figure was aggregated from search results, not a single primary spec sheet. It is consistent with ozone-absorption physics, but spot-check the exact nanometer range before quoting it in student-facing material."
      }
    ]
  }
}
```
