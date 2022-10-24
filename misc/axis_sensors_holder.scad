// sensors for trans winding machine
$fn=32;

r_1 = 5.0 / 2 + 1.0;
x_1 = 10.0;
x_c = x_1 / 2;
y_1 = 9.0;
y_c = y_1 / 2;
z_1 = 10.0 + 30.0 + 5.0;

r_h = 4.2 / 2 + 0.2;
r_s = 1.2;


module sensor_tower() {
  difference() {
    union() {
      cube( [x_1,y_1,z_1] );
      translate( [-9.0,0,0] ) cube( [28.0,y_1,3.5] );
      // translate( [-5.0,y_1,0] ) cube( [20.0,2.0,z_1] );
    }
    
    
    translate([x_c,y_c,0]) cylinder( r=r_1, h=z_1 );  
    translate([-5.0,y_c,0]) cylinder( r=r_h, h=5.0 );
    translate([15.0,y_c,0]) cylinder( r=r_h, h=5.0 );
    translate([x_c,0,10]) rotate([-90,0,0]) cylinder( r=r_s, h=y_1 );
    translate([x_c,0,15]) rotate([-90,0,0]) cylinder( r=r_s, h=y_1 );
    translate([x_c,0,20]) rotate([-90,0,0]) cylinder( r=r_s, h=y_1 );
    translate([x_c,0,25]) rotate([-90,0,0]) cylinder( r=r_s, h=y_1 );
    translate([x_c,0,30]) rotate([-90,0,0]) cylinder( r=r_s, h=y_1 );
    translate([x_c,0,35]) rotate([-90,0,0]) cylinder( r=r_s, h=y_1 );
    translate([x_c,0,40]) rotate([-90,0,0]) cylinder( r=r_s, h=y_1 );
    
  }
}

//sensor_tower();
rotate([-90,0,0]) sensor_tower();

