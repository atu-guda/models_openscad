$fn = 25;
d_1 = 8.0; // axis diameter

r_1 = d_1 / 2 - 0.2; // minus, as
r_2 = r_1 + 3.0;      // external

h_1 = 10.0;

difference() {
  union() {
    cylinder( r=r_2, h=h_1 );
    translate( [r_1,-3.0,0.0] ) cube( [10.0,6.0,h_1] );
    translate( [-(r_1+40.0),-3.0,0.0] ) cube( [40.0,6.0,h_1/3] );  
  }
  cylinder( r=r_1, h=h_1 );
  translate( [r_1-1,-0.5,0.0] ) cube( [10.8,1.0,h_1] );
  translate([r_2+4.0,5.0,5.0]) rotate([90,0,0]) cylinder( r=1.7, h=10 );
  translate([-40,0.0,0.0]) cylinder( r=1.7, h=5.0 );
  translate([-30,0.0,0.0]) cylinder( r=1.7, h=5.0 );
  translate([-20,0.0,0.0]) cylinder( r=1.7, h=5.0 );
  translate([-10,0.0,0.0]) cylinder( r=1.7, h=5.0 );
  
}
