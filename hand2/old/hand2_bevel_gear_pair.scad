use <gears_chrisspen/gears.scad>

$fn=72;
show_dims = false;
ov = 0.05;

if( show_dims ) {
  color("blue") cylinder( h=25, r=4 );
  color("blue")  translate([0,0,-10]) cylinder( d=72, h=4 );
}

difference() {
  union(){
    translate([0,0,-2]) cylinder( d=70, h=2 );
    cylinder( d=14, h=14 );
    bevel_gear_pair( modul=2, axis_angle=90, tooth_width=10,
      gear_teeth=34, gear_bore=8.2,
      pinion_teeth=12,   pinion_bore=4.2,
      pressure_angle=20, helix_angle=20,
      together_built=false );
  }
  translate([0,0,-2-ov]) cylinder( d=8.2, h=20 );
  translate([0,8,9]) rotate([90,0,0]) cylinder( d=2.0, h=16 );
}
