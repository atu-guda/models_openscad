
// support width
supp_w = 0.5;

// one support pease
module supp_31( w, h, alp )
{
  rotate([90,0,alp]) linear_extrude( supp_w )
    polygon([ [-0.05*w,0], [w,0], [-0.05*w,h] ]);
}

// four support peases
module supp_34( w, h, r0 )
{
  translate([ r0,  0, 0]) supp_31(w,h,  0);
  translate([-r0,  0, 0]) supp_31(w,h,180);
  translate([  0, r0, 0]) supp_31(w,h, 90);
  translate([  0,-r0, 0]) supp_31(w,h,-90);
}

// support with disk
module supp_34d( w, h, r0, k_r1 = 1.2 )
{
  union() {
    cylinder( h=supp_w, r=r0+w*k_r1 ); // adgession
    supp_34( w, h, r0 );
  }
}


module supp_xywra( x, y, w, L = 0, alp = 0 )
{
  r2 = 2 * L*L - 2*L + 1;
  // echo( "r2= ", r2 );
  rotate([0,0,alp]) translate([0,w/2,0]) rotate([90,0,0])
   scale( [x, y, w] )
    difference() {
      linear_extrude( 1 ) polygon([ [0,0], [0,1], [1,0] ]);
      translate( [L,L,0] ) cylinder( r = sqrt(r2), h = 1.0, $fn=50 );
    }
}

//supp_xywra( 1, 1, 0.2, 1.5, 180 );

