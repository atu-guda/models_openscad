$fn=72;

include <BOSL2/std.scad>
include <BOSL2/screws.scad>

difference() {
  sphere( r=8 );
  translate([-10,-10,-10]) cube( [20,20,9] );
  translate([0,0,1]) screw("M8", head="none",length=12);
}

