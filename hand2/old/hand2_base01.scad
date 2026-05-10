$fn = 72;

use <atu_shift_circ.scad>
use <atu_holes_01.scad>

ov      = 0.05;
r_bear  = 11.3;
h_bear  =  7.0;
h_all   = h_bear + 1.2;
h_a     = h_all + 2 * ov;

r_out   = 45.0;
r_balls = 32.0;
r_axis  =  9.0; // 4.0 + extra
d_ball  =  6.0;
r_mou   =  2.1;
l_mou   = 40.0;
r_mou2  =  1.7;
h_mou2  =  h_a;
z_deep =  0.5;



module bolt_cone_out()
{
  atu_bolt_cone( r_1=r_mou, r_2=r_mou+1.5, h_all=h_a, h_top=2 );
}

module bolt_cone_in()
{
  atu_bolt_cone( r_1=r_mou2, r_2=r_mou2+1.5, h_all=h_a, h_top=2 );
}

module hand2_base01()
{
  difference(){
    cylinder( r = r_out, h = h_all );
    translate([0,0,-ov]) cylinder( r = r_bear, h = h_bear );
    translate([0,0,-ov]) cylinder( r = r_axis, h = h_a );
    translate([0,0,h_all+z_deep]) rotate_extrude(angle=360)
      translate([r_balls, 0, 0]) circle( r = d_ball/2 );

    shift_octo( l=l_mou, sh_z = -ov ) bolt_cone_out();

    shift_quad( l=15, sh_z = -ov ) bolt_cone_in();

    shift_circ_n( l=20, n = 4, sh_z = -ov, alp_0 = 45 )  bolt_cone_in();

    shift_quad( l=25, sh_z = -ov ) bolt_cone_in();

  }
}

hand2_base01();

