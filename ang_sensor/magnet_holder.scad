r1i = 3.0;
r1o = r1i + 2.0;
h1i = 2.0;
h1o = 5.0;

r2i = 1.6;
r2o = r2i + 2.2;
h2 = 10;

$fn=20;

difference() {
  union() {
    cylinder( h=h1o, r=r1o );
    translate( [0,0,h1o] ) cylinder( h=h2, r=r2o );
  }
  cylinder( h=h1o + h2, r=r2i );
  cylinder( h=h1i, r=r1i );
}

