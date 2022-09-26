// holder for linear bearing D_in=5mm, L=15mm. Side mounting
d_in = 5.0;   // inner diameter
d_out = 10.0; // outer diameter
L_all = 15.4; //

r1   = d_out / 2 + 0.4;
r_in = d_in  / 2 + 1.0;
r_h  = 4.0 / 2 + 0.3;

// include <atu_supports.scad>
// include <atu_nut_axis.scad>

kz = 0.70;
xw = 2.5; // wall
yw = 2.0;
ys = 6.0;
xa = L_all + 2 * xw;
ya = d_out + 2 * yw;
yc = ya / 2;
zc = r1 * 2 * ( kz - 0.5 );
za = zc + r1 + 0.7;

$fn=25;


module lbe_ho_5x15_side()
{
  difference() {
    cube( [xa,ya+ys,za] );
    translate([ xw,yc,zc]) rotate([0,90,0]) cylinder( r=r1, h=L_all );
    translate([  0,yc,zc]) rotate([0,90,0]) cylinder( r=r_in, h=xa );
    translate([  5,ya+yw,0]) rotate([0,0,0]) cylinder( r=r_h, h=za );
    translate([ 15,ya+yw,0]) rotate([0,0,0]) cylinder( r=r_h, h=za );
  }
}

// lbe_ho_5x15_side();
rotate([180,0,0]) lbe_ho_5x15_side();

