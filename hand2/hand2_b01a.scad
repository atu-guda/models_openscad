$fn = 72;

use <atu_shift_circ.scad>
use <atu_holes_01.scad>
use <atu_mounts_01.scad>

include <hand2_params_a.scad>
include <hand2_bolt_cones.scad>

debug = $preview ? 1 : 0;

module hand2_base01a()
{
  difference(){
    union() {
      cylinder( r = r_out_b, h = h_all );
      shift_quad( l=l_mou_ext ) 
        atu_mount_ear( h= h_all, r_i= 4.0, r_o= r_puck_ext, alp = 50, k_ext = 1.4 );
    }
    translate([0,0,h_force]) cylinder( r = r_bear_o, h = h_bear+ov );
    translate([0,0,-ov])     cylinder( r = r_bear_o-l_force, h = h_ax );

    shift_octo( l=l_mou, sh_z = -ov ) bolt_cone_out();
    shift_octo( l=l_mou-3, sh_z = -ov, alp_0 = 22.5 )
      cylinder( r=r_mou, h=h_ax);
  }
}

hand2_base01a();

if( debug > 0 ) {
  #translate([0,0,h_force]) difference() {
    cylinder( d=d_bear_o, h=h_bear ); 
    translate([0,0,-ov])cylinder( d=d_bear_i, h=h_bear+2*ov ); 
  }
}

echo( "l_mou= ", l_mou, " l_mou_ext= ", l_mou_ext, "r_out_b= ", r_out_b );
echo( "h_all= ", h_all, " r_bear_o= ", r_bear_o ); 
