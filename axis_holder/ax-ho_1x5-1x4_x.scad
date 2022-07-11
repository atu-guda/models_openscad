r1 = 2.5;
r2 = 2.0 + 0.3;

x1 = 10;
y1 = 10;
za1 = 4.0;
za2 = za1 + 10;
z1 =  za2 + 4.0;

$fn=20;

// include <atu_supports.scad>
//include <atu_nut_axis.scad>


module ax_ho_21x()
{
  difference() {
    cube( [x1,y1,z1] );
    translate([ 0,y1/2,za2]) rotate([0,90,0]) cylinder( r=r1, h=x1 );
    translate([ x1/2,y1,za1])  rotate([90,0,0]) cylinder( r=r2, h=y1 );
  }
}

// ax_ho_21x();
translate([0,0,x1])
rotate([0,90,0]) ax_ho_21x();
