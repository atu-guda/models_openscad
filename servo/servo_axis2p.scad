// extender from serbo to M4 with nut place - 2 peases
r1i = 5.8/2;
r1o = r1i + 2.0;
h1i = 4.0;
h1o = 6.0;

r2i = 1.6;
r2o = r1o; // r2i + 2.2;
h2 = 10;

bracing_x = 16;
bracing_y = 5;
bracing_z = 4;

hole_r = 1.1;

nut_r = 8.0/2;
nut_h = 3.2;


$fn=20;

module servo_axis()
{
  difference() {
    union() {
      cylinder( h=h1o, r=r1o );
      translate( [0,0,h1o] ) cylinder( h=h2, r=r2o );
      translate( [-bracing_x/2,-bracing_y/2,0] ) cube( [bracing_x,bracing_y,bracing_z] );
      translate( [-bracing_x/2,-bracing_y/2,h2+h1o-bracing_z] ) cube( [bracing_x,bracing_y,bracing_z] );
    }
    cylinder( h=h1o + h2, r=r2i );
    cylinder( h=h1i, r=r1i );
    translate([0,0,h1o+h2-nut_h+0.1]) linear_extrude(nut_h)
    polygon( [ for (a = [0 : 60 : 359]) [ nut_r * sin(a), nut_r * cos(a) ] ] );
    translate([(bracing_x-hole_r-2.6)/2,0,(bracing_y-1.2)/2])
      rotate([-90,0,0]) cylinder( bracing_z, r=hole_r );
    translate([(-bracing_x+hole_r+2.6)/2,0,(bracing_y-1.2)/2])
      rotate([-90,0,0]) cylinder( bracing_z, r=hole_r );
    translate([(bracing_x-hole_r-2.6)/2,0,(-bracing_y+1.2)/2+h1o+h2])
      rotate([-90,0,0]) cylinder( bracing_z, r=hole_r );
    translate([(-bracing_x+hole_r+2.6)/2,0,(-bracing_y+1.2)/2+h1o+h2])
      rotate([-90,0,0]) cylinder( bracing_z, r=hole_r );
  }
}

difference() {
  union() {
    rotate([90,0,0]) servo_axis();
    translate([20,0,0]) rotate([90,0,0]) servo_axis();
  }
  translate([-10,-18,-10]) cube([45,20,10]);
}