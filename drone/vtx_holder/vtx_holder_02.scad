// VTX dominator 2W holder for drone 9""

include <atu_supports.scad>

$fn = 30;

h_0 = 29.4; // column height
w_1 =  3; // generic wall thickness

// mouting to frame
l_d2 = 27;        // distance between columns in frame
l_d1 = l_d2 / 2;  // distance between column and center
x_c_vtx = 10;     // distance between column and VTX


r1_in  = ( 5.0 + 0.8 ) / 2; // inner radius with compensation
r1_out = 10.0 / 2;

// VTX dimensions
x_v  = 36;
y_v  = 36;
z_v  = 15;
lx_vh = 30.5; // distance between holes
ly_vh = 30.5;
dlt_box_hole = 4.0;
x_box_hole = lx_vh - dlt_box_hole;
y_box_hole = ly_vh - dlt_box_hole;

x_vc = x_v / 2;
y_vc = 0;
x_vh1 = x_vc - lx_vh / 2; // mounting holes coords
x_vh2 = x_vc + lx_vh / 2;
y_vh1 = y_vc - ly_vh / 2;
y_vh2 = y_vc + ly_vh / 2;

x_l1  = x_v + 6;
x_1  = x_l1 + x_c_vtx;
y_1  = y_v + 4;
y_1m = l_d2 + 2 * r1_out;
z_1 =  3;
h_1 =  0; // from frame to bottom plane

d_mhole = 2.5; // really more, but for thread
h_mhole = 10;
d_stand2 = d_mhole + 2.0;
d_stand1 = d_stand2 + 1.8;
z_stand = 4.0;

z_915 = 18.0;

w_rstand = 5.0;
alp_ant = 25;

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

