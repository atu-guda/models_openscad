nut_m4_r = 4.0;
nut_m4_h = 3.2;
nut_m4_s = 7.0;
nut_m4_e = 7.66;


module nut6_place( r, h )
{
  linear_extrude( h )
    polygon( [ for (a = [0 : 60 : 359]) [ r * sin(a), r * cos(a) ] ] );
}

// module nut_m4_place()
// {
//   nut6_place( (8.0+0.8)/2, 3.2 );
// }

module chamfered2_axle( r, l, th )
{
  th2 = th/2.0;
  difference() {
    cylinder( r=r, h=l );
    translate([th2,-r,0]) cube([r,2*r,l]);
    translate([-th2-r,-r,0]) cube([r,2*r,l]);
  }
}

