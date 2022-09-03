// holder for M5 bearing with 3x4 plate
$fn = 20;
d_o = 15.0 + 0.6;
d_o1 = 10.0;
r_ho = 2.1;

z_b = 6;
z_1 = 1.0;
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
    
    m_hole( -1, -1 );
    m_hole( -1,  1 );
    m_hole(  1, -1 );
    m_hole(  1,  1 );
    // m_hole(  0,  1 );
  }
  
}

bearing_box();



