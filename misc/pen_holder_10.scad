use <atu_rounds.scad>

$fn=52;
ov    = 0.05;
ov2   = 2*ov;
d_pen = 10.20;
w     = 1.50;
z_1   = 18.0;
z_2   = 2.00;
l_1   = 6.00;
l_2   = 25.0;
y_2   = 10.0;
d_h   = 3.25;

difference() {
  union() {
    cylinder( d=d_pen+2*w, h=z_1 );
    translate([-l_1-d_pen/2,-1.5*w,0]) cube( [l_1,3*w,z_1] );
    translate([d_pen/2-7.5,-y_2/2,0]) cube_round_xy( l_2, y_2, z_2, rr = 1.2 );
  }
  translate([0,0,-ov]) cylinder( d=d_pen, h=z_1+ov2 );
  translate([-l_1-d_pen/2-w+2.0,-0.5*w,-ov]) cube( [l_1+5,1*w,z_1+ov2] );
  translate([d_pen/2+w+13,0,-ov]) cylinder( d=d_h, h= z_2+ov2 );
  translate([d_pen/2+w+ 3,0,-ov]) cylinder( d=d_h, h= z_2+ov2 );
  translate([-l_1-d_pen/2+w +1.4,2*w,z_1/2]) rotate([90,0,0])cylinder( d=d_h, h= 4*w );
}


  
  


