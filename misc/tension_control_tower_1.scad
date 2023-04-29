$fn = 25;

r_h = 4.0 / 2 + 0.2;

x_1 = 8.0;
y_1 = 10.0;
z_1 = 3.0;

x_2  =  5.0;
y_2  = y_1;
z_2  = 26.0;
z_2h = 20.0;


rotate([0,90,0])
difference() {
  union() {
    cube([x_1,y_1,z_1]);
    translate([x_1,0,0]) cube([x_2,y_2,z_2]);
    translate([0,-20.0,0]) cube([x_1+x_2,21.0,2*z_1]);
    translate([0,-20.0,z_1]) cube([x_1+x_2,4.0,10.0]);
    
  };
  translate([x_1/2,y_1/2,0]) cylinder( r=r_h, h=z_1 );
  translate([x_1,y_1/2,z_2h-r_h]) rotate([0,90,0]) cylinder( r=r_h, h=x_2 );
  translate([0,-20.0,0]) cube([x_1,10.0,z_1]);
  #translate([x_1/2,-15.0,10.0]) rotate([90,0,0]) cylinder( r=0.8, h=5.0 );
}
