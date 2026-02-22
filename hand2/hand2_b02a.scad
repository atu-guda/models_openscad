$fn = 72;

use <atu_shift_circ.scad>
use <atu_holes_01.scad>
// use <atu_mounts_01.scad>

include <hand2_params_a.scad>
include <hand2_bolt_cones.scad>

debug = $preview ? 1 : 0;

module hand2_base02()
{
  holes1 = [
    [-14.0,     0, -ov ],
    [-14.0,  10.0, -ov ],
    [-14.0, -10.0, -ov ],
    [ 21.0,   7.0, -ov ],
    [ 21.0,  -7.0, -ov ],
    [ 10.5,  17.0, -ov ],
    [ 10.5, -17.0, -ov ],
    [ 20.0,   0.0, -ov ],
    [-20.0,   0.0, -ov ],
    [  0.0,  20.0, -ov ],
    [  0.0, -20.0, -ov ],
    [ 10.0,   0.0, -ov ],
    [  0.0,  10.0, -ov ],
    [  0.0, -10.0, -ov ],
  ];
  
  difference(){
    union() {
      cylinder( r = r_out_t, h = h_main_t );
      translate([0,0,z_t_1]) cylinder( r = r_bear_i + l_force, h = h_force );
      translate([0,0,z_t_2]) cylinder( r = r_bear_i, h = h_bear + h_force + h_gap_t );      
    }

    translate([0,0,-ov]) cylinder( r = r_axis, h= h_t_a );
    translate([-10.0,-1.0,-ov]) cube([20.0,2.0,3.2]);
    
    shift_octo( 40, -ov ) bolt_cone_in();
    shift_octo( 35, -ov,  alp_0 = 22.5 ) bolt_cone_in();
    shift_octo( 30, -ov ) bolt_cone_in();
    for( ho = holes1 ) {
      translate( ho ) bolt_cone_top();
    }
  }
}

hand2_base02();


 
