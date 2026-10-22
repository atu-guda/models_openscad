// special extender for servo
use <servo_head1.scad>
include <servos_data.scad>

$fn=52;
ov=0.05;
ov2 = 2*ov;
ge_len = 5.0;
drill_r = 2.7 / 2;
axe_r   = 3.1 / 2;

union() {
  servo_head( ge_len, B25T_data, 5.0 );
  difference() {
    translate( [0,0,-10] )  cube( [10,10,20], center=true );
    #translate( [0,0,-20-ov] )  cylinder( h=20+4*ov, r=axe_r, $fn=10 );
    translate( [0,5+ov, -5] )  rotate( [90,0,0] ) cylinder( h=10+ov2, r=drill_r, $fn=10 );
    translate( [0,5+ov,-15] )  rotate( [90,0,0] ) cylinder( h=10+ov2, r=drill_r, $fn=10 );
    translate( [-5+ov,0,-15] ) rotate( [0,90,0] ) cylinder( h=10+ov2, r=drill_r, $fn=10 );
    translate( [-5+ov,0,-5] )  rotate( [0,90,0] ) cylinder( h=10+ov2, r=drill_r, $fn=10 );
  }
}

