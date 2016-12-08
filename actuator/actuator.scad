$fn=200;

// full size of object (bounds)
fullDepth           = 43;
fullHeight          = 8.75;
fullWidth           = 6.85;

// screw area
screwHeight         = 7.75;
screwDepth          = 15.75;

// screw hole
screwInsetDiameter  = 5;
screwInset          = 1.3;
screwHoleDiameter   = 2.3;
screwCenterY        = 5.5 + (screwInsetDiameter / 2);
screwCenterX        = fullWidth / 2;

// upper arm
armWidth            = 2.9;
armDepth            = 14.75;

// forearm
forearmWidth        = 2;
forearmDepth        = fullDepth - screwDepth - armDepth;
forearmHeight       = 6.25;

// swoop ridge
swoopRidgeWidth     = 1;
swoopRidgeDepth     = 27 - screwDepth;

// swoop
swoopWidth          = fullWidth - armWidth - swoopRidgeWidth;
swoopMaxHeight      = 6.5;
swoopInset          = 1;
swoopRadius         = 12.040322580645157;

// OBJECT

// screw area and holes
difference(){
    cube([fullWidth,screwDepth,screwHeight]);
    union(){
        translate([screwCenterX,screwCenterY, -.5])
            cylinder(fullHeight+1, d=screwHoleDiameter, d=screwHoleDiameter);
        translate([screwCenterX,screwCenterY, screwHeight-screwInset])
            cylinder(screwInset+.5, d=screwInsetDiameter, d=screwInsetDiameter);
    }
}

// upper arm
translate([fullWidth - armWidth, screwDepth, 0])
    cube([armWidth, armDepth, fullHeight]);

// forearm
translate([fullWidth - forearmWidth, screwDepth + armDepth, fullHeight-forearmHeight])
    cube([forearmWidth, forearmDepth, forearmHeight]);



difference(){
    union(){
        translate([0, screwDepth, screwHeight - swoopRadius]){
            rotate([90,90,90])
                cylinder(swoopRidgeWidth, swoopRadius, swoopRadius);
        }
        translate([0, screwDepth - swoopInset, screwHeight - swoopRadius - swoopInset]){
            rotate([90,90,90])
                cylinder(fullWidth, swoopRadius, swoopRadius);
        }
    }    
    union(){
        cube([fullWidth,screwDepth,screwHeight]);
        translate([0,0,-fullDepth]) {
            cube([fullDepth,fullDepth,fullDepth]);
        }
    }
}   