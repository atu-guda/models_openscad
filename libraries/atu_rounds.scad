// rounded cube on xy plane, z - flat

module cube_round_xy( x, y, z, rr = 3 )
{
  // $fn = 52;
  ov_x = 0.1;
  xi = x - rr * 2;
  yi = y - rr * 2;

  union() {
    translate([rr-ov_x,rr-ov_x,0]) cube([xi+ ov_x * 2,yi+ ov_x * 2,z]);
    translate([rr,0,0])     cube([xi,rr,z]);
    translate([rr,y-rr,0])  cube([xi,rr,z]);
    translate([0,rr,0])     cube([rr,yi,z]);
    translate([x-rr,rr,0])  cube([rr,yi,z]);

    translate([rr,rr,0])       cylinder(r=rr,h=z);
    translate([rr+xi,   rr,0]) cylinder(r=rr,h=z);
    translate([rr,   rr+yi,0]) cylinder(r=rr,h=z);
    translate([rr+xi,rr+yi,0]) cylinder(r=rr,h=z);
  }
}

// test
cube_round_xy( 40, 20, 3, rr = 3 );

