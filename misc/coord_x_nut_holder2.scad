$fn = 30;

x_a = 30;
y_a = 30;
z_1 = 4.0;

d_1 = 11.0;  r_1 = d_1 / 2;
d_2 = 22.0;  r_2 = d_2 / 2;
r_mh = 2.1; l_mh = 8.0;
r_mh2 = 2.3;
z_a = d_2;
z_2 = z_a - z_1;
x_v = 16;
x_w = 3.0;

x_c = x_a / 2;
y_c = y_a / 2;

cf_w = 2.0; cf_h = 11;

rot_y = [0,90,0];

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
      cube( [x_a, y_a, z_1] );
      translate( [x_v,0,z_1] ) cube ([x_w,y_a,z_2]);
      translate( [x_v+x_w,0,z_1] ) rotate([0,0,90]) scale([1,1,1.6]) conterforce( cf_w, cf_h );
      translate( [x_v+x_w,y_a-cf_w,z_1] ) rotate([0,0,90]) scale([1,1,1.6]) conterforce( cf_w, cf_h );
      translate( [x_v,cf_w,z_1] ) rotate([0,0,-90]) scale([1,1,1.6]) conterforce( cf_w, cf_h );
      translate( [x_v,y_a,z_1] ) rotate([0,0,-90]) scale([1,1,1.6]) conterforce( cf_w, cf_h );
    }

    // axis
    translate([x_v,y_c,r_2]) rotate(rot_y) cylinder( r=r_1, h=x_w );
    translate([x_v-x_w*1.6,y_c,r_2]) rotate(rot_y) cylinder( r=r_2+2.0, h=x_w*1.6 );
    translate([x_v,y_c-l_mh,r_2-r_mh/3]) rotate(rot_y) cylinder( r=r_mh, h=x_w );
    translate([x_v,y_c+l_mh,r_2-r_mh/3]) rotate(rot_y) cylinder( r=r_mh, h=x_w );
    translate([x_v,y_c-l_mh,r_2+r_mh/3]) rotate(rot_y) cylinder( r=r_mh, h=x_w );
    translate([x_v,y_c+l_mh,r_2+r_mh/3]) rotate(rot_y) cylinder( r=r_mh, h=x_w );
    translate( [x_v,y_c-r_1,r_2] ) cube ([x_w,2*r_1,z_2-z_1]);
    
    
    // mount
    translate([ 5, 5,0]) cylinder( r=r_mh2, h=z_1 );
    translate([ 5,15,0]) cylinder( r=r_mh2, h=z_1 );
    translate([ 5,25,0]) cylinder( r=r_mh2, h=z_1 );
    translate([25, 5,0]) cylinder( r=r_mh2, h=z_1 );
    translate([25,15,0]) cylinder( r=r_mh2, h=z_1 );
    translate([25,25,0]) cylinder( r=r_mh2, h=z_1 );
    
  }

}

coord_x_nut_holder();

echo( );

