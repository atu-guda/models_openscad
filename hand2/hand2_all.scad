$fn = 72;

debug = $preview ? 1 : 0;
section = 0;

use <MCAD/servos.scad>

use <atu_shift_circ.scad>
use <atu_holes_01.scad>
use <atu_mounts_01.scad>

include <hand2_params_a.scad>
include <hand2_bolt_cones.scad>

use <hand2_b01a.scad>
use <hand2_b02a.scad>
use <hand2_gears.scad>


difference() {
  union(){
    color("lime")   translate([-70,-70,-2]) cube([140,190,2]);
    color("silver") translate([-12,-12,0]) cube([24,24,8]);

    color("silver") shift_quad( 55, -10, alp_0 = 45 ) cylinder( d=d_axis0, h= part1_z0+27 );

    translate([0,0, part1_z0])  rotate([0,0,45])    hand2_base01a();
    translate([0,0, part1_z0+18]) rotate([180,0,0]) hand2_base02();

    translate([0,0,  part1_z0-0.1+h_force]) rotate([180,0,45]) hand2_main_gear();
    translate([0,42, part1_z0-17]) rotate([90,0,0]) hand2_aux_gear();

    translate([-30,84,part1_z0-7]) rotate([0,90,0]) futabas3003([0,0,0], [90,0,0]);
    color("silver") translate([0,80,0]) cube([10,10,8] ); // check distance to servo
    color("silver") translate([0,0,part1_z0-19]) cylinder( d=d_axis0, h= 39 );

    if( debug > 0 ) {
      color("red") translate([0,0, part1_z0]) translate([0,0,h_force]) difference() {
        cylinder( d=d_bear_o, h=h_bear ); 
        translate([0,0,-ov])cylinder( d=d_bear_i, h=h_bear+2*ov ); 
      }
    }
  }
  {
  if( section ) {
    translate([0,-100,-10] ) cube([100,200,100]);
  }
  }
}