// just test output
$fn = 32;


h_0 = 8.0;

difference() {
  cube( [20.0,8.0,8.0] );
  translate( [    5.0,h_0/2,0.0]) cylinder( r=2.5, h=h_0 );
  #translate( [   15.0,0.0,h_0/2]) rotate([-90,0,0]) cylinder( r=2.0, h=h_0 );
}

