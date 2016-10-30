
$fn = 50;

DRAWTOP = true;
DRAWBOTTOM = false;

// half
half = 10.2;

// rounding of edges
rounded = 1;

// body
w = 78.55;
h = 64.45;
d = 21.75;
thickness = 2.2;

// bottom lip
lip = 6.13;

// bottom wall
wallfromend = 20;
wallwidth = 2.3;

// pcbhole
pcbinset = 5.3;
pcbfromtop = 8.5;

// bottom pcb support
supportfromend = 12.2;
supportheight = .75;

// centerhole
bottomcenterholeouterradius = 4.85;
bottomcenterholeinnerradius = 3.35;
bottomcenterpostscrewhole = 1.76;
bottomcenterpostscrewdepth = 13;
centerholefromtop = 41.5;

// body label inset (not used)
hlabelinset = 3.5;
wlabelinset = 15.5;

// avery end size
davery = 12.7;
havery = 44.45;
averypadding = 1;

// board bounders
bounderinset = 10.75;
bounderfromtop = 55.5;
bounderradius = 1.6;

// friendly board support
friendlyboardsupportfromtop = 28.5;

// chomps
chompinset = 5;
chomplength = 5;
chompwidth = 3;

// ALL SIDES
difference(){
    union(){
        difference() {
            shell();
            union(){
                if(!DRAWTOP)
                {
                translate([0, 0, half])
                    cube([w + thickness + rounded,h + thickness + rounded,d]);
                }
                if(!DRAWBOTTOM)
                {
                    cube([w + thickness + rounded,h + thickness + rounded,half]);
                }
            }
        }
        bottomelements();
    }
    bodyholes();
}
topelements();

module topelements(){
    // TOP ONLY
    if (DRAWTOP){
        
        // dinguses
        // center dingus
        translate([thickness + (rounded / 2),h/2,half - thickness])
            cylinder(d - half + thickness, thickness / 2.33, thickness / 2.33);
        // top right
        translate([thickness + (rounded / 2),thickness + rounded,half - thickness])
            cylinder(d - half + thickness, thickness / 2.33, thickness / 2.33);
        // top left
        translate([thickness + (rounded / 2),h - thickness - rounded,half - thickness])
            cylinder(d - half + thickness, thickness / 2.33, thickness / 2.33);
        // wall left
        translate([w - wallfromend - wallwidth,thickness + rounded,half - thickness])
            cylinder(d - half + thickness, thickness / 2.33, thickness / 2.33);
        // wall rigth
        translate([w - wallfromend - wallwidth,h - thickness - rounded,half - thickness])
            cylinder(d - half + thickness, thickness / 2.33, thickness / 2.33);
        
        // middle screw thing
        translate([centerholefromtop, h/2, thickness/4])
            difference(){
                cylinder(d - thickness/4, bottomcenterholeinnerradius * .9, bottomcenterholeinnerradius * .9);
                union(){
                    // main hole
                    cylinder(bottomcenterpostscrewdepth, bottomcenterpostscrewhole, bottomcenterpostscrewhole);
                    // triangle for screw top
                    cylinder(1.5 * thickness, bottomcenterholeouterradius, bottomcenterpostscrewhole);
                }
            }
        

        
    }
}

module bottomelements() {
    // BOTTOM ONLY
    if (DRAWBOTTOM){
        // bottom pcb support
        translate([w - wallfromend, supportfromend, half])
            cube([wallwidth, h - (2 * supportfromend), supportheight]);

        // bottom dinguses
        // top center
        translate([thickness + (rounded / 2),h/2,0])
            difference(){
                cylinder(half, thickness, thickness);
                translate([0, 0, thickness])
                    cylinder(half + thickness, thickness / 2, thickness / 2);
            }
        // top left 
        translate([thickness + (rounded / 2),thickness + rounded,0])
            difference(){
                cylinder(half, thickness, thickness);
                translate([0, 0, thickness])
                    cylinder(half + thickness, thickness / 2, thickness / 2);
            }
        // top right
        translate([thickness + (rounded / 2),h - thickness - rounded,0])
            difference(){
                cylinder(half, thickness, thickness);
                translate([0, 0, thickness])
                    cylinder(half + thickness, thickness / 2, thickness / 2);
            }
        // wall left 
        translate([w - wallfromend - wallwidth,thickness + rounded,0])
            difference(){
                cylinder(half, thickness, thickness);
                translate([0, 0, thickness])
                    cylinder(half + thickness, thickness / 2, thickness / 2);
            }
        // wall right
        translate([w - wallfromend - wallwidth,h - thickness - rounded,0])
            difference(){
                cylinder(half, thickness, thickness);
                translate([0, 0, thickness])
                    cylinder(half + thickness, thickness / 2, thickness / 2);
            }
            
        // bottom screw hole
        translate([centerholefromtop, h/2, 0])
            difference(){
                union(){
                    cylinder(half + supportheight, bottomcenterholeouterradius, bottomcenterholeouterradius);
                    cylinder(4 * supportheight, bottomcenterholeouterradius * 1.5, bottomcenterholeouterradius);
                }
                translate([0, 0, -thickness/2])
                    cylinder(half + supportheight + thickness, bottomcenterholeinnerradius, bottomcenterholeinnerradius);
            }
    }    
}

