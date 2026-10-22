$fn=52;
ov     = 0.05;
s      = 2.54; // strud
h_tot  = 5.0;
dh_top = 1.5;
d_hand = 0.6;


module res_bend( nl, n_h = 3 ) {
  x_0 = nl * s;
  y_0 = ( n_h + 1 ) * s;
  difference() {
    cube([x_0,y_0,h_tot]);
    translate([dh_top,-ov,h_tot-dh_top+ov]) cube([x_0-2*dh_top,y_0+2*ov, dh_top] );
    translate([dh_top,-ov,h_tot-0.9*dh_top+ov])
      rotate([0,-45,0]) cube([2*dh_top,y_0+2*ov, 2*dh_top] );
    translate([x_0-dh_top,-ov,h_tot-0.9*dh_top+ov])
      rotate([0,-45,0]) cube([2*dh_top,y_0+2*ov, 2*dh_top] );
    for( i=[1:n_h] ) {
      translate([0  ,i*s,-ov]) cylinder( d=d_hand, h=h_tot+2*ov );
      translate([x_0,i*s,-ov]) cylinder( d=d_hand, h=h_tot+2*ov );
      translate([x_0/2,i*s,-ov]) cylinder( d=3*d_hand, h=h_tot+2*ov );
    }

  }

}

union() {
  res_bend( 3, 3 );
  translate([-s/2,4*s,0] ) res_bend( 4, 3 );
  translate([-s,8*s,0] )   res_bend( 5, 3 );
}
