

h_b  = 5.0;
r_b  = 6.0 / 2;
r_dr = 2.7 / 2;

h_s = 4.0;
r_s = 4.1 / 2;
alp_s = 49.12;
x_s = 1.55 * cos( alp_s );

$fn=20;

union() {
  difference() {
    cylinder( h=h_b, r=r_b );
    cylinder( h=h_b-0.5, r=r_dr );
  }
  difference() {
    translate( [0,0,h_b] ) cylinder( h=h_s, r=r_s );
    translate( [x_s,-5,h_b] ) cube( [10, 10, h_s+0.1] );
  }
}
