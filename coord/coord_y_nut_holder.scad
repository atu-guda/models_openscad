$fn = 30;
l_axis =  30;
d_axis = 9.2;
r_axis = d_axis / 2;
r_nut  = 5.5;
y_wall = 2.0;
z_wall = 2.5;

over = 0.05;
x_a = 40.0;
y_a = l_axis + d_axis + 2 * y_wall;
z_a = d_axis + 2 * z_wall;
z_ao = z_a + 2 * over;

x_c = x_a / 2;
y_1 = r_axis + y_wall;
y_2 = y_1 + l_axis;
y_1n = y_1 + r_axis + y_wall + r_nut;
y_2n = y_2 - r_axis - y_wall - r_nut;

dy_mo = 9;
r_mo = 3.2 / 2 + 0.2;

rot_y = [0,90,0];

module coord_y_nut_holder() {
  difference() {
    cube( [x_a, y_a, z_a] );
    
    // axis
    translate([-over,y_1,z_wall+r_axis]) rotate(rot_y) cylinder( r=r_axis, h=x_a+2*over );
    translate([-over,y_2,z_wall+r_axis]) rotate(rot_y) cylinder( r=r_axis, h=x_a+2*over );
    
    // central nut hole
    translate([x_c,y_1n,-over]) cylinder( r=r_nut, h=z_ao );
    translate([x_c,y_2n,-over]) cylinder( r=r_nut, h=z_ao );
    translate([x_c-r_nut,y_1n,-over])    cube( [2*r_nut,y_2n-y_1n,z_ao] );
    
    // mounting nut holes
    translate([x_c-dy_mo-r_mo,y_1n,-over])    cube( [2*r_mo,y_2n-y_1n,z_ao] );
    translate([x_c+dy_mo-r_mo,y_1n,-over])    cube( [2*r_mo,y_2n-y_1n,z_ao] );
    translate([x_c-dy_mo,y_1n,-over]) cylinder( r=r_mo, h=z_ao );
    translate([x_c-dy_mo,y_2n,-over]) cylinder( r=r_mo, h=z_ao );
    translate([x_c+dy_mo,y_1n,-over]) cylinder( r=r_mo, h=z_ao );
    translate([x_c+dy_mo,y_2n,-over]) cylinder( r=r_mo, h=z_ao );
  }

}

coord_y_nut_holder();

echo( y_a, z_a, (y_2n-y_1n) );

