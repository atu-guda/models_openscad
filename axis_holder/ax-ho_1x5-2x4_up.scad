r1 = 2.5;
r2 = 2.0;// + 0.3;

x1 = 20;
y1 = 10;
za = 10;
z1 = za + 2.5 + 1.5;

$fn=20;

// include <atu_supports.scad>
include <atu_nut_axis.scad>


module ax_ho_21()
{
  difference() {
    cube( [x1,y1,z1] );
    translate([ 0,y1/2,10]) rotate([0,90,0]) cylinder( r=r1, h=x1 );
    translate([ 5,y1/2,0])  cylinder( r=r2, h=za-r1/2 );
    translate([15,y1/2,0])  cylinder( r=r2, h=za-r1/2 );
    translate([ 5,y1/2,0]) rotate([00,0,30]) nut6_place( nut_m4_r+0.3, nut_m4_h+0.2 );
    translate([15,y1/2,0]) rotate([00,0,30]) nut6_place( nut_m4_r+0.3, nut_m4_h+0.2 );
  }
}

translate([x1,0,z1]) rotate([0,180,0]) ax_ho_21();
