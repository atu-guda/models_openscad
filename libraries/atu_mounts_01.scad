// misc mounting objects

module atu_mount_ear( h, r_i, r_o, alp = 60, k_ext = 1.0 )
{
  al = min( max( alp, 10 ), 120 ); // limit angle - not bullet proof
  r_e = k_ext * r_o;
  p0 = [ r_o * cos( al ), r_o * sin( al ) ];
  p1 = [ p0.x, -p0.y ];
  p2 = [ -r_e, p1.y - r_e * tan( 90 - al ) ];
  p3 = [ p2.x, -p2.y ];
  //for( p = [ p0, p1, p2, p3 ] ) {
  //  color("red") translate([r_o,0,h]) translate( p ) cylinder( r=0.1, h=1 );
  //}
 
  linear_extrude( height = h ) // translate([r_o,0,0])
    difference() {
      union() {
       circle( r = r_o );
       polygon( [ p0, p1, p2, p3 ] );
    } 
    circle( r = r_i );
  }
}  
 
atu_mount_ear( 8.0, 4.2, 8.0, 65, 1.5 );