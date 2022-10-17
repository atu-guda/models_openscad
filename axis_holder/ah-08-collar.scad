$fn = 25;
d_1 = 8.0; // axis diameter

r_1 = d_1 / 2 + 0.2;
r_hh = 9.0;       // distance to mounting holes
r_2 = r_1 + 2.0;  // collar place
r_h = 1.5 + 0.2;
r_b = r_hh + r_h + 2.0;
r_3 = r_2 + 0.5;  // ring above
h_b = 3.0;
h_2 = 8.0;
h_3 = 1.0;

difference() {
  union() {
    cylinder( r=r_b, h=h_b );
    translate( [0,0,h_b] ) cylinder( r=r_2, h=h_2 );
    translate( [0,0,h_b+h_2] ) cylinder( r=r_3, h=h_3 );
  }
  cylinder( r=r_1, h=h_b+h_2+h_3 );
  translate( [-r_hh,0,0] ) cylinder( r=r_h, h=h_b );
  translate( [ r_hh,0,0] ) cylinder( r=r_h, h=h_b );
  translate( [0, r_hh,0] ) cylinder( r=r_h, h=h_b );
  translate( [0,-r_hh,0] ) cylinder( r=r_h, h=h_b );
  rotate([0,0, 45] ) translate( [-r_3,0,h_b+0.5] )  cube([2*r_3,0.5,h_2+h_3]) ;
  rotate([0,0,135] ) translate( [-r_3,0,h_b+0.5] )  cube([2*r_3,0.5,h_2+h_3]) ;
}
