
module atu_bolt_cone( r_1, r_2, h_all, h_top )
{
  union() {
    cylinder(  r = r_1, h = h_all );
    translate([0,0,h_all-h_top]) cylinder( r1 = r_1, r2= r_2, h = h_top );
  }
}

