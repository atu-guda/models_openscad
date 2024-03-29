// holder for linear bearing D_in=5mm, L=15mm 
d_in = 5.0;   // inner diameter
d_out = 10.0; // outer diameter
L_all = 15.4; //

r1   = d_out / 2 + 0.4;
r_in = d_in  / 2 + 1.0;

// include <atu_supports.scad>
include <atu_nut_axis.scad>

kz = 0.75;
xw = 2.5; // wall
yw = 2.0;
xa = L_all + 2 * xw;
ya = d_out + 2 * yw;
yc = ya / 2;
zc = r1 * 2 * ( kz - 0.5 );
za = zc + r1 + nut_m4_h + 0.7;

$fn=25;


module lbe_ho_5x15xn2_4()
{
  difference() {
    cube( [xa,ya,za] );
    translate([ xw,yc,zc]) rotate([0,90,0]) cylinder( r=r1, h=L_all );
    translate([  0,yc,zc]) rotate([0,90,0]) cylinder( r=r_in, h=xa );
    translate([  5,yc,za-nut_m4_h]) nut6_place( nut_m4_r+0.3, nut_m4_h + 0.2 );
    translate([ 15,yc,za-nut_m4_h]) nut6_place( nut_m4_r+0.3, nut_m4_h + 0.2 );
  }
}

rotate([180,0,0])
  lbe_ho_5x15xn2_4();

