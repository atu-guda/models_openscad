
S = 8.0; // strud
H = 7.8; // height on main hole direction
W = 7.6; // width on opposite direction
R1 = 2.4; // D=4.8 - main hole diameter
R2 = 3.1; // D=D.2 - enter to hole diameter
R_e = W / 2; // external radius

n_x = 3;
n_y = 5;
x_all = n_x * S;
y_all = n_y * S;
x_c = x_all / 2;

L1 = 1 * S / 2;
L2 = 3 * S / 2;
L3 = 5 * S / 2;
L4 = 7 * S / 2;
L5 = 9 * S / 2;

x_se = 12;
y_se = 24;
se_to_axis = 5.9;
yb = y_all - L2 - y_se + se_to_axis + 1.0; // 1.0 - for adjustment

$fn=32;

module z_hole()
{
  union() {
    cylinder( r=R1, h = H );
    cylinder( r=R2, h = 0.6 );
    translate( [0,0,H-0.6]) cylinder( r=R2, h = 0.6 );
  }
}

module x_hole()
{
  rotate([0,90,0]) z_hole();
}

module y_hole()
{
  rotate([-90,0,0]) z_hole();
}


difference() {
  union() {
    translate( [R_e,0,0] ) cube( [x_all-W,y_all,H] );
    translate( [0,R_e,0] ) cube( [x_all,y_all-W,H] );

    translate( [R_e,R_e,0] )             cylinder( r=R_e, h=H );
    translate( [x_all-R_e,R_e,0] )       cylinder( r=R_e, h=H );
    translate( [R_e,y_all-R_e,0] )       cylinder( r=R_e, h=H );
    translate( [x_all-R_e,y_all-R_e,0] ) cylinder( r=R_e, h=H );
  }
  translate([x_c-x_se/2,yb,-0.1]) cube([x_se,y_se,H+0.2] );
  translate([x_c-x_se/4-5,W ,-0.1]) cube([x_se/2,3.5,H+0.2] );
  translate([x_c+x_se/4+0,W ,-0.1]) cube([x_se/2,3.5,H+0.2] );
  
  //translate([L1,H,H/2]) rotate([90,0,0]) cylinder( r=R1, h = H );
  translate([L1,-0.01,H/2]) y_hole();
  translate([L2,L1,0]) z_hole();
  translate([L3,-0.01,H/2]) y_hole();
  translate([L1,y_all-H+0.02,H/2]) y_hole();
  translate([L2,y_all-H+0.02,H/2]) y_hole();
  translate([L3,y_all-H+0.02,H/2]) y_hole();
  
  translate([-0.01,L2,H/2]) x_hole();
  translate([-0.01,L3,H/2]) x_hole();
  translate([-0.01,L4,H/2]) x_hole();
  translate([2*S+0.21,L2,H/2]) x_hole();
  translate([2*S+0.21,L3,H/2]) x_hole();
  translate([2*S+0.21,L4,H/2]) x_hole();
  
}

//#cube([4*S,W,H]);
//#cube([W,6*S,H]);
//translate([0,y_all-W,0]) #cube([4*S,W,H]);
//translate([x_c,y_all-1.5*S,0]) #cylinder( h=1.3*H, r=0.5 );
//translate([L2,L4,0]) #cylinder( h=1.5*H, r=0.3 );
//#z_hole();


