
L = 100;
w = 1;
h1 = 1;
h1p = h1+0.02;
Lm = L - 2 * w;

L1 = L / 2;

$fn=50;

union() {

  // outer border
  translate([0,0,0])    cube([w,L,h1]);
  translate([ L-w,0,0]) cube([w,L,h1]);
  translate([0,0,0])    cube([L,w,h1]);
  translate([0, L-w,0]) cube([L,w,h1]);
  
  // 3x4x5
  translate([0,30,0]) cube([40+w,w,h1]);
  translate([40,0,0]) cube([w,30,h1]);

  // central cross
  translate([L1-w/2,0,0]) cube([w,L,h1]);
  translate([0,L1-w/2,0]) cube([L,w,h1]);

  rotate([0,0,45])  translate([w,-w/2,0]) cube([L*1.41-w,w,h1]);
  translate([L,w,0]) rotate([0,0,135]) cube([L*1.41-w,w,h1]);

  difference() {
    translate([L1,L1,0]) cylinder(h=h1,d=L);
    translate([L1,L1,-0.01]) cylinder(h=h1p,d=L-2*w);
  }
  difference() {
    translate([L1,L1,0]) cylinder(h=h1,d=L1);
    translate([L1,L1,-0.01]) cylinder(h=h1p,d=L1-2*w);
  }


}
