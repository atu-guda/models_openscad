use <atu_shift_circ.scad>

include <hand2_params_a.scad>

$fn=72;
show_dims = false;

if( show_dims ) {
  color("blue") cylinder( h=25, r=4 );
  color("blue") translate([0,0,-10]) cylinder( d=72, h=4 );
}

module hand2_wormpad()
{
  base_h = 2.0;
  h_xforce = h_force + 2.0;
  difference() {
    union(){
      cylinder( d=d_bear_i+l_force, h=h_xforce );
      translate([0,0,h_xforce]) cylinder( d1=34, d2=30, h=10 );
      // translate([0,0,h_xforce]) cylinder( d=67, h=base_h );
      // translate([0,0,base_h+h_xforce+base_h]) cylinder( d1=25, d2=15, h=7 ); // cone counterforce part

    }
    translate([  0,     0,    -ov ]) cylinder( d=d_axis,  h=mgear_h_tot+10 ); // main axis hole
    shift_circ_n( l=13, n=3, sh_z = h_xforce+3) cylinder( d=1.8,   h=8 ); // gear mounting
    shift_octo( 20, -2-ov   )  cylinder( r=r_mou2, h=15 );
  }
}

hand2_wormpad();