module vtx_holder_02()
{
  difference(){
    union(){

      translate([-x_c_vtx, l_d1,0]) cylinder( h = h_0, r = r1_out );
      translate([-x_c_vtx,-l_d1,0]) cylinder( h = h_0, r = r1_out );
      translate([-x_c_vtx,-l_d1,0]) cylinder( h = w_1, r = r1_out+1.5 ); // TODO: calc on y_1
      translate([-x_c_vtx, l_d1,0]) cylinder( h = w_1, r = r1_out+1.5 );
      translate([-x_c_vtx,-l_d1,w_1]) cylinder( h = w_1/2, r1= r1_out+1.2, r2=r1_out );
      translate([-x_c_vtx, l_d1,w_1]) cylinder( h = w_1/2, r1= r1_out+1.2, r2=r1_out );
      translate([-x_c_vtx-w_1/2,0,w_1]) supp_xywra( w_1,   w_1/2, l_d2, 3.0, 180 );
      translate([-x_c_vtx+w_1/2,0,w_1]) supp_xywra( w_1/2, w_1/2, l_d2, 2.0,   0 );
      translate([-x_c_vtx-w_1/2,-l_d1,  0]) cube([w_1,l_d2,h_0]); // plate between cylinders
      translate([-x_c_vtx-r1_out,-l_d1,h_1]) cube([r1_out,l_d2,z_1]);  // left of cylinders
      
      translate([-x_c_vtx,-y_1/2,h_1]) cube([x_1-3,y_1,z_1]);  // main plate
      translate([x_1-12.5,-l_d1-4,0]) cylinder( h = w_1, r = 2.5 );
      translate([x_1-12.5, l_d1+4,0]) cylinder( h = w_1, r = 2.5 );
      translate([x_1-13,-y_1/2+2,h_1]) cube([3,y_1-4,z_1]);  // main plate
         
      // mounting stands
      translate([x_vh1,y_vh1,h_1+w_1]) cylinder( d1=d_stand1, d2=d_stand2, h=z_stand );
      translate([x_vh1,y_vh2,h_1+w_1]) cylinder( d1=d_stand1, d2=d_stand2, h=z_stand );
      translate([x_vh2,y_vh1,h_1+w_1]) cylinder( d1=d_stand1, d2=d_stand2, h=z_stand );
      translate([x_vh2,y_vh2,h_1+w_1]) cylinder( d1=d_stand1, d2=d_stand2, h=z_stand );
      translate([-9,-y_1/2+3,        z_1]) cube([10,3,z_stand]);
      translate([-9, y_1/2-6,        z_1]) cube([10,3,z_stand]);
        
      // right frame
      translate([x_l1-w_rstand,-y_1/2+2,          0]) cube([w_rstand,w_rstand,h_0]);
      translate([x_l1-w_rstand, y_1/2-2-w_rstand, 0]) cube([w_rstand,w_rstand,h_0]);
      translate([x_l1-w_rstand/2-1,-y_1/2+2,     w_1]) supp_xywra( 2, w_rstand, 3, 2.5, -90 );
      translate([x_l1-w_rstand/2-1,+y_1/2-2,     w_1]) supp_xywra( 2, w_rstand, 3, 2.5,  90 );
      translate([x_l1-w_rstand-3,-y_1/2+3,        z_1]) cube([3,3,z_stand]);
      translate([x_l1-w_rstand-3, y_1/2-6,        z_1]) cube([3,3,z_stand]);
      // for 915
      translate([x_l1-w_rstand+5,-y_1/2+2,       z_915  ]) cube([2,w_rstand,2]);
      translate([x_l1-w_rstand+5,-y_1/2+2,       z_915+4]) cube([2,w_rstand,2]);
      translate([x_l1-w_rstand+6.6,-y_1/2+2,      z_915  ]) cube([0.4,w_rstand,6]);
      translate([x_l1-w_rstand+5,-y_1/2+w_rstand-0.5,       z_915])
        rotate([0.0,180]) supp_xywra( 2, 2, w_rstand, 3.0,  180 );
      //  
      translate([x_l1-w_rstand+5,+y_1/2-w_rstand-2,       z_915  ]) cube([2,w_rstand,2]);
      translate([x_l1-w_rstand+5,+y_1/2-w_rstand-2,       z_915+4]) cube([2,w_rstand,2]);
      translate([x_l1-w_rstand+6.6,+y_1/2-w_rstand-2,       z_915  ]) cube([0.4,w_rstand,6]);
      translate([x_l1-w_rstand+5,+y_1/2-w_rstand+0.5,       z_915])
        rotate([0.0,180]) supp_xywra( 2, 2, w_rstand, 3.0,  180 );
         
      // top frame
      translate([-x_c_vtx,-y_1/2+2,          h_0-w_1]) cube([x_1,w_rstand+1,w_1]);
      translate([-x_c_vtx, y_1/2-3-w_rstand, h_0-w_1]) cube([x_1,w_rstand+1,w_1]);
      // top-right bar
      translate([x_l1-2*w_rstand,-y_v/2,          h_0-w_1+1]) rotate([0,alp_ant,0])
          cube([2.4*w_rstand,y_v,w_1+0.5]);
      
      
      // TMP: vtc gabarites
      // color("green") translate([0,-y_v/2,w_1]) cube([x_v,y_v,z_v]);
    }

    // holes in the mouting cylinders
    translate([-x_c_vtx, l_d1,0]) cylinder( h = h_0, r = r1_in );
    translate([-x_c_vtx,-l_d1,0]) cylinder( h = h_0, r = r1_in );

    translate([x_vc-(x_box_hole)/2,-(y_box_hole)/2,h_1]) cube([x_box_hole,y_box_hole,3*z_1]);  // hole in main plate
    translate([-12,0,15]) rotate([0,90,0]) cylinder( h = w_1+1, r = l_d1 - r1_out + 1 ); // hole in the wall
    // translate([-12,0,h_0-3]) rotate([0,90,0]) cylinder( h = w_1+1, r = 1.0 ); // small hole in the wall
    // translate([5,19,24]) rotate([90,0,0]) cylinder( h = y_v2, r = 1.0 ); 

    translate([x_vh1,y_vh1,0]) cylinder( d=d_mhole, h=h_mhole ); // small mounting holes
    translate([x_vh1,y_vh2,0]) cylinder( d=d_mhole, h=h_mhole );
    translate([x_vh2,y_vh1,0]) cylinder( d=d_mhole, h=h_mhole );
    translate([x_vh2,y_vh2,0]) cylinder( d=d_mhole, h=h_mhole );
    
    // anti top-right bar
    translate([x_l1-2*w_rstand,-y_1/2, h_0-w_1+4.5]) rotate([0,alp_ant,0]) cube([3*w_rstand,y_1,w_1]);
    translate([x_l1-2*w_rstand+7.6,-y_1/2, h_0-w_1+4.5]) rotate([0,60,0]) cube([3*w_rstand,y_1,w_1]);
    translate([x_l1-3*w_rstand,-y_1/2, h_0-w_1+3.0]) cube([3*w_rstand,y_1,w_1]);
    translate([x_l1-1.3*w_rstand+2.5,0, h_0-2*w_1]) rotate([0,alp_ant,0]) cylinder( d=3.2, h=6);
        
  }

}



vtx_holder_02();



