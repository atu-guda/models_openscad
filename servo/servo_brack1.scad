// bracket for servo - v0.1
pth = 2.0; // plate thikness
he = 47.0;
wz = 20.0;
wx = 22.0;
rh = 2.0;
xb = 13;

difference() {
  union() {
    // low panes
    translate([-3,0,0])          cube( [xb+pth, he+2*pth, pth ] );
    translate([10+wx+pth,0,0])  cube( [xb+pth, he+2*pth, pth ] );
    // high panes

    // Y-oriented panes
    // translate([0,0,0])           cube([pth,he+2*pth,wz]);
    translate([10,0,0])          cube([pth,he+2*pth,wz]);
    translate([10+wx+pth,0,0])   cube([pth,he+2*pth,wz]);
    //translate([20+wx+pth,0,0])   cube([pth,he+2*pth,wz]);

    // x-orienred panes
    translate([-3,0,0])             cube([2*xb+wx+2*pth,pth,wz]);
    translate([-3,25,0])            cube([xb+pth,pth,wz]);
    translate([-3,he+pth,0])        cube([xb+pth,pth,wz]);
    translate([10+wx+pth,25,0])     cube([xb+pth,pth,wz]);
    translate([10+wx+pth,he+pth,0]) cube([xb+pth,pth,wz]);
  }{
    // holes
    translate([ 3,     pth,wz/2]) rotate([90,0,0]) cylinder(r=rh,h=2*pth);
    translate([43,     pth,wz/2]) rotate([90,0,0]) cylinder(r=rh,h=2*pth);
    translate([ 3,  pth+25,wz/2]) rotate([90,0,0]) cylinder(r=rh,h=2*pth);
    translate([43,  pth+25,wz/2]) rotate([90,0,0]) cylinder(r=rh,h=2*pth);
    translate([ 3,2*pth+he,wz/2]) rotate([90,0,0]) cylinder(r=rh,h=2*pth);
    translate([43,2*pth+he,wz/2]) rotate([90,0,0]) cylinder(r=rh,h=2*pth);
  }
}

// translate([5,0,wz/2])   rotate([90,0,0]) cylinder(r=rh,h=pth);


