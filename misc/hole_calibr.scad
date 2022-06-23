// holes and pins for calibration

$fn = 20;
l1 = 6;
l2 = 16;
l3 = 25;
l4 = 36;

difference() {
  union() {
    cube( [60, 45, 1] );
    translate([  5, l1, 0]) cylinder( r=1.0, h=2 );
    translate([ 10, l1, 0]) cylinder( r=1.5, h=2 );
    translate([ 15, l1, 0]) cylinder( r=2.0, h=2 );
    translate([ 22, l1, 0]) cylinder( r=2.5, h=2 );
    translate([ 30, l1, 0]) cylinder( r=3.0, h=2 );
    translate([ 40, l1, 0]) cylinder( r=3.5, h=2 );
    translate([ 50, l1, 0]) cylinder( r=4.0, h=2 );
    
    // translate([  5, l2, 0]) cylinder( r=7.5, h=2 );
    // translate([ 10, l2, 0]) cylinder( r=7.0, h=2 );
    // translate([ 15, l2, 0]) cylinder( r=6.5, h=2 );
    translate([ 10, l2, 0]) cylinder( r=6.0, h=2 );
    translate([ 24, l2, 0]) cylinder( r=5.5, h=2 );
    translate([ 37, l2, 0]) cylinder( r=5.0, h=2 );
    translate([ 50, l2, 0]) cylinder( r=4.5, h=2 );
  }
  translate([  5, l3, 0]) cylinder( r=1.0, h=2 );
  translate([ 10, l3, 0]) cylinder( r=1.5, h=2 );
  translate([ 15, l3, 0]) cylinder( r=2.0, h=2 );
  translate([ 22, l3, 0]) cylinder( r=2.5, h=2 );
  translate([ 30, l3, 0]) cylinder( r=3.0, h=2 );
  translate([ 40, l3, 0]) cylinder( r=3.5, h=2 );
  translate([ 50, l3, 0]) cylinder( r=4.0, h=2 );
  
  translate([ 10, l4, 0]) cylinder( r=6.0, h=2 );
  translate([ 24, l4, 0]) cylinder( r=5.5, h=2 );
  translate([ 37, l4, 0]) cylinder( r=5.0, h=2 );
  translate([ 50, l4, 0]) cylinder( r=4.5, h=2 );
  
}

