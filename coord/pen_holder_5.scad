r1i  = 4.6;
r1o  = r1i+1.5;
h1  = 15.0;

r2i = 2.65;
r2o = r2i + 2.7;
h2  = 7.0;

$fn=30;

difference() {
  union() {
    cylinder( h=h1, r=r1o );
    translate( [0,0,h1] ) cylinder( h=h2, r=r2o );
  }
  cylinder( h=h1, r=r1i );
  translate( [0,0,h1] ) cylinder( h=h2, r=r2i );
}

