// connector from metal servo tool with disk to M4
// TODO: nut
r1o = 10.0;
h1o = 2.5;

r2i = 4.2/2;
r2o = r2i + 3.0;
h2 = 10;

rh = 1.6;
q = 5.0 * sqrt(2.0);

include <atu_supports.scad>
include <atu_nut_axis.scad>

$fn=25;

difference() {
  union() {
    cylinder( h=h1o, r=r1o );
    translate( [0,0,h1o] ) cylinder( h=h2, r=r2o );
    rotate([0,0,45]) supp_34( 4, h2+h1o, r2o );
  }
  cylinder( h=h1o + h2, r=r2i );
  translate([0,0,h1o+h2-nut_m4_h]) nut6_place( nut_m4_r+0.3, nut_m4_h );


  translate([ q, 0,0]) cylinder( h=h1o, r=rh );
  translate([-q, 0,0]) cylinder( h=h1o, r=rh );
  translate([ 0, q,0]) cylinder( h=h1o, r=rh );
  translate([ 0,-q,0]) cylinder( h=h1o, r=rh );

}

