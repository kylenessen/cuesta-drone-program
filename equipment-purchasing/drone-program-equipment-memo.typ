// Cuesta College Drone Program Equipment Memo
// Draft for Ron Overacker
// Author: Kyle Nessen
// Date: December 2025

#set document(title: "Drone Program Equipment Planning")
#set page(margin: 1in)
#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true)
#set figure(numbering: none)
#show link: set text(fill: blue)
#show link: underline

#align(center)[
  #text(size: 16pt, weight: "bold")[Cuesta College Drone Program]
  #linebreak()
  #text(size: 14pt)[Equipment Planning Memo]
  #linebreak()
  #text(size: 10pt, style: "italic")[Draft for Discussion]
]

#v(1em)

= Overview

This memo outlines equipment needs for two courses in Cuesta College's drone program: primarily AERO 100 (Basic UAV Operator), which has an approved course outline, and an advanced mapping and photogrammetry course currently in curriculum development.

As I understand, we have approximately \$80,000 available for equipment purchases. The DJI Mavic 4T and Mavic 4E enterprise drones have already been secured through separate funding.

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

Fortunately, there's not too much else we need to buy to get these drones fully operational. Still, there are a few things that I will list below that will be very helpful to our operations.

=== Field Charging

For extended flight sessions, like a three hour lab, you either need more batteries or some way to charge in the field. I generally opted for field charging, as drone batteries are expensive. Managing power in the field also provides a useful instructional activity.

The Fly More packages include three batteries per drone, which provides roughly 90 minutes of flight time before needing to rotate in recharged batteries. A portable power station can keep batteries cycling through a full lab session. A 1024Wh power station can recharge approximately 13 Air 3 batteries or 21 Mini 3 batteries, which supports a fleet of 4-5 drones through a full session. Adding an _optional_ 220W solar panel provides roughly 385Wh of additional capacity over a 2.5-hour session (assuming decent sunlight), bringing the effective total to around 1,400Wh. This comfortably supports 6 drones with margin to spare.

Third party chargers are also necessary for field charging, as they allow for parallel charging. While the charger each drone comes with can accommodate 3 batteries, they are charged one by one. These additional chargers can charge all connected batteries at the same time. The provided chargers are still useful for prepping before a lab, where they connect to a 500W USB charger in the office.

In total, these items should allow for as much flight time as needed for a full 3 hour lab session.

- #link("https://www.amazon.com/dp/B0FRMQPZF6")[EcoFlow DELTA 3 with 220W Portable Solar Panel (bundled)] | \$599 (current sale)
- #link("https://a.co/d/0qWA51W")[Parallel Fast Charger for DJI Air 3] (×2) | \$56 each
- #link("https://a.co/d/bhSoJLd")[Parallel Fast Charger for DJI Mini 3] (×2) | \$60 each
- #link("https://a.co/d/aLcd0xN")[500W USB C charger] | \$70

=== Storage and Protection

These items are not strictly necessary, but help protect and organize the equipment. A single Pelican-style case to house the whole drone fleet would be ideal for transport and storage, containing all drones, controllers, and batteries in one place. The specific case depends on how many drones we order, but I provide a price range below.

Landing pads keep drones out of the dirt during field operations and can double as targets for lab exercises. A label maker also helps identify each drone and controller, which simplifies fleet management.

- Pelican-style case | \$150-300 (depending on size)
- #link("https://www.amazon.com/dp/B0FQJ65KJD")[STARTRC Drone Landing Pad (22")] (×6) | ~\$20 each
- #link("https://www.amazon.com/dp/B0B1L3BL1G")[Brother P-Touch Label Maker] | ~\$45

=== Field Comfort

Extended outdoor lab sessions benefit from some basic amenities: fold-out tables for equipment staging and battery management, chairs for students, and a pop-up canopy (E-Z UP style) for shade and weather protection. These items may already be available through other departments at Cuesta. If not, they would be worth acquiring if we can't do labs at the Cal Poly Experimental Flight Range.


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
  [Pelican-style Case], [1], [\$225], [\$225],
  [#link("https://www.amazon.com/dp/B0FQJ65KJD")[Landing Pads]], [6], [\$20], [\$120],
  [#link("https://www.amazon.com/dp/B0B1L3BL1G")[Label Maker]], [1], [\$45], [\$45],
  [NIST course materials], [--], [--], [\$250],
  table.hline(),
  [], [], [*Subtotal*], [*\$9,515*],
  [], [], [Tax (~8.5%)], [\$809],
  [], [], [*Estimated Total*], [*\$10,324*],
)
