r1i = 3.1;
r1o = r1i + 2.0;
h1i = 2.4;
h1o = 5.0;

r2i = 3.6/2; // M4
r2o = r1o; // r2i + 2.2;
h2 = 10;

nut_r = 8.0/2; // M4
nut_h = 3.2;

$fn=20;

difference() {
  union() {
    cylinder( h=h1o, r=r1o );
    translate( [0,0,h1o] ) cylinder( h=h2, r=r2o );
  }
  cylinder( h=h1o + h2, r=r2i );
  cylinder( h=h1i, r=r1i );
  translate([0,0,h1o+h2-nut_h+0.1]) linear_extrude(nut_h)
    polygon( [ for (a = [0 : 60 : 359]) [ nut_r * sin(a), nut_r * cos(a) ] ] );
}

