# Camera Exposure

**Camera Exposure** is the total amount of light a camera records in a single image, controlled by three settings. Shutter speed sets how long light falls on the sensor. Aperture sets how large the lens opening is. ISO sets how much the recorded signal is amplified afterward. Photographers call this the exposure triangle because changing one setting forces a tradeoff in the others. In drone mapping the triangle is not just an aesthetic concern. Bad exposure choices produce motion blur, noise, or soft images, and all three degrade the tie points that photogrammetry software depends on.

## The three controls

Shutter speed is the exposure time, written as a fraction of a second such as 1/1000 s. It is the only control that directly fights motion blur, which makes it the most important setting on a moving aircraft. The DJI Matrice 4E wide camera offers a mechanical shutter from 2 s to 1/2000 s and an electronic shutter from 2 s to 1/8000 s [1].

Aperture is the f-number, such as f/2.8 or f/11. A lower number means a wider opening and more light. Aperture also affects sharpness. Most lenses are softest wide open and sharpest a stop or two down. At very small apertures, diffraction spreads each point of light across multiple pixels and softens the whole frame. On small-pixel drone sensors this penalty arrives early, so apertures in the middle of the range, roughly f/4 to f/5.6 on a camera like the Matrice 4E with its f/2.8 to f/11 range [1], are generally the practical sweet spot. Treat that range as guidance rather than a verified spec, since DJI does not publish lens sharpness curves.

ISO is widely misunderstood. Raising ISO does not make the sensor more sensitive. The sensor's ability to convert photons into charge is fixed by its physics. ISO instead controls amplification, a gain applied to the sensor readout before or during analog-to-digital conversion [2]. The signal and the noise trapped within it are amplified together. Most of the visible noise in a high-ISO image is shot noise, the statistical randomness of photon arrival, which is large relative to the signal whenever little light was captured [3]. The practical lesson is that ISO 6400 is not a source of light. It is a way of stretching a starved signal, and the stretch makes the starvation visible. The only real fixes are more exposure time, a wider aperture, or more ambient light.

## Motion blur and the shutter speed floor

While the shutter is open, the drone keeps moving, so every ground point smears across the image by a distance equal to flight speed multiplied by exposure time. That smear only matters relative to pixel size on the ground, the ground sample distance (GSD). The rule of thumb is to keep the smear below the GSD, and ideally below about half of it, with one third sometimes cited for high-precision work [4] [5].

The check is simple. Blur in pixels equals speed times exposure time divided by GSD. At 10 m/s with a 1/1000 s shutter, the aircraft moves 1 cm during the exposure. Against a 3 cm GSD that is about a third of a pixel, comfortably sharp. Slow the shutter to 1/250 s and the smear grows to 4 cm, more than a full pixel, and fine texture starts to wash out. When light forces a slower shutter, the escape valves are flying slower or flying higher, since a coarser GSD tolerates more smear [4].

## A practical strategy for mapping flights

Full auto exposure is risky for mapping because the camera may quietly pick a slow shutter over a dark surface, and one blurry image band can degrade a whole reconstruction. The widely recommended approach is to fix the variable that hurts most and let the others float. Set shutter priority with a fixed speed fast enough for the planned flight speed and GSD, commonly in the 1/500 to 1/1000 s range for typical small-drone missions, keep ISO as low as conditions allow, ideally at or near base ISO 100, and let aperture adjust automatically to track changing brightness [6] [7].

Cap the auto ISO if the camera allows it, since noise past roughly ISO 800 on small sensors visibly costs detail, and check the histogram or a test image before committing to a long mission. In very bright light, watch that auto aperture does not stop all the way down to f/11 and trade motion blur for diffraction blur. In dim light, accept a coarser GSD or a slower flight speed rather than an extreme ISO. Consistent, slightly conservative exposure across the whole flight produces better photogrammetric results than frame-by-frame optimization [6].

## Related

- [Cameras for Drone Mapping](cameras-for-drone-mapping.md) for the hardware side of image quality.
- [Ground Sample Distance](ground-sample-distance.md) for the pixel footprint that motion blur is measured against.
- [Lighting and Sun Angle for Mapping](lighting-and-sun-angle-for-mapping.md) for the light the exposure has to work with.
- [Digital Imaging](digital-imaging.md) for how the sensor turns light into numbers in the first place.

## Citations

[1] DJI, Matrice 4 Series Specs, https://enterprise.dji.com/matrice-4-series/specs
[2] LM Microscope Systems, Sensor sensitivity (ISO) in digital cameras, https://www.lmscope.com/en/Digital_Camera_Sensitivity_ISO_en.html
[3] Lonely Speck, How to Find the Best ISO for Astrophotography: Dynamic Range and Noise, https://www.lonelyspeck.com/how-to-find-the-best-iso-for-astrophotography-dynamic-range-and-noise/
[4] Richard Hann, NTNU, Preventing motion blur in drone mapping, https://www.ntnu.no/blogger/richard-hann/2021/10/07/preventing-motion-blur-in-drone-mapping/
[5] Drones Made Easy, Motion Blur and Automatic Light-based Speed Adjustment, https://support.dronesmadeeasy.com/hc/en-us/articles/208235483-Motion-Blur-and-Automatic-Light-based-Speed-Adjustment
[6] Pix4D, Designing the Image Acquisition Plan: Configuring the Camera Settings, https://support.pix4d.com/hc/en-us/articles/202557419
[7] Inflights, DJI Phantom 4 RTK Exposure setting for drone mapping, Shutter Priority mode, https://help.inflights.com/en/articles/6161423-dji-phantom-4-rtk-exposure-setting-for-drone-mapping-shutter-priority-mode
