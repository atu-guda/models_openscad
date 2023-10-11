r1  = 7.0;
h1  = 2.0;

r2i = 4.15;
r2o = r2i + 1.5;
h2  = 8.0;

$fn=30;

difference() {
  union() {
    cylinder( h=h1, r=r1 );
    translate( [0,0,h1] ) cylinder( h=h2, r=r2o );
  }
  cylinder( h=h1, r=1.5 );
  translate( [0,0,h1] ) cylinder( h=h2, r=r2i );
}

