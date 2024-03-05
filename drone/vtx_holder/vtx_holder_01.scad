// VTX 2W holder for drone 8""

include <atu_supports.scad>

$fn = 30;

h_0 = 29; // column height
w_1 = 3;

l_d2 = 27;        // distance between columns in frame
l_d1 = l_d2 / 2;  // distance between column and center
x_c_vtx = 10;     // distance between column and VTX

r1_in  = ( 5.0 + 0.8 ) / 2; // inner radius with compensation
r1_out = 10.0 / 2;

// VTX dimensions
x_v  = 50;
y_v1 = 25;
y_v2 = 36; // with mounting plates
z_v1 = 15.5;
z_v2 = 10.0; // cooler add

x_1 = 64;
y_1 = 36;
z_1 =  3;
h_1 =  0;

x_2 = x_v  + 4;
y_2 = y_v1 + 1;

// just for reference, do not print
module vtx_01()
{
  h_sink  = 4.75;
  h_air   = 3.90;
  h_board = 1.60;
  z_main = 2 * h_sink + h_air + h_board;

  color("gray") translate([0,-y_v1/2,0]) cube([x_v,y_v1,h_sink]);
  color("lightgray") translate([0,-y_v1/2,h_sink]) cube([x_v,y_v1,h_air]);
  z_board = h_sink + h_air;

  color("green") translate([0,-y_v1/2,z_board]) cube([x_v,y_v1,h_board]);

  difference() {
    color("green") translate([10-3,+15-3,z_board]) cube([6,6,h_board]);
    translate([10,15,z_board]) cylinder( d=3.2, h=h_board );
  }
  difference() {
    color("green") translate([10-3,-15-3,z_board]) cube([6,6,h_board]);
    translate([10,-15,z_board]) cylinder( d=3.2, h=h_board );
  }
  difference() {
    color("green") translate([40-3,+15-3,z_board]) cube([6,6,h_board]);
    translate([40,15,z_board]) cylinder( d=3.2, h=h_board );
  }
  difference() {
    color("green") translate([40-3,-15-3,z_board]) cube([6,6,h_board]);
    translate([40,-15,z_board]) cylinder( d=3.2, h=h_board );
  }

  color("gray") translate([0,-y_v1/2,h_sink+h_air+h_board]) cube([x_v,y_v1,h_sink]);
  echo( "z_main= ", z_main );
  color("gray") translate([25,-y_v1/2,z_main]) cube([25,25,10]);
  color("gold") translate([x_v,0,z_board-2])
    rotate( [0,90,0] ) cylinder( r=3, h=10 );
}

module vtx_holder_01()
{
  difference(){
    union(){

      translate([-x_c_vtx, l_d1,0]) cylinder( h = h_0, r = r1_out );

      translate([-x_c_vtx,-l_d1,0]) cylinder( h = h_0, r = r1_out );
      translate([-x_c_vtx-w_1/2,-l_d1,  0]) cube([w_1,l_d2,h_0]); // between cylinders
      translate([-x_c_vtx,-y_1/2,h_1]) cube([x_1,y_1,z_1]);  // main plate

      translate([10-3,-18,h_1+z_1]) cube([6,6,5.5]);
      translate([10-3, 12,h_1+z_1]) cube([6,6,5.5]);
      translate([40-3,-18,h_1+z_1]) cube([6,6,5.5]);
      translate([40-3, 12,h_1+z_1]) cube([6,6,5.5]);
      translate([10+3,-15,h_1+z_1]) supp_xywra( 4, 5.5, 6, 1.5, 0 );
      translate([10+3, 15,h_1+z_1]) supp_xywra( 4, 5.5, 6, 1.5, 0 );
      translate([40+3,-15,h_1+z_1]) supp_xywra( 4, 5.5, 6, 1.5, 0 );
      translate([40+3, 15,h_1+z_1]) supp_xywra( 4, 5.5, 6, 1.5, 0 );
      translate([40-3,-15,h_1+z_1]) supp_xywra( 4, 5.5, 6, 1.5, 180 );
      translate([40-3, 15,h_1+z_1]) supp_xywra( 4, 5.5, 6, 1.5, 180 );

      translate([-7,-l_d1-1.5,z_1]) supp_xywra( 15, h_0-z_1-1, 2, 1.3, 0 );
      translate([-7, l_d1+1.5,z_1]) supp_xywra( 15, h_0-z_1-1, 2, 1.3, 0 );

      translate([-2,-l_d1-2.5,z_1]) supp_xywra( 2.0, 1.5, 14.0, 1.5, 270 );
      translate([-2,+l_d1+2.5,z_1]) supp_xywra( 2.0, 1.5, 14.0, 1.5,  90 );
      translate([-x_c_vtx+1.5,0,z_1]) supp_xywra( 2.0, 2.5, 22.0, 1.5,   0 );
    }

    translate([-x_c_vtx, l_d1,0]) cylinder( h = h_0, r = r1_in );
    translate([-x_c_vtx,-l_d1,0]) cylinder( h = h_0, r = r1_in );
    translate([-3,-y_2/2,h_1]) cube([x_2,y_2,3*z_1]);  // hole in main plate
    translate([-12,0,15]) rotate([0,90,0]) cylinder( h = w_1+1, r = 9 ); // hole in the wall
    translate([-12,0,h_0-3]) rotate([0,90,0]) cylinder( h = w_1+1, r = 1.0 ); // small hole in the wall

    translate([10,-15,h_1]) cylinder( d=3.0, h=3*z_1 ); // small holes
    translate([10, 15,h_1]) cylinder( d=3.0, h=3*z_1 );
    translate([40,-15,h_1]) cylinder( d=3.0, h=3*z_1 );
    translate([40, 15,h_1]) cylinder( d=3.0, h=3*z_1 );
  }

}

vtx_holder_01();

vtx_01();

