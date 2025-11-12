$fn = 52;

r1i = ( 42.5+0.2 ) / 2;
r1o = r1i + 2.0;

difference() {
  cylinder( r=r1o, h= 3.0 );
  cylinder( r=r1i, h= 3.0+0.1 );
}

translate([50,0,0] ) {

difference() {
  cylinder( r=r1i-0.2, h= 3.0 );
  cylinder( r=r1i-2.0, h= 3.0+0.1 );
}
}
