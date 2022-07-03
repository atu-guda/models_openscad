// holder for 12 bearing with 3x3 plate
$fn = 20;
d_o = 12.0 + 0.6;
d_o1 = 12.0+0.4;
r_ho = 2.0;

z_b = 9;
z_1 = 1.0 + 0.6;
z_a = z_b + z_1;

x_1 = 27;

y_1 = 27;

step_xy = 10;

module m_hole( i, j )
{
  translate([ i*step_xy, j*step_xy,z_1])  cylinder(h=2*z_a, r = r_ho, center = true );
}

module bearing_box()
{
  difference() {
    cube([x_1,y_1,z_a], true );
    translate([0,0,z_1])
      cylinder(h=z_b, r = d_o/2.0, center = true );
    translate([0,0,z_1])
      cylinder(h=2*z_a, r = d_o1/2.0, center = true );

    for( i=[-1:1:1]) {
      for( j=[-1:1:1]) {
        m_hole( i, j );
      }
    };
  }
}

bearing_box();



