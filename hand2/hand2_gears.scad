use <gears_chrisspen/gears.scad>
use <atu_shift_circ.scad>

include <hand2_params_a.scad>

$fn=72;
show_dims = false;

if( show_dims ) {
  color("blue") cylinder( h=25, r=4 );
  color("blue") translate([0,0,-10]) cylinder( d=72, h=4 );
}

module hand2_main_gear()
{
  base_h = 2.0;
  h_xforce = h_force + 2.0;
  difference() {
    union(){
      cylinder( d=d_bear_i+l_force, h=h_xforce );
      translate([0,0,h_xforce]) cylinder( d=67, h=base_h );
      cylinder( d=15, h=mgear_h_tot );
      translate([0,0,base_h+h_xforce+base_h]) cylinder( d1=25, d2=15, h=7 ); // cone counterforce part

      translate([0,0,h_force+base_h])
        bevel_gear( modul=2, tooth_number=34, partial_cone_angle=70.56, tooth_width=10,
                    bore=d_axis, pressure_angle=20, helix_angle=20 );
    }
    translate([  0,     0,    -ov ]) cylinder( d=d_axis,  h=mgear_h_tot+10 ); // main axis hole
    translate([  0,     0,    mgear_h_tot-2.1  ]) cylinder( d=10.4, h=2.2 );  // magnet
    translate([  0,     8,    mgear_h_tot-5.0  ]) rotate([90,0,0]) cylinder( d=2.0, h=16 ); // axis mount
    //shift_quad( 15, -2-ov )              cylinder( r=r_mou2, h=15 );
    shift_octo( 20, -2-ov   )  cylinder( r=r_mou2, h=15 );
  }
}

module hand2_aux_gear()
{
  difference() {
    union(){
      cylinder( d=19.5, h=7.0 );
      translate([0,0,7.0])
        bevel_gear( modul=2, tooth_number=12, partial_cone_angle=19.44, tooth_width=10,
                  bore=agear_axis_d, pressure_angle=20, helix_angle=-20 );
    }
    translate([  0,     0,    -ov ]) cylinder( d=agear_axis_d, h=20 ); // second axis hole
    translate([  0,   7.0,    -ov ]) cylinder( d=agear_axis_d, h= 7 ); // aux holes
    translate([  0,  -7.0,    -ov ]) cylinder( d=agear_axis_d, h= 7 );
  }
}


hand2_main_gear();
translate([55.0,0,0]) hand2_aux_gear();

// to calculate
//bevel_gear_pair( modul=2, axis_angle=90, tooth_width=10,
//      gear_teeth=34, gear_bore= d_axis,
//      pinion_teeth=12,   pinion_bore=4.2,
//      pressure_angle=20, helix_angle=20,
//      together_built=false );


//  "Cone Angle Gear = ", 70.56
//  "Cone Angle Pinion = ", 19.44
//  "Gear Height = ", 14.1737
//  "Pinion Height = ", 34.7049
//  "Part Cone Diameter at the Cone Base = ", 68
//  "Bevel Gear Height = ", 3.86686
//  "Part Cone Diameter at the Cone Base = ", 24
//  "Bevel Gear Height = ", 9.57206

