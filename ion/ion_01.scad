$fn = 52;

r1i = ( 42.5+0.4 ) / 2;
r1o = r1i + 2.0;
h1 = 60.0;

difference() {
  union() {
  cylinder( r=r1o, h= 60.0 );
  translate([31,0,30])
  cube ([20,10,22],true);
  }
  translate([34.5,0,24])
  rotate([0,90,0])
  cylinder(r=1.4, h=7);
  translate([34.5,0,36])
  rotate([0,90,0])
  cylinder(r=1.4, h=7);

  cylinder( r=r1i, h= 60.0+0.1 );
}

//translate([50,0,0] ) {
//difference() {
//  cylinder( r=r1i-0.2, h= 3.0 );
//  cylinder( r=r1i-2.0, h= 3.0+0.1 );
//}
//}
