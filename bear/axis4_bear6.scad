$fn = 50;
ov = 0.05;

d_1 = 3.75;
d_2 = 5.90;
d_a = 0.30;
h_1 = 5.6;
h_2 = 1.0;

difference() {
  union() {
    cylinder( d1 = d_2+d_a, d2=d_2,  h = h_1+h_2 );
    cylinder( d = d_2+2,             h = h_2 );
    
  }
  translate([0,0,-ov]) cylinder( d = d_1, h = h_1+h_2+2*ov );
}

