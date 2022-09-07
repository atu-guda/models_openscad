// 2 nut + spring + 2 nut holding

// include <atu_supports.scad>
include <atu_nut_axis.scad>

x_sp = 12.0; // spring length
x_w  =  2.0; // x-wall length
x_a  = x_sp + 2 * x_w + 2 * nut_m4_h;

y_w  = 2.0;
y_a  = 2 * y_w + nut_m4_s;
y_c  = y_a / 2;

z_w  = 2.0;
z_a  = nut_m4_e + 1.0 * z_w + nut_m4_h;
z_c  = nut_m4_e / 2.0 + z_w;

r_1  = 2.3;


$fn=20;




module nut2spring_m4n4()
{
  difference() {
    cube( [x_a,y_a,z_a] );
    translate([ x_w,y_w,0]) cube( [x_a-x_w-nut_m4_h,nut_m4_s,nut_m4_e+z_w] );
    translate([ 0,y_c,z_c]) rotate([0,90,0]) cylinder( r=r_1, h=x_a );
    translate([ x_a-nut_m4_h,y_c,z_c])  rotate([0,90,0]) nut6_place( nut_m4_r+0.2, nut_m4_h );
    translate([ 5,y_c,z_a-nut_m4_h]) nut6_place( nut_m4_r+0.2, nut_m4_h );
    translate([15,y_c,z_a-nut_m4_h]) nut6_place( nut_m4_r+0.2, nut_m4_h );

  }
}

nut2spring_m4n4();