module bodyholes() {
    // hole for screw
    translate([centerholefromtop, h/2, 0])
        cylinder(half + supportheight + thickness, bottomcenterholeinnerradius, bottomcenterholeinnerradius);
    
    // inset for screw
    translate([centerholefromtop,h/2,-rounded/2])
        cylinder(thickness/2, bottomcenterholeouterradius, bottomcenterholeouterradius);

    // avery label (1.75" x .5")
    translate([-rounded/2, (h - havery - averypadding) / 2 , (d - davery - averypadding) / 2])
        rounded_cube([rounded, havery + averypadding, davery + averypadding], rounded);
    
    // top chomps
    translate([w - chomplength, chompinset, d - thickness])
        rounded_cube([chomplength * 2, chompwidth, 2 * thickness], 1);
    translate([w - chomplength, h - chompinset - chompwidth, d - thickness])
        rounded_cube([chomplength * 2, chompwidth, 2 * thickness], 1);
    
}

module shell(){
    // emptied out body
    difference(){
        difference(){
            rounded_cube([w,h,d], rounded);
            translate([thickness / 2, thickness / 2, thickness / 2])
                rounded_cube([w,h - thickness,d - thickness], 1);
        }
    }

    // support lip at insert point
    translate([w - lip, thickness / 4, thickness / 4])
        cube([lip, h - (thickness / 2), thickness ]);

    difference(){
        // wall for pcb support
        translate([w - wallfromend, thickness / 2, 0])
            cube([wallwidth, h - (thickness/1), d]);

        // pcb hole
        translate([w - wallfromend - (thickness / 2), pcbinset, half])
            cube([wallwidth + thickness, h - (2 * pcbinset), d - half - pcbfromtop]);
    }   
    
    // SUPPORTS ON TOP
    
    // top pokey dinguses
    translate([thickness + (rounded / 2),h/2,half])
        cylinder(d - half, thickness, thickness);
    translate([thickness + (rounded / 2),thickness + rounded,half])
        cylinder(d - half, thickness, thickness);
    translate([thickness + (rounded / 2),h - thickness - rounded,half])
        cylinder(d - half, thickness, thickness);
    translate([w - wallfromend - wallwidth,thickness + rounded,half])
        cylinder(d - half, thickness, thickness);
    translate([w - wallfromend - wallwidth,h - thickness - rounded,half])
        cylinder(d - half, thickness, thickness);

     // swampy bounders
    translate([bounderfromtop, bounderinset, half])
        cylinder(d - half, bounderradius, bounderradius);
    translate([bounderfromtop, h - bounderinset, half])
        cylinder(d - half, bounderradius, bounderradius);   
    
    // screw hole support
    translate([centerholefromtop, h/2, d - pcbfromtop])
        cylinder(pcbfromtop, bottomcenterholeouterradius, bottomcenterholeouterradius);    
    
    // friendly board support
    translate([friendlyboardsupportfromtop,h/2, d - pcbfromtop])
        cylinder(pcbfromtop, bounderradius, bounderradius); 
    

}


module rounded_cube(size,dia){
    translate([dia/2, dia/2, dia/2])
    hull() {
        w = size[0] - dia;
        h = size[1] - dia;
        d = size [2] - dia;
        sphere(d=dia);
        translate([0,h,d])sphere(d=dia);
        translate([w,0,d])sphere(d=dia);
        translate([w,h,0])sphere(d=dia);
        translate([w,h,d])sphere(d=dia);
        translate([0,0,d])sphere(d=dia);
        translate([w,0,0])sphere(d=dia);
        translate([0,h,0])sphere(d=dia);
    }
}