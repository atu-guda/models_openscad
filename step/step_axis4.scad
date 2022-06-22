// axis from stepmotor to M4
d1i = 5.2;
r1i = d1i/2;
r1o = r1i + 2.5;
h1i = 6.0;
h1o = 6.0;

r2i = 3.6/2; // for M4 thread
r2o = r1o; // r2i + 2.2;
h2 = 8;

shi = 3.2 / 2;
nut_r = 8.0/2;
nut_h = 3.2;

$fn=20;


union() {
  difference() {
    translate( [0,0,h1o] ) cylinder( h=h2, r=r2o );
    translate( [0,0,h1o] ) cylinder( h=h2, r=r2i );
    translate([0,0,h1o+h2-nut_h+0.1]) linear_extrude(nut_h)
      polygon( [ for (a = [0 : 60 : 359]) [ nut_r * sin(a), nut_r * cos(a) ] ] );

  }
  difference() {
    cylinder( h=h1o, r=r1o );
    difference() {
      cylinder( h=h1i, r=r1i );
      translate([    shi,-5,0]) cube([10,10,h1i]);
      translate([-shi-10,-5,0]) cube([10,10,h1i]);
    }
  }
}


