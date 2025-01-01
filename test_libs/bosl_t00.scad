include <BOSL2/std.scad>

$fn=20;

// square( [32,16], center=true );
up(5) color("#ff7700") circle( d=4, $fn=5 );

color("#1122ff") right(20) square( [6,3], anchor=LEFT ) circle( r=2.5, anchor=LEFT+FRONT );

// square( [1,1] ) show_anchors();

square(20, center=true)  up(1) color("#33DD44") square( [10,12], spin=45, center=true);
// square(50, center=true) position( [-1,0] ) #square( [10,12], spin=45, center=true);

left(20) rect([12,10], rounding=2,  $fn=30);
left(34) rect([12,10], chamfer=2);
translate([-20,-12,0]) rect([12,10], rounding=[0,1,3,-2],  $fn=30);

translate([-20,10,0]) ellipse(r=[8,4])  /* show_anchors() */;

translate([-20,-20,0]) xflip() yflip() right_triangle([8,4]);
translate([-20,-30,0]) trapezoid(w1=3, w2=7, h=5, shift=1 );
translate([20,-10,0]) hexagon(d=10);
translate([20,-20,0]) pentagon(side=4, rounding=0.7);
translate([20,-30,0]) pentagon( ir=5 ); color("green") translate([20,-30,1]) circle( r=5 );
translate([20,10,0]) star(n=7, ir=3, r=8);

translate([ 0,-20,0]) glued_circles(d=5, spread=10);
translate([ 0,-30,0]) glued_circles(d=5, spread=20, tangent=25);

// translate([ 0,20,0]) teardrop2d(d=7, ang=20, cap_h=5)
//  position( BACK ) square([4,8], anchor=FRONT)
//  position( BACK ) rotate([0,0,180]) teardrop2d(d=7, ang=20, anchor=BACK, cap_h=5)/* show_anchors() */;
// orient(BACK) ???

translate([ 0,20,0]) teardrop2d(d=7, ang=20, cap_h=5)
  attach( BACK ) square([4,8], anchor=FRONT)
  attach( BACK ) rotate([0,0,180]) teardrop2d(d=7, ang=20, anchor=BACK, cap_h=5)/* show_anchors() */;