$fn = 30;
l_axis =  30;
d_axis = 9.4;
r_axis = d_axis / 2;
r_nut  = 5.5;
y_wall = 1.5;
z_wall = 2.0;

x_a = 30.0;
y_a = l_axis + d_axis + 2 * y_wall;
z_a = d_axis + 2 * z_wall;
x_c = x_a / 2;
y_1 = r_axis + y_wall;
y_2 = y_1 + l_axis;
y_1n = y_1 + r_axis + y_wall + r_nut;
y_2n = y_2 - r_axis - y_wall - r_nut;

dy_mo = 8;
r_mo = 3.2 / 2 + 0.2;

rot_y = [0,90,0];

module coord_y_nut_holder() {
  difference() {
    cube( [x_a, y_a, z_a] );
    
    // axis
    translate([0,y_1,z_wall+r_axis]) rotate(rot_y) cylinder( r=r_axis, h=x_a );
    translate([0,y_2,z_wall+r_axis]) rotate(rot_y) cylinder( r=r_axis, h=x_a );
    
    // central nut hole
    translate([x_c,y_1n,0]) cylinder( r=r_nut, h=z_a );
    translate([x_c,y_2n,0]) cylinder( r=r_nut, h=z_a );
    translate([x_c-r_nut,y_1n,0])    cube( [2*r_nut,y_2n-y_1n,z_a] );
    
    // mounting nut holes
    translate([x_c-dy_mo-r_mo,y_1n,0])    cube( [2*r_mo,y_2n-y_1n,z_a] );
    translate([x_c+dy_mo-r_mo,y_1n,0])    cube( [2*r_mo,y_2n-y_1n,z_a] );
    translate([x_c-dy_mo,y_1n,0]) cylinder( r=r_mo, h=z_a );
    translate([x_c-dy_mo,y_2n,0]) cylinder( r=r_mo, h=z_a );
    translate([x_c+dy_mo,y_1n,0]) cylinder( r=r_mo, h=z_a );
    translate([x_c+dy_mo,y_2n,0]) cylinder( r=r_mo, h=z_a );
  }

}

coord_y_nut_holder();

echo( y_a, z_a, (y_2n-y_1n) );

