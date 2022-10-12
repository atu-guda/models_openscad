// holder for roller

r_in = 4.0 / 2;
r_1 = 12.0 / 2;

x_1 = 9.0;
x_c = x_1 / 2;
x_r = 4.0;
x_d = ( x_1 - x_r ) / 2;
y_1 = 8.0;
y_c = y_1 / 2;
z_1 = 5.0;
z_2 = r_1 + 4.0;
z_a = z_1 + z_2;

$fn=30;

module roller_holder1() {
  difference() {
    cube( [x_1,y_1,z_a] );
    translate([x_d,0,z_1]) cube( [x_r,y_1,z_2] );
    translate([0,y_c,z_1+r_1+0.3]) rotate([0,90,0]) cylinder( r=r_in, h=x_1 );
    translate([x_c,y_c,0]) cylinder( r=r_in, h=x_1 );
 }
}

// roller_holder1();
rotate([90,0,0]) roller_holder1();




