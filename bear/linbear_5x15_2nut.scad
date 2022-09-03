// holder for linear bearing D_in=5mm, L=15mm 
d_in = 5.0;   // inner diameter
d_out = 10.0; // outer diameter
L_all = 15.0; // 

r1   = d_out / 2 + 0.1;
r_in = d_in  / 2 + 1.0;

// include <atu_supports.scad>
include <atu_nut_axis.scad>

kz = 0.6;
xw = 2.5; // wall
xa = L_all + 2 * xw;
ya = d_out + 2 * 1.0;
yc = ya / 2;
zc = r1 * 2 * ( kz - 0.5 );
za = zc + r1 + nut_m4_h + 0.5;

$fn=20;


module lbe_ho_5x15xn2_4()
{
  difference() {
    cube( [xa,ya,za] );
    translate([ xw,yc,zc]) rotate([0,90,0]) cylinder( r=r1, h=L_all );
    translate([  0,yc,zc]) rotate([0,90,0]) cylinder( r=r_in, h=xa );
    translate([  5,yc,za-nut_m4_h]) nut6_place( nut_m4_r+0.3, nut_m4_h );
    translate([ 15,yc,za-nut_m4_h]) nut6_place( nut_m4_r+0.3, nut_m4_h );
    
  }
}

lbe_ho_5x15xn2_4();

