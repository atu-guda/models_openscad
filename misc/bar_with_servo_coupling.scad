// bar for robotic lab 2: with connecots to servo 996
$fn = 52;
use <atu_rounds.scad>

ov = 0.05;
ov2 = 2*0.05;

x_0 = 120.0; // between pivots
y_0 =  12.0;
z_0 =   6.0;
z_a =   z_0 + 2*ov2;
x_e =  15.0;
y_c = y_0 / 2;
x_all = x_0 + 2.0 * x_e;

d_small = 1.8;
d_main = 3.6;
d_1    = 3.2;
d_co   = 8.2;
z_co   = 1.0;

module hole_screw( d_h, h_a, h_1 )
{
  union() {
    cylinder( d=d_h, h=h_a );
    cylinder( d1=d_h+2*h_1, d2=d_h, h=h_1 );
  }
}
module hole_screw_def()
{
  hole_screw( d_1, z_a, 1.6 );
}

module bar_servo_coupling_1()
{
  difference() {
    translate([-x_e,-y_c,0]) cube_round_xy( x_all, y_0, z_0, 3 );
    translate([0,0,-ov]) cylinder( d=d_main, h=z_a );
    translate([0,0,-ov]) cylinder( d=d_co, h=z_co );
    for(i=[0:10:100] ) {
      translate([x_0-i  ,0,-ov]) hole_screw_def();
    }
    for(i=[7.5:2.5:13] ) {
      translate([ i,0,-ov]) cylinder( d=d_small, h=z_a );
      translate([-i,0,-ov]) cylinder( d=d_small, h=z_a );
    }
  }
}

module bar_servo_coupling_2()
{
  difference() {
    union() {
      translate([-x_e,-y_c,0])   cube_round_xy( x_all, y_0, z_0, 3 );
      translate([-x_e,-y_c,-z_0]) cube_round_xy( 2* x_e, y_0, z_0, 3 );
    }
    translate([0,0,-z_0-ov]) cylinder( d=d_main, h=2*z_a );
    translate([0,0,-z_0-ov]) cylinder( d=d_co, h=z_co );
    for(i=[0:10:100] ) {
      translate([x_0-i  ,0,-ov]) hole_screw_def();
    }
    for(i=[7.5:2.5:13] ) {
      translate([ i,0,-z_a-ov]) cylinder( d=d_small, h=2*z_a );
      translate([-i,0,-z_a-ov]) cylinder( d=d_small, h=2*z_a );
    }
  }
}

//rotate([180,0,0]) bar_servo_coupling_1();
rotate([180,0,0])
 bar_servo_coupling_2();

