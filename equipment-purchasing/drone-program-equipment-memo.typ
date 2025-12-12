// Cuesta College Drone Program Equipment Memo
// Draft for Ron Overacker
// Author: Kyle Nessen
// Date: December 2025

#import "cuesta-memo.typ": cuesta-memo

#cuesta-memo(
  title: "Drone Program Equipment Planning",
  audience: "Ron Overacker",
  author: "Kyle Nessen",
  date: "December 11, 2025",
  body: [

= Overview

This memo outlines equipment needs for two courses in Cuesta College's drone program: AERO 100 (Basic UAV Operator), which has an approved course outline, and an advanced mapping course currently in curriculum development. I address AERO 100 in detail here, and provide some considerations for the advanced course.

As I understand, we have approximately \$80,000 available for equipment purchases. The DJI Matrice 4T and Matrice 4E enterprise drones have already been secured through separate funding.

= AERO 100: Basic UAV Operator

== Purpose

AERO 100 prepares students for FAA Part 107 certification and builds flight proficiency with drones. It introduces some of the more advanced topics as well, such as mapping, public safety, and agriculture.

== Flight Training Drones

Consumer-level drones are ideal for beginners building flight competency. DJI drones are particularly well suited for training because of their ease of use, safety features, and cost. Smaller consumer drones are less intimidating for new pilots, present less liability if crashes occur, and use the same control scheme as larger professional aircraft. Each drone has its own handling characteristics, but the skills transfer directly.

Lab sessions will be hands-on, which creates a practical constraint: I can only safely supervise a limited number of concurrent flights. DJI's geofencing capabilities help here, and with adequate space we could have multiple drones airborne simultaneously. Even so, I would limit operations to three to six drones at once.

Two drone options would fit this course well:

=== DJI Mini 3

This is the most affordable option that provides everything we need for effective training. Despite their small size, these are capable drones. Their light weight means they do not require FAA registration, which simplifies the administrative side. The Fly More package includes spare batteries and the RC controller with a built-in screen, eliminating the need for separate smartphones or tablets. This self-contained setup streamlines the student experience and makes equipment management more reliable.

The tradeoffs: the Mini 3 handles strong winds less effectively than larger drones, and image quality is modest (though secondary for a flight training course). The small form factor might feel less serious to some students, though this same quality makes it approachable for those intimidated by the technology. If a Mini 3 does crash, its low mass minimizes risk of damage to property or people.

A few of these would be a worthwhile addition to the fleet.

#figure(
  image("images/dji-mini-3.png", width: 60%),
  caption: [#link("https://www.amazon.com/dp/B0BL3R3L45")[DJI Mini 3 Fly More Combo (DJI RC)] | \$719 before tax],
)

=== DJI Air 3

The Air series is a step up from the Mini line. These mid-level consumer drones handle wind better and offer longer battery life, though without the most advanced photographic capabilities. The image quality is still very good, and the dual-lens system (wide and telephoto) adds instructional flexibility. The Air 3 also features omnidirectional obstacle avoidance, the most comprehensive collision prevention available in this class. The larger size requires FAA registration, though this is a minor administrative task.

The Air 3 feels more substantial in hand and in flight. The Fly More package includes the RC controller with built-in screen and extra batteries. If budget allows, this would be my preferred primary training drone. A mixed fleet of Air 3s and Mini 3s could also work well, balancing cost savings with variety in the aircraft students experience.

#figure(
  image("images/dji-air-3.png", width: 60%),
  caption: [#link("https://www.amazon.com/dp/B07FRWP5HX")[DJI Air 3 Fly More Combo with DJI RC 2] | \$1,939 before tax],
)

=== Why Not The Newest Drones?

DJI drones are increasingly difficult to source right now. Any drone in the Mini or Air series would work for our purposes, provided it includes the RC controller with built-in screen. These two models represent the best value currently available on Amazon. Newer models would be nice, but they do not offer significant improvements over these recommendations, which can be purchased today.

== Accessories

The accessory requirements are minimal for these drones. A few items will be helpful for field operations and equipment management.

=== Field Charging

For extended flight sessions, like a three hour lab, you either need more batteries or some way to charge in the field. I generally opted for field charging, as drone batteries are expensive. Managing power in the field also provides a useful instructional activity.

The Fly More packages include three batteries per drone, which provides roughly 90 minutes of flight time before needing to rotate in recharged batteries. A portable power station can keep batteries cycling through a full lab session. A 1024Wh power station can recharge approximately 13 Air 3 batteries or 21 Mini 3 batteries, which supports a fleet of 4-5 drones through a full session. Adding an _optional_ 220W solar panel provides roughly 385Wh of additional capacity over a 2.5-hour session (assuming decent sunlight), bringing the effective total to around 1,400Wh. This comfortably supports 6 drones with margin to spare.

Third party chargers are also necessary for field charging, as they allow for parallel charging. While the charger each drone comes with can accommodate 3 batteries, they are charged one by one. These additional chargers can charge all connected batteries at the same time. The provided chargers are still useful for prepping before a lab, where they connect to a 500W USB charger in the office.

In total, these items should allow for as much flight time as needed for a full 3 hour lab session.

- #link("https://www.amazon.com/dp/B0FRMQPZF6")[EcoFlow DELTA 3 with 220W Portable Solar Panel (bundled)] | \$599 (current sale)
- #link("https://a.co/d/0qWA51W")[Parallel Fast Charger for DJI Air 3] (×2) | \$56 each
- #link("https://a.co/d/bhSoJLd")[Parallel Fast Charger for DJI Mini 3] (×2) | \$60 each
- #link("https://a.co/d/aLcd0xN")[500W USB C charger] | \$70

=== Lab Materials

The NIST Open Test Lanes are a well-designed set of standardized tests for flight competency. Instead of specifying the full list of items, I allocated \$250 to the budget below for a Home Depot run to build out the "omni buckets" and cover other miscellaneous costs (e.g. power strips).

=== Storage and Protection

These items are not strictly necessary, but help protect and organize the equipment. A single Pelican-style case to house the whole drone fleet would be ideal for transport and storage, containing all drones, controllers, and batteries in one place. The specific case depends on how many drones we order, but I provide a price range below.

Landing pads keep drones out of the dirt during field operations and can double as targets for lab exercises. A label maker also helps identify each drone and controller, which simplifies fleet management.

- Pelican-style case | \$150-300 (depending on size)
- #link("https://www.amazon.com/dp/B0FQJ65KJD")[STARTRC Drone Landing Pad (22")] (×6) | ~\$20 each
- #link("https://www.amazon.com/dp/B0B1L3BL1G")[Brother P-Touch Label Maker] | ~\$45

== Cost Summary

Above I lay out the items that I think are necessary for lab activities, and provided a few quantities, but mostly left it open for discussion on how to approach purchasing. Below are all the costs compiled in a _suggested_ scenario. I think this balances a diversity of drones and maximizes the number of students that can participate in lab. I'm happy to discuss this and change the purchasing strategy as necessary.

#table(
  columns: (auto, auto, auto, auto),
  align: (left, center, right, right),
  table.header[*Item*][*Qty*][*Unit Price*][*Subtotal*],
  table.hline(),
  [#link("https://www.amazon.com/dp/B0BL3R3L45")[DJI Mini 3 Fly More Combo]], [3], [\$719], [\$2,157],
  [#link("https://www.amazon.com/dp/B07FRWP5HX")[DJI Air 3 Fly More Combo]], [3], [\$1,939], [\$5,817],
  table.hline(),
  [#link("https://www.amazon.com/dp/B0FRMQPZF6")[EcoFlow DELTA 3 + Solar Panel]], [1], [\$599], [\$599],
  [#link("https://a.co/d/0qWA51W")[Parallel Charger (Air 3)]], [2], [\$56], [\$112],
  [#link("https://a.co/d/bhSoJLd")[Parallel Charger (Mini 3)]], [2], [\$60], [\$120],
  [#link("https://a.co/d/aLcd0xN")[500W USB-C Charger]], [1], [\$70], [\$70],
  table.hline(),
  [Pelican-style Case], [1], [~\$300], [~\$300],
  [#link("https://www.amazon.com/dp/B0FQJ65KJD")[Landing Pads]], [6], [\$20], [\$120],
  [#link("https://www.amazon.com/dp/B0B1L3BL1G")[Label Maker]], [1], [\$45], [\$45],
  [Open Lane Level II NIST Course Materials], [--], [--], [~\$250],
  table.hline(),
  [], [], [*Subtotal*], [*\$9,590*],
  [], [], [Tax (~8.5%)], [\$815],
  [], [], [*Estimated Total*], [*\$10,405*],
)

= AERO 10X: Advanced Mapping

== Purpose

This course teaches mapping and photogrammetry workflows using the Matrice 4E and 4T enterprise drones on order, and potentially NDAA compliant "American Made" drones. Students will learn to capture survey-grade data, process it into deliverables like orthomosaics and 3D models, and understand the accuracy considerations that matter in professional work.

== Equipment Overview

The advanced course requires significantly more investment than AERO 100. The major categories include:

*GNSS and RTK.* The Matrice drones support RTK and PPK positioning, which dramatically improves accuracy over consumer drones. To take advantage of this, we need a GNSS base station and rover setup. I recommend Emlid units over Trimble and DJI. Emlid offers excellent value without sacrificing capability, and students entering the workforce should be adaptable to different tools anyway.

For the base station, the #link("https://store.emlid.com/products/reach-rs4")[Emlid Reach RS4] is newly available for preorder at \$3,900. This is a full-featured unit that can broadcast RTK corrections to both our drones and a field rover. For the rover, the #link("https://store.emlid.com/products/reachrx2")[Emlid Reach RX2] at \$2,400 is purpose-built for mobile data collection. It connects to a smartphone or tablet running apps like ArcGIS Field Maps or Survey123, which is how most professional field work happens now. Emlid also offers a #link("https://store.emlid.com/products/base-and-rover-accessories-kit")[Base and Rover Accessories Kit] for \$1,294 that includes the tripod, tribrach, survey pole, and bipod we would need.

*Ground Control.* Even with RTK, ground control points are fundamental to professional mapping workflows. This means targets, markers, and the knowledge to place them correctly.

*Software.* Flight planning software with terrain-following capability is essential given our local topography. Photogrammetry processing software is the other major piece. There are several options here ranging from subscription services like DroneDeploy to perpetual licenses like Agisoft Metashape. I have not settled on a recommendation yet and want to explore what educational pricing is available. All the same, I think we can expect thousands of dollars in this category, but not more than ten thousand.

*Workstations.* Photogrammetry processing is computationally intensive. We will need capable computers, though the specific requirements depend on which software we choose. Do we have access to a computer lab with reasonably powerful machines? Here is #link("https://www.agisoft.com/downloads/system-requirements/")[Metashape's system requirements], which should help direct the conversation. Alternatively, I can look into cloud based processing solutions that will let us work with any computer for a subscription fee.

*Batteries and Accessories.* The enterprise drones will need additional batteries and charging infrastructure beyond what ships with the aircraft. The powerbank I listed above would likely be too underpowered for our mapping needs, so we might need something with more capacity or alternative gas generators. I can dig into this more as we get further along.

I will prepare a detailed equipment list and cost estimate once the curriculum is further developed. In the meantime, I recommend purchasing the Emlid GNSS setup described above. This totals approximately \$7,594 before tax, and it would allow us to begin testing and developing course materials using the enterprise drones we already have.

== Budget Question

One question for you: does this funding need to be spent within a particular timeframe, or can it sit until we are ready? I would prefer to finalize the AERO 100 purchases first and take more time with the advanced course equipment, but if there is a use-it-or-lose-it constraint, we can accelerate the planning.

= Next Steps

I recommend we proceed with the AERO 100 equipment as outlined above, along with the Emlid GNSS equipment to complement the Matrice 4E and 4T. This gets both courses moving while leaving room to refine the larger equipment plan. If you would like to adjust the drone mix or discuss alternatives, I am happy to revise.
  ],
)
