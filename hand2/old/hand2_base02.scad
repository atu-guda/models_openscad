$fn = 72;

use <atu_shift_circ.scad>
use <atu_holes_01.scad>

ov      = 0.05;
h_all   = 7.0;
h_a     = h_all + 2 * ov;

r_out   = 44.0;
r_balls = 32.0;
r_axis  =  4.2; // 4.0 + extra
d_ball  =  6.0;
r_mou   =  2.1;
l_mou   = 42.0;
r_mou2  =  1.7;
h_mou2  =  h_a;
z_deep =  0.5;



module bolt_cone_in()
{
  atu_bolt_cone( r_1=r_mou2, r_2=r_mou2+1.5, h_all=h_a, h_top=2 );
}

module axis_part( r_1, h_1, l_1 )
{
  difference() {
    cylinder( r = r_1, h = h_1 );
    translate([l_1,-2*r_1,-0.2*h_1]) cube([2*r_1,4*r_1,1.5*h_1]);
  }
}

module hand2_base02()
{
  difference(){
    cylinder( r = r_out, h = h_all );

    translate([0,0,-ov]) cylinder( r = r_axis, h= h_a );
    translate([-10.0,-1.0,-ov]) cube([20.0,2.0,3.2]);
    translate([0,0,h_all+z_deep]) rotate_extrude(angle=360)
      translate([r_balls, 0, 0]) circle( r = d_ball/2 );

    translate([-14.0,     0,0]) bolt_cone_in();
    translate([-14.0,  10.0,0]) bolt_cone_in();
    translate([-14.0, -10.0,0]) bolt_cone_in();

    translate([ 21.0,   7.0,0]) bolt_cone_in();
    translate([ 21.0,  -7.0,0]) bolt_cone_in();
    translate([ 10.5,  17.0,0]) bolt_cone_in();
    translate([ 10.5, -17.0,0]) bolt_cone_in();

    shift_quad( 20, 0 ) bolt_cone_in();
    shift_quad( 40, -ov ) bolt_cone_in();
    shift_circ_n( l = 40, n = 4, sh_z = -ov, alp_0 = 45 ) bolt_cone_in();
    translate([10.0,   0.0,0]) bolt_cone_in();
    translate([ 0.0,  10.0,0]) bolt_cone_in();
    translate([ 0.0, -10.0,0]) bolt_cone_in();

    //shift_quad( l=15, sh_z = -ov ) bolt_cone_in();

  }
}

hand2_base02();


 
