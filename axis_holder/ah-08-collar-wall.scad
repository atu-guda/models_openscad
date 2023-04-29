$fn = 25;
d_1 = 8.0; // axis diameter

r_1 = d_1 / 2 + 0.2;
r_hh = 9.0;       // distance to mounting holes
r_2 = r_1 + 2.0;  // collar place
r_h = 1.5 + 0.2;
r_b = r_hh + r_h + 2.0;

h_b = 3.0;
h_2 = 8.0;
h_3 = 1.0;

difference() {
  union() {
    cylinder( r=r_b, h=h_b );
    translate( [0,0,h_b] ) cylinder( r=r_2, h=h_2 );
    
    translate( [r_1-0.5,-4.0,h_b+1] ) cube( [14.0,8.0,h_2-1] );
  }
  cylinder( r=r_1, h=h_b+h_2+h_3 );
  translate( [-r_hh,0,0] ) cylinder( r=r_h, h=h_b );
  // translate( [ r_hh,0,0] ) cylinder( r=r_h, h=h_b );
  translate( [0, r_hh,0] ) cylinder( r=r_h, h=h_b );
  translate( [0,-r_hh,0] ) cylinder( r=r_h, h=h_b );
  #translate( [r_1-0.5,-0.8,h_b+1] ) cube( [13.0,1.6,h_2-1] );
  
  
}
