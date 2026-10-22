use <atu_rounds.scad>

$fn=32;
ov = 0.05;

x_all = 26;
y_all = 10;
z_base = 1.0;
z_cyl = 6.0;
r_cyl = 2.0;

x_c = x_all /2;
y_c = y_all /2;

difference() {
  cube_round_xy( x_all, y_all, z_base, rr = 1.0 );
  translate([x_c  ,y_c,-ov]) cylinder( r=0.5, h=z_base+2*ov );
  translate([x_c+5,y_c,-ov]) cylinder( r=0.5, h=z_base+2*ov );
  translate([x_c-5,y_c,-ov]) cylinder( r=0.5, h=z_base+2*ov );
  
}

translate([r_cyl+2      ,y_c,0]) cylinder( r=r_cyl, h=z_cyl );
translate([x_all-r_cyl-2,y_c,0]) cylinder( r=r_cyl, h=z_cyl );