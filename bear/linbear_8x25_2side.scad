// holder for linear bearing D_in=8mm, D_out=15mm, L=25mm. 2-Side mounting
d_in   =  8.0;   // inner diameter
d_out  = 15.0;   // outer diameter
L_bear = 25.0;  // bearing length (Y)

r_out  = d_out / 2 + 0.4;
r_in   = d_in  / 2 + 1.5;
r_h    = 4.0   / 2 + 0.3;   // mounting hole

x_w    = 3.0;   // misc walls
y_w    = 2.0;   //
z_w    = 2.0;   //

x_a =  d_out + 2 * 4.0 + 3 * x_w;
y_a = L_bear + 2 * y_w;
z_a = d_out  + 1 * z_w;

x_c = x_a / 2;
y_c = y_a / 2;
z_c = r_out + z_w;

$fn=25;


module lbe_ho_8x25_2side()
{
  difference() {
    translate([ -x_c,-y_c,0]) cube( [x_a,y_a,z_a] );
    // place for bearing
    translate([ -r_out,-0.2-L_bear/2,z_c]) cube( [2*r_out,L_bear+0.4,z_c] );
    translate([ 0,-0.2-L_bear/2,z_c]) rotate([-90,0,0]) cylinder( r=r_out, h=L_bear+0.4 );
    translate([ 0,-y_c,z_c]) rotate([-90,0,0]) cylinder( r=r_in, h=x_a );
    // mounting holes
    translate([ -12.5,-10,0]) cylinder( r=r_h, h=z_a );
    translate([  12.5,-10,0]) cylinder( r=r_h, h=z_a );
    translate([ -12.5, 10,0]) cylinder( r=r_h, h=z_a );
    translate([  12.5, 10,0]) cylinder( r=r_h, h=z_a );
    
  }
}

// translate([ 40,0,0]) cube( [1,5,1] );
lbe_ho_8x25_2side();
echo( "x_a= ", x_a, "y_a= ", y_a, "z_a= ", z_a );

