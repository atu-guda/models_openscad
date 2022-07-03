// extender from servo to M4 with nut place - 2 peases
r1i = 5.9/2;
r1o = r1i + 2.4;
h1i = 4.0;
h1o = 6.0;

r2i = 3.5/2;
r2o = r1o; // r2i + 2.2;
h2 = 10;

bracing_x = 16;
bracing_y = 5;
bracing_z = 16;

hole_r = 1.1;

$fn=25;

include <atu_nut_axis.scad>

nut_r = (nut_m4_r+0.1)/2;
nut_h = nut_m4_h;

module servo_axis()
{
  difference() {
    union() {
      cylinder( h=h1o, r=r1o ); // servo part cylinder
      translate( [0,0,h1o] ) cylinder( h=h2, r=r2o ); // nut part cylinder
      translate( [0,0,h1o+1] ) cylinder( h=3, r=8.0 ); // cental forcing cylinder
      // mounting plates
      translate( [-bracing_x/2,-bracing_y/2,0] ) cube( [bracing_x,bracing_y,bracing_z] );
    }
    cylinder( h=h1o + h2, r=r2i ); // main hole
    cylinder( h=h1i, r=r1i );      // servo axis hole
    translate([0,0,h1o+h2-nut_h+0.1]) nut6_place( nut_r, nut_h );
    translate([(bracing_x-hole_r-2.6)/2,0,(bracing_y-1.2)/2])
      rotate([-90,0,0]) cylinder( bracing_z, r=hole_r );
    translate([(-bracing_x+hole_r+2.6)/2,0,(bracing_y-1.2)/2])
      rotate([-90,0,0]) cylinder( bracing_z, r=hole_r );
    translate([(bracing_x-hole_r-2.6)/2,0,(-bracing_y+1.2)/2+h1o+h2])
      rotate([-90,0,0]) cylinder( bracing_z, r=hole_r );
    translate([(-bracing_x+hole_r+2.6)/2,0,(-bracing_y+1.2)/2+h1o+h2])
      rotate([-90,0,0]) cylinder( bracing_z, r=hole_r );
  }
}

difference() {
  union() {
    rotate([90,0,0]) servo_axis();
    translate([20,0,0]) rotate([90,0,0]) servo_axis();
  }
  translate([-10,-18,-8.8]) cube([40,20,8]);
}

