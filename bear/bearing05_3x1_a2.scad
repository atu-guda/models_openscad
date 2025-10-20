// holder for M5 bearing with 3x3 plate
$fn = 36;
d_o = 16.0 + 0.1;
d_o1 = 11.0;
r_ho = 2.2;

z_b = 7;
z_1 = 2.0;
z_a = z_b + z_1;

x_1 = 27;
y_1 = 27;

step_xy = 10;

module m_hole( i, j )
{
  translate([ i*step_xy, j*step_xy,z_1])  cylinder(h=2*z_a, r = r_ho, center = true );
}

module bearing_box_v()
{
  difference() {
    cube([x_1,y_1,z_a], center=true );
    translate([0,0,z_1])
      cylinder(h=z_b, r = d_o/2.0, center = true );
    translate([0,0,z_1])
      cylinder(h=2*z_a, r = d_o1/2.0, center = true );
    translate([ 0, 1*step_xy,0.0]) 
      rotate([0,90,0])
      cylinder(h=1.1*x_1, r = r_ho, center = true );
    translate([ 0, -1*step_xy,0.0]) 
      rotate([0,90,0])
      cylinder(h=1.1*x_1, r = r_ho, center = true );
    
  }

}

bearing_box_v();



