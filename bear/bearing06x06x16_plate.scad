// holder for M6 bearing - test
$fn = 50;

ov = 0.05;
w = 2.5;
d_in = 6.0; // unnused
d_o  = 18.8;
d_o1 = d_o + w;
// h_b  = 6.0;
h_b  = 4.0; // pre-test

difference() {
  cylinder( d = d_o1, h = h_b );
  translate( [0,0,-ov] ) cylinder( d = d_o, h = h_b + 2*ov );
}



