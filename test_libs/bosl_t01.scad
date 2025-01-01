include <BOSL2/std.scad>

$fn=20;


cube([5,4,1], anchor=[-1,0,0], spin=15);

translate([-20,0,0])   cuboid( [10,8,3], rounding=0.5 );
translate([-20,-10,0]) cuboid( [10,8,3], chamfer=0.5, edges=TOP );
translate([-20,-20,0]) zscale(1.5) cuboid( [10,8,3], rounding=1.2, edges="Z" );
translate([-10,-10,0]) cyl( r=3, h=4, rounding1=-0.7, chamfer2=1.0 );

translate([0,0,10]) xcopies(10, n=5) left_half(x=0.7) sphere(d=3); // l=

translate([0,0,5]) zrot_copies(n=7) yrot(90) cylinder(h=5,d1=1,d2=3);
