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
z_v1 = 15.5;
z_v2 = 10.0; // cooler add
x_t  = 6.0;  // tabs
y_t  = 6.0;
dx_t0 = 10;   // tabs offset and step
dx_t = 30.0;
dy_t = 30.0;
y_v2 = y_v1 + 2 * y_t; // with mounting tabs

xg_1_1 = 3.0; // gap: holder - vtx near
xg_1_2 = 1.0; // gap: holder - vtx far
yg_1   = 1.0; // gap on y

x_1 = 64;
y_1 = l_d2 + 2 * r1_out;
z_1 =  3;
h_1 =  0; // from frame to bottom plane

x_2 = x_v  + xg_1_1 + xg_1_2;
y_2 = y_v1 + 2 * yg_1;

d_mhole = 3.0; // really more, but for thread

module tag_mount( x, y, z, dia )
{
  difference() {
    translate([-x/2,-y/2,0]) cube([x,y,z]);
    cylinder( d=dia, h=z );
  }
}

// just for reference, do not print
module vtx_01()
{
  h_sink  = 4.75;
  h_air   = 3.90;
  h_board = 1.60;
  z_main = 2 * h_sink + h_air + h_board;

  color("gray") translate([0,-y_v1/2,0]) cube([x_v,y_v1,h_sink]); // bottom heatsink
  color("lightgray") translate([0,-y_v1/2,h_sink]) cube([x_v,y_v1,h_air]);
  z_board = h_sink + h_air;

  // PCB
  color("green") {
    translate([0,-y_v1/2,z_board]) cube([x_v,y_v1,h_board]);
    translate([dx_t0,      -dy_t/2, z_board]) tag_mount( x_t, y_t, h_board, d_mhole );
    translate([dx_t0,       dy_t/2, z_board]) tag_mount( x_t, y_t, h_board, d_mhole );
    translate([dx_t0+dx_t,  dy_t/2, z_board]) tag_mount( x_t, y_t, h_board, d_mhole );
    translate([dx_t0+dx_t, -dy_t/2, z_board]) tag_mount( x_t, y_t, h_board, d_mhole );
  }

  color("gray") translate([0,-y_v1/2,h_sink+h_air+h_board]) cube([x_v,y_v1,h_sink]);

  echo( "z_main= ", z_main );
  color("gray") translate([x_v/2,-y_v1/2,z_main]) cube([x_v/2,y_v1,z_v2]); // cooler
  color("gold") translate([x_v,0,z_board-2])
    rotate( [0,90,0] ) cylinder( r=3, h=10 ); // SMA
}

module stand_mount( x, y, z )
{
  union() {
    translate([-x/2,-y/2,0]) {
      cube([x,y,z]);
      translate([x,y/2,0]) supp_xywra( x/2, z, y, 1.5, 0 );
      translate([0,y/2,0]) supp_xywra( x/2, z, y, 1.5, 180 );
    }
  }
}

module vtx_holder_01()
{
  difference(){
    union(){

      translate([-x_c_vtx, l_d1,0]) cylinder( h = h_0, r = r1_out );
      translate([-x_c_vtx,-l_d1,0]) cylinder( h = h_0, r = r1_out );

      translate([-x_c_vtx-w_1/2,-l_d1,  0]) cube([w_1,l_d2,h_0]); // between cylinders
      translate([-x_c_vtx,-y_1/2,h_1]) cube([x_1,y_1,z_1]);  // main plate

      translate([10-3,-18,h_1+z_1]) cube([x_t,y_t,5.5]);
      translate([10-3, 12,h_1+z_1]) cube([x_t,y_t,5.5]);
      translate([40-3,-18,h_1+z_1]) cube([x_t,y_t,5.5]);

      translate([10,-15,h_1+z_1]) stand_mount(x_t,y_t,5.5);
      translate([10, 15,h_1+z_1]) stand_mount(x_t,y_t,5.5);
      translate([40,-15,h_1+z_1]) stand_mount(x_t,y_t,5.5);
      translate([40, 15,h_1+z_1]) stand_mount(x_t,y_t,5.5);

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
    // translate([-12,0,h_0-3]) rotate([0,90,0]) cylinder( h = w_1+1, r = 1.0 ); // small hole in the wall

    translate([10,-15,h_1]) cylinder( d=d_mhole, h=3*z_1 ); // small mounting holes
    translate([10, 15,h_1]) cylinder( d=d_mhole, h=3*z_1 );
    translate([40,-15,h_1]) cylinder( d=d_mhole, h=3*z_1 );
    translate([40, 15,h_1]) cylinder( d=d_mhole, h=3*z_1 );
  }

}

vtx_holder_01();

vtx_01();

