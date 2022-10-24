$fn = 32;
d_1 = 8.0; // axis diameter

r_1 = d_1 / 2 + 0.3; // minus, as
r_2 = r_1 + 4.0;      // external bottom
r_3 = r_1 + 2.0;      // external bottom

h_1 = 10.0;
h_2 = 15.0;

difference() {
  union() {
    cylinder( r=r_2, h=h_1 );
    cylinder( r=r_3, h=h_2 );
    translate( [r_1,-4.0,0.0] ) cube( [14.0,8.0,h_1] );
  }
  cylinder( r=r_1, h=h_2 );
  translate( [r_1-1,-0.5,0.0] ) cube( [13.8,1.4,h_2] );
  translate([r_2+4.0,5.0,5.0]) rotate([90,0,0]) cylinder( r=1.7, h=10 );
}
