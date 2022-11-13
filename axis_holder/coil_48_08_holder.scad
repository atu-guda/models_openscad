$fn = 25;

d_1 = 8.0; // axis diameter

r_1 = d_1 / 2 + 0.3;

l_0 = 30.0;
l_a =  5.0;
l_b = 10.0;
l_tot = l_0 + l_a;
z_all = l_a + l_b;

x_1 = 41.5;
y_1 = 27.0;
d_l = ( 75.0 - 62.3 ) / 2;
x_0 = x_1 * ( l_tot ) / l_0;
y_0 = y_1 * ( l_tot ) / ( l_0 - d_l );
echo( x_0, " ", y_0 );


difference() {
  linear_extrude( height=l_tot,  scale=0.0 )
    translate([-x_0/2,-y_0/2]) square( [x_0,y_0]);
  cylinder( r=r_1, h=l_tot );
  translate([-30,-30,l_b]) cube([60,60,60]);
}
