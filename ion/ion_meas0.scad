// measurement stand for ion thruster
include <BOSL2/std.scad>

w    =  2.0;
x_a  = 70.0; x_a2 = x_a / 2;
y_a  = 30.0; y_a2 = y_a / 2;
z_a  = 70.0;

difference() {
 union() {
  prismoid([x_a,y_a], [x_a,y_a], h=w, rounding=3 );
  translate([-x_a2,  -10,0]) cube([3,6,z_a] );
  translate([ x_a2-w,-10,0]) cube([3,6,z_a] );
  translate([-x_a2  ,-4,0]) wedge([w, 14, z_a]);
  translate([ x_a2-w,-4,0]) wedge([w, 14, z_a]);
 }
 translate([-x_a2-1,-7,z_a-4]) rotate([0,90,0]) cylinder(r=0.8,h=z_a+5);
}

