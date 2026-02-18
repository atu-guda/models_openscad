use <gears_chrisspen/gears.scad>

$fn=42;
show_dims = false;

if( show_dims ) {
  color("blue") cylinder( h=15, r=4 );
  color("blue")  translate([0,0,-5]) cylinder( d=72, h=4 );
}

spur_gear( modul=2, tooth_number=32, width=8,
    bore=8.2, pressure_angle=20, helix_angle=20, optimized=true);



translate([50,0,0])
  spur_gear( modul=2, tooth_number=12, width=8,
    bore=6.2, pressure_angle=20, helix_angle=-20, optimized=true);


