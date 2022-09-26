// long nut 2 aside holding

// include <atu_supports.scad>
// include <atu_nut_axis.scad>

d_1  = 6.4;
r_1  = d_1 / 2;
r_h  = 4.0 / 2 + 0.2;

x_n  = 15.0; // nut length
x_a  = x_n + 2.0;

y_w  = 2.0;
y_x  = 0.5;
y_m  = y_w + d_1 + y_x;
y_a  = y_m + 6.0;
y_c  = y_m / 2;

z_w  = 2.0;
z_a  = z_w + d_1;
z_c  = z_a / 2;




$fn=25;


module nut4x15_side()
{
  difference() {
    cube( [x_a,y_a,z_a] );
    translate([ 0,y_c,z_c]) rotate([0,90,0]) cylinder( r=r_1, h=x_a );
    translate([  3.5,y_m+1.5*y_w,0])  cylinder( r=r_h, h=z_a );
    translate([ 13.5,y_m+1.5*y_w,0])  cylinder( r=r_h, h=z_a );

  }
}

 nut4x15_side();
//rotate([0,180,0]) nut4x15_side();

