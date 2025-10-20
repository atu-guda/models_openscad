include <BOSL2/std.scad>

$fn = 30;

ov  = 0.05; // overshot for clean image

// external data
x_mo1  =  5.0; // base mounting holes offset
x_mo2  = 30.0;
y_d_mo = 10.0; // delta between right base mounting holes
z_c    = 11.0; // from other plate to screw axis center (15-4)
r_mh   = 1.8;  // nut mountings holes
l_mh   = 9.0;
r_mh2  = 2.3; // base holes
r_gu   = 5.0; // hole guard radius
d_1 = 10.0;  r_1 = d_1 / 2; // main hole 8mm axis + 2 mm shift
d_2 = 22.0;  r_2 = d_2 / 2; // place for =XXX=

// constuctions params
x_w   = 3.0;  // x wall
x_e   = 5.0;  // end part
z_1   = 4.0;  // base thickness
z_pm  = 1.2;  // +- holes

x_v = x_mo2 + r_gu;
x_a = x_v + x_w + r_mh2 * 2;
y_a = 34.0;

z_1o = z_1 + 2 * ov;
x_wo = x_w + 2 * ov;

z_a = z_c + r_2;
z_2 = z_a - z_1;
x_c = x_a / 2;  y_c = y_a / 2;

cf_w = 2.0; cf_h = 11;

rot_y = [0,90,0];

module hole_lx( r1, l, w )
{
  union() {
    translate( [-l,-r1,0] ) cube( [ 2*l, 2*r1, w ] );
    translate( [-l,0,0] ) cylinder( r=r1, h=w );
    translate( [ l,0,0] ) cylinder( r=r1, h=w );
  }
}

module hole_ly( r1, l, w )
{
  rotate(rot_y) hole_lx( r1,l, w );
}
 

// TODO: to lib
module conterforce( w, h=1.0 )
{
polyhedron(
  points=[
    [0,-h,0],[0,0,0],[0,0,h],
    [w,-h,0],[w,0,0],[w,0,h]],
  faces=[
    [0,1,2],[0,2,5,3],[3,5,4],
    [0,3,4,1],[1,4,5,2]
  ]);
}

module coord_x_nut_holder() {
  difference() {
    union() {
      //cube( [x_a, y_a, z_1] );
      translate([x_c,y_c,0]) prismoid([x_a,y_a], [x_a,y_a], h=z_1, rounding=3 );
      translate( [x_v,0,z_1] ) cube ([x_w,y_a,z_2]); // main stand
      
      translate( [x_v+x_w,0,z_1] ) rotate([0,0,90]) scale([1,0.32,1.63]) conterforce( x_w, cf_h );
      translate( [x_v+x_w,y_a-x_w,z_1] ) rotate([0,0,90]) scale([1,0.32,1.63]) conterforce( x_w, cf_h );
      translate( [x_v,cf_w,z_1] ) rotate([0,0,-90]) scale([1,1.6,1.63]) conterforce( cf_w, cf_h );
      translate( [x_v,y_a,z_1] ) rotate([0,0,-90]) scale([1,1.6,1.63]) conterforce( cf_w, cf_h );
    }
    
    translate([x_v+x_w,x_w,-ov]) cube( [x_e+2,y_a-2*x_w,z_1o] );
    translate([x_a-1,0,-ov]) cube( [x_e+2,y_a,z_1o] );

    // axis
    translate([x_v-ov,y_c,r_2]) hole_ly( r_1, z_pm, x_wo );       
    translate([x_v-ov,y_c-l_mh,r_2 ]) hole_ly( r_mh, z_pm, x_wo );
    translate([x_v-ov,y_c+l_mh,r_2 ]) hole_ly( r_mh, z_pm, x_wo );

    // base mount
    translate([x_mo1,y_c,-ov])    cylinder( r=r_mh2, h=z_1o );
    translate([x_mo2,y_c-y_d_mo,-ov]) cylinder( r=r_mh2, h=z_1o );
    translate([x_mo2,y_c+y_d_mo,-ov]) cylinder( r=r_mh2, h=z_1o );

  }
  translate([x_a-x_e+0.4,x_w,1.4*z_1]) fillet( l=2.8*z_1, r=2 );
  translate([x_a-x_e+0.4,y_a-x_w,1.4*z_1]) fillet( l=2.8*z_1, r=2, spin=270 );

}

coord_x_nut_holder();

//translate([x_c,y_c,20]) prismoid([x_a,y_a], [x_a,y_a], h=z_1, rounding=5 );


echo( );

