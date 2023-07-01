// dual holder for linear bearing D_in=8mm, D_out=15mm, L=25mm.
d_in   =  8.0;   // inner diameter (unused )
d_out  = 15.0;   // outer diameter
L_bear = 25.0;  // bearing length (unused)(Z)

r_out  = d_out / 2 + 0.4;
r_h    = 4.0   / 2 + 0.4;   // main mounting hole
r_hv   = 3.0   / 2 + 0.1;   // vert mounting hole

x_a =  80;
y_a =  28;
z_a =  10;

x_1 =  10.0;
x_2 = x_a - x_1;

y_w    = 2.5;   //
z_w    = 2.0;   //

x_c = x_a / 2;
y_c = 18.0; // y_a / 2;
z_c = z_a / 2;

dx = x_2 - x_1;
d_m = 8 / sqrt(2.0);

$fn=25;

module lbe_ho_2x_8x25_1side_10mm()
{
  difference() {
    union() {
      cube( [x_a,y_a,z_a] );
    }
    // place for bearing
    translate([ x_1+r_out- 1,y_c-y_w/2,0]) cube( [13,2.0,z_a] );
    translate([ x_1+r_out+10,y_c-y_w/2,0]) cube( [2.0,10.0,z_a] );
    translate([ x_2-r_out-12,y_c-y_w/2,0]) cube( [13,2.0,z_a] );
    translate([ x_2-r_out-12,y_c-y_w/2,0]) cube( [2.0,10.0,z_a] );
    translate([ x_1,y_c,0]) cylinder( r=r_out, h=z_a );
    translate([ x_2,y_c,0]) cylinder( r=r_out, h=z_a );
    translate([ x_c,y_c,0]) cylinder( r=6.0,  h=z_a );
    // mounting holes
    translate([ x_1   ,0,z_c]) rotate([-90,0,0])  cylinder( r=r_h-0.3, h=y_c );
    translate([ x_1+12,0,z_c]) rotate([-90,0,0])  cylinder( r=r_h    , h=y_a );
    translate([ x_2   ,0,z_c]) rotate([-90,0,0])  cylinder( r=r_h-0.3, h=y_c );
    translate([ x_2-12,0,z_c]) rotate([-90,0,0])  cylinder( r=r_h    , h=y_a );
    translate([ x_c   ,0,z_c]) rotate([-90,0,0])  cylinder( r=r_h-0.3, h=y_c );
    translate([ x_c-d_m,y_c-d_m,0]) cylinder( r=r_hv, h=y_a );
    translate([ x_c-d_m,y_c+d_m,0]) cylinder( r=r_hv, h=y_a );
    translate([ x_c+d_m,y_c-d_m,0]) cylinder( r=r_hv, h=y_a );
    translate([ x_c+d_m,y_c+d_m,0]) cylinder( r=r_hv, h=y_a );
  }
}

//translate([ 0,-4,0]) cube( [x_1,1,1] );
//projection(cut = true)
lbe_ho_2x_8x25_1side_10mm();
echo( "x_a= ", x_a, "y_a= ", y_a, "z_a= ", z_a );
echo( "x1= ", x_1, "x_2=", x_2, " dx= ", dx );

