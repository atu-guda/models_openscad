//  extender from servo to M4 nut
ov=0.05;
ov2=2*ov;
r1i = (5.8+0.6)/2;
r1o = r1i + 2.0;
h1i = 4.0;
h1o = 6.0;

r2i = (3.5+0.6)/2;
r2o = r1o;
h2 = 10;

include <atu_supports.scad>
include <atu_nut_axis.scad>

supp_w = 0.5 + 0.6;

$fn=20;

difference() {
  union() {
    cylinder( h=h1o, r=r1o );
    translate( [0,0,h1o] ) cylinder( h=h2, r=r2o );
    supp_34d( 3, h2+h1o, r2o );
  }
  cylinder( h=h1o + h2+ov2, r=r2i );
  translate([0,0,-ov]) cylinder( h=h1i+ov, r=r1i );
  translate([0,0,h1o+h2-nut_m4_h+ov]) nut6_place( nut_m4_r+0.3, nut_m4_h );
}

