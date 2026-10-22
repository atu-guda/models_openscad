// use <atu_rounds.scad>

$fn=32;
ov    = 0.05;
ov2   = 2*ov;
w     = 2.0;

x_1   = 30.0;
y_1   = 30.0;
z_1   = 20.00;
d_1   = 12.0;

d_h   = 3.20;

difference() {
  union() {
    //translate([0,-y_1/2,0]) cube_round_xy( x_1, y_1, w, rr = 1.2 );
    translate([0,-y_1/2,0]) cube( [x_1, y_1, w] );
    translate([0,-y_1/2,0]) cube( [w,  y_1, z_1] );
  }
  translate([-ov,0,z_1/2+2]) rotate([0,90,0]) cylinder( d=d_1, h=2*w+2*ov );
  translate([5+w, 10,-ov]) cylinder( d=d_h, h=2*w+2*ov );
  translate([5+w,-10,-ov]) cylinder( d=d_h, h=2*w+2*ov );
  translate([5+w+10*sqrt(3),  0,-ov]) cylinder( d=d_h, h=2*w+2*ov );
  
}


  
  


