// axis from stepmotor to M4
d1i = 5.0 + 0.6;
r1i = d1i/2;
r1o = r1i + 2.5;
h1 = 8.0;

r2i = (3.5+0.6)/2; // for M4 thread
r2o = r1o; // r2i + 2.2;
h2 = 8;
ha = h1 + h2;

shi = (3.0+0.6); // width of flat axis part
nut_r = (8.0+0.8)/2;
nut_h = 3.2;

$fn=20;


include <atu_supports.scad>
include <atu_nut_axis.scad>

module nut_m4_place()
{
  nut6_place( (8.0+0.8)/2, 3.2 );
}



union() {
  difference() {
    union() {
      translate( [0,0,h1] )  cylinder( h=h2, r=r2o );  // top + nut
      cylinder( h=h1, r=r1o );  // bottom
      supp_34d( 0.6*r1o, ha, r1o );      
    }
    translate( [0,0,h1] )  cylinder( h=h2+1, r=r2i );  // central hole
    translate([0,0,ha-nut_h+0.1]) nut_m4_place();
    chamfered2_axle( r1i, h1, shi );
  }
  
}


