
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
module supp_34d( w, h, r0 )
{
  union() {
    cylinder( h=supp_w, r=1.6*r0 ); // agdession
    supp_34( w, h, r0 );
  }
}

