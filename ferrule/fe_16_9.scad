//  ferrule from old DC motor with gear to D5
d_1 = 15.4;
r1i = (d_1+0.0)/2;
r1o = r1i + 2.0;
h1i = 8.0;
h1o = 12.0;

r2i = (5.0+0.1)/2;
r2o = r1o;
h2 = 7;

include <atu_supports.scad>
//include <atu_nut_axis.scad>

supp_w = 0.5 + 0.8;

$fn=36;

difference() {
  union() {
    cylinder( h=h1o+h2, r=r1o );    
    supp_34d( 3, h1o+h2, r2o, 1.1 );
  }
  cylinder( h=h1o + h2+0.1, r=r2i ); // small axis hole
  cylinder( h=h1i, r=r1i );
  #rotate([0,0,45])translate([0.0,d_1/2+4,h1o+h2-3])
    rotate([90,0,0]) cylinder( h=d_1+10, r=1.3 );
}

