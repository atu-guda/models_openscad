// target to place macnectic encoder on place
include <BOSL2/std.scad>

$fn = 30;

ov  = 0.05; // overshot for clean image

l_holes = 16.0; // distace between holes in X or Y
l_plate = 22.0; // gabarites
w_plate =  2.0; //
w_cyl   =  6.0; //
w_o = w_plate + 2*ov;

r_c = 6.0/2; // central hole or pin (+-0.2)
r_m = 3.2/2 + 0.2; // real hole
//r_m =  0.5; // just center


dlt = l_holes / 2;
x_c = l_plate / 2;
y_c = x_c;
x_a = l_plate;
y_a = x_a;

module mag_enc_targ() {
  difference() {
    union() {
      translate([x_c,y_c,0]) prismoid([x_a,y_a], [x_a,y_a], h=w_plate, rounding=2 );
      // translate([x_c,y_c,0]) cylinder( r=r_c-0.2, h=w_cyl );
    }
    translate([x_c,y_c,-ov]) cylinder( r=r_c+0.3, h=w_o );
    // translate([x_c    , y_c,    -ov]) cylinder( r=r_m, h=w_o );
    translate([x_c-dlt, y_c-dlt,-ov]) cylinder( r=r_m, h=w_o );
    translate([x_c-dlt, y_c+dlt,-ov]) cylinder( r=r_m, h=w_o );
    translate([x_c+dlt, y_c-dlt,-ov]) cylinder( r=r_m, h=w_o );
    translate([x_c+dlt, y_c+dlt,-ov]) cylinder( r=r_m, h=w_o );
  }
  
}


mag_enc_targ();

