// connector from servo to HDD plate
use <servo_head1.scad>
include <servos_data.scad>



ge_len = 4.0;
drill_r = 2.7 / 2;
axe_r   = 3.1 / 2;
b_h = 3;

union() {
  difference() {
    servo_head( ge_len, B25T_data, 20 );
    translate( [ 17,0,0] ) cylinder( h=ge_len, r=drill_r, $fn=10 );
    translate( [-17,0,0] ) cylinder( h=ge_len, r=drill_r, $fn=10 );
    translate( [0, 17,0] ) cylinder( h=ge_len, r=drill_r, $fn=10 );
    translate( [0,-17,0] ) cylinder( h=ge_len, r=drill_r, $fn=10 );
  }
  difference() {
    translate( [0,0,ge_len] ) cylinder( h=b_h, r=12.5, $fn=20 );
    cylinder( h=b_h+ge_len, r=axe_r, $fn=10 );
//    translate( [0,0,-10] )  cube( [10,10,20], center=true );
//    translate( [0,0,-20] )  cylinder( h=20, r=axe_r, $fn=10 );
//    translate( [0,5, -5] )  rotate( [90,0,0] ) cylinder( h=10, r=drill_r, $fn=10 );
//    translate( [0,5,-15] )  rotate( [90,0,0] ) cylinder( h=10, r=drill_r, $fn=10 );
//    translate( [-5,0,-15] ) rotate( [0,90,0] ) cylinder( h=10, r=drill_r, $fn=10 );
//    translate( [-5,0,-5] )  rotate( [0,90,0] ) cylinder( h=10, r=drill_r, $fn=10 );
  }
}

