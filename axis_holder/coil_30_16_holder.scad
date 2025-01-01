$fn = 25;

x_1 = 30.0; // at connection line = inner coil size
y_1 = 16.5 + 0.5;
d_1 = 8.0; // axis diameter

r_1 = d_1 / 2 + 0.4;

l_0 = 50.0; // length from baseline to top perspective
l_a = 10.0; // under baseline
l_b = 10.0; // above baseline
l_tot = l_0 + l_a;
z_all = l_a + l_b;

k_xy = ( l_tot ) / l_0;
x_0 = x_1 * k_xy;
y_0 = y_1 * k_xy;
echo( x_0, " ", y_0 );


difference() {
  linear_extrude( height=l_tot,  scale=0.0 )
    translate([-x_0/2,-y_0/2]) square( [x_0,y_0]);
  cylinder( r=r_1, h=l_tot );
  translate([-x_0/2,-y_0/2,z_all]) cube([x_0,y_0,l_0]);
  translate([ 10,0,0]) cylinder( r=2.2, h=5 ); //  for forcer bolt
  translate([-10,0,0]) cylinder( r=2.2, h=5 ); //  for forcer bolt
}
