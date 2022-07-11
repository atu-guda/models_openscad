// half-holder for bearing from HDD
$fn = 20;
d_o = 12 + 0.6;
// d_o1 = 7;
r_ho = 2.2;

// z_b = 4;
// z_1 = 1;
z_a = 10;

x_1 = 30;
y_1 = 10;

module bearing_hbox()
{
  //translate([0,0,z_1]) cylinder(h=2*z_b, r = d_o/2.0, center = true );
  rotate([90,0,0])
  difference() {
    cube([x_1,y_1,z_a] );
    translate([x_1/2,y_1*1.1,z_a])
      rotate([90,0,0])
        cylinder(h=y_1*2, r = d_o/2.0 );

    translate([ 5,y_1/2,0])  cylinder(h=2*z_a, r = r_ho );
    translate([25,y_1/2,0])  cylinder(h=2*z_a, r = r_ho );
  }
}

bearing_hbox();

translate([0,y_1+6,0]) bearing_hbox();


