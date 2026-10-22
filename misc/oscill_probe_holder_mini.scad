use <atu_rounds.scad>
$fn=36;

n      = 6;
d_main = 8.0;
l_y    = 21;
l_z    = 20;
w_z    = 2.0;
w_y    = 2.2;
l1     = 18.0;
x_in   = 3.0;
x_out  = x_in + 2.0;

r_w    = 3.0;
ov     = 0.05;

l_all  = l1 * (n);
l_z2   = 0.8 * l_z;
l_y2   = 0.6 * l_y;
r_main = d_main / 2;

x1   = x_in / 2;
x2   = x_out / 2;
dy1  = sqrt( r_main*r_main - x1*x1 );
y_c  = d_main/2 + dy1 + 3;
y2   = y_c - dy1 + 0.1;
echo( dy1, y_c, y2 );

difference() {
  union() { 
    cube_round_xy( l_all, l_y, w_z, r_w );
    translate([r_w,l_y-w_y,-l_z]) cube([l_all-2*r_w,w_y,l_z]);
    translate([r_w,l_y-r_w,-l_z2]) cylinder( r=r_w, h=l_z2 );
    translate([l_all-r_w,l_y-r_w,-l_z2]) cylinder( r=r_w, h=l_z2 );
    for( i=[1:n-1] ) {
      x0 = (i-0) * l1;
      translate([x0+w_y/2,l_y-w_y-l_y2,-l_z2]) rotate([0,270,0])linear_extrude( w_y )
        polygon(points=[[l_z2,0], [l_z2,l_y2], [0,l_y2]]);
    }
    translate([w_y,l_y-w_y-l_y2,-l_z2]) rotate([0,270,0])linear_extrude( w_y )
        polygon(points=[[l_z2,0], [l_z2,l_y2], [0,l_y2]]);
    translate([l_all,l_y-w_y-l_y2,-l_z2]) rotate([0,270,0])linear_extrude( w_y )
        polygon(points=[[l_z2,0], [l_z2,l_y2], [0,l_y2]]);
    
  }

  for( i=[1:n] ) {
    x0 = (i-0.5) * l1;
    translate([x0,y_c,-ov]) cylinder( d=d_main, h=w_z+2*ov );
    translate([x0,-ov,-ov]) linear_extrude(w_z+2*ov)
      polygon( points=[ [-x2,0], [-x1,y2], [x1,y2], [x2,0] ]);
    translate([x0-x1-0.2,y2-0.9,-ov]) cube([x_in+0.4,1,w_z+2*ov]);
  }
  translate([      10,l_y+ov,-4]) rotate([90,0,0]) cylinder( r=1.5, h=5 );
  translate([l_all-10,l_y+ov,-4]) rotate([90,0,0]) cylinder( r=1.5, h=5 );
  translate([l_all/2+5,l_y+ov,-16]) rotate([90,0,0]) cylinder( r=1.5, h=5 );
}