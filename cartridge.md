[< BACK](readme.md)

#Synergy Cartridge

I have a complete set of all of the EPROMs for the Synergy - including all of the cartridges. Yes, these are also available using SYNHCS on the Kaypro (they are all archived on the disks), but for completeness I wanted to have a full set of cartridges to go with it.

All the EPROMs:

![EPROMs](scad/eproms.png)

So, it appears that the Synergy uses cartridges that are compatible with the Atari 400 computer game console. If I had just a few cartridges to do I could eBay a handful of cartridges and be off to the races as apparently the PCBs are pin-identical as well.

However, I have 23 cartridges to make - so I decided to 3D print my own custom case (based off a vintage Synergy voice cartridge). Here is a shot of it with VCART6 sitting inside of the bottom of the cartridge:

![DK Synergy](scad/cart_bottom.jpg)

####3D PRINTED CARTRIDGE BODY

You are welcome to grab the STL and/or OpenSCAD files to play around with it. It feels pretty good to me, but I am still in R&D on the body and may make a few changes. I'll annotate here when I consider it "done" - though it is pretty close.

* [Top STL File](scad/synergycart-top.stl)
* [Bottom STL File](scad/synergycart-bottom.stl)
* [OpenSCAD File](scad/synergycart.scad)

The cartridge is designed to support a standard 0.5" x 1.75" mailing label on the end; I ordered this product from Amazon to laser print my labels:

[Avery Easy Peel Return Address Labels for Laser Printers, 0.5 x 1.75 Inches, White, Pack of 2000 (5267)](https://www.amazon.com/gp/product/B00004Z5QP)

You will also need a 1/2 inch #4 wood screw (0.112" major thread diameter) with a crown top for each cartridge.

![EPROMs](scad/screw.png)

####CARTRIDGE PCB

Haven't started work on this - though I found this resource for a PCB for the Atari 400 PCB. I'll either be using this or whipping a custom one up in Eagle. I need to identify if the resistor and diode can be inseted into the Atari 400 design.

* [PDF for Atari 400 PCB](http://www.grandideastudio.com/wp-content/uploads/pp_atari8bit_instructions.pdf)
* [Page with Link to Gerbers File](http://www.grandideastudio.com/portfolio/pixels-past/)