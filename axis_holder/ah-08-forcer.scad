$fn = 25;
d_1 = 8.0; // axis diameter

r_1 = d_1 / 2 ; // - 0.2; // minus, as
r_2 = r_1 + 3.0;      // external
r_h = 4.0 / 2 + 0.2;

h_1 = 10.0;
h_f = 4.0;
hand_w = 8.0;
hand_l = 55.0;

difference() {
  union() {
    cylinder( r=r_2, h=h_1 );
    translate( [r_1,-3.0,0.0] ) cube( [10.7,6.0,h_1] );
    //translate( [-(r_1+hand_l),-hand_w/2,0.0] ) cube( [hand_l,hand_w,h_f] );  
    linear_extrude(h_f)
      polygon(points=[[0,r_2],[-hand_l,hand_w/2],[-hand_l,-hand_w/2],[0,-r_2]]);
  }
  cylinder( r=r_1, h=h_1 );
  translate( [r_1-1,-0.6,0.0] ) cube( [11.4,1.2,h_1] );
  translate([r_2+4.0,5.0,5.0]) rotate([90,0,0]) cylinder( r=r_h, h=10 );
  for(i=[10:10:50]) {
    translate([-i,0.0,0.0]) cylinder( r=r_h, h=5.0 );
  }
}
