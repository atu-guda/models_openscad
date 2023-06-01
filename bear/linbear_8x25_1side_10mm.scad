// assymetric holder for linear bearing D_in=8mm, D_out=15mm, L=25mm.
d_in   =  8.0;   // inner diameter (unused )
d_out  = 15.0;   // outer diameter
L_bear = 25.0;  // bearing length (unused)(Z)

r_out  = d_out / 2 + 0.0;
r_h    = 4.0   / 2 + 0.4;   // mounting hole

x_1 =  5.0;
x_2 = x_1 + 10.0;

//x_w    = 1.5;   // misc walls
y_w    = 2.5;   //
z_w    = 2.0;   //
x_l    = 9.0; // ~~3.5 * r_h;

x_a =  x_2 + r_out + 2.5;
y_a =  d_out + 2 * y_w;
z_a =  10;

x_c = x_a / 2;
y_c = y_a / 2;
z_c = z_a / 2;

dx = x_2 - x_1;

$fn=25;

module lbe_ho_8x25_1side_10mm()
{
  difference() {
    union() {
      cube( [x_a,y_a,z_a] );
      translate([-x_l,0,0]) cube( [x_l,2*y_w,z_a] );
    }
    // place for bearing
    translate([ 1.0,y_c-y_w/2,0]) cube( [dx,2.0,z_a] );
    translate([ x_2,y_w+r_out,0]) cylinder( r=r_out, h=z_a );
    // mounting holes
    translate([ x_1 ,0,z_c]) rotate([-90,0,0])  cylinder( r=r_h, h=y_a );
    translate([ x_1+10 ,0,z_c]) rotate([-90,0,0])  cylinder( r=1.8, h=2*y_w );
    translate([ -5.0,0,z_c]) rotate([-90,0,0])  cylinder( r=r_h, h=2*y_w );
    
  }
}

//translate([ 0,-4,0]) cube( [x_1,1,1] );
lbe_ho_8x25_1side_10mm();
echo( "x_a= ", x_a, "y_a= ", y_a, "z_a= ", z_a );
echo( "x1= ", x_1, "x_2=", x_2, " dx= ", dx, "x_l=", x_l );

