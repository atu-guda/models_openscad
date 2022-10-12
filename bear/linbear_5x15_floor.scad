// holder for linear bearing D_in=5mm, L=15mm. Floor mounting
d_in  =  5.0; // inner diameter (pure)
d_out = 10.0; // outer diameter
L_all = 15.1; //

r1   = d_out / 2 + 0.4;
r_e  = r1 + 1.4;
r_in = d_in  / 2 + 1.0;
r_h  = 4.0 / 2 + 0.3;

// include <atu_supports.scad>
// include <atu_nut_axis.scad>

xh = 10.0; // to mounting holes

zw = 2.0;
zb = 2.0;
ze = 2.0;
za = L_all + zw + ze;

$fn=25;


module lbe_ho_5x15_floor()
{
  difference() {
    union() {
      cylinder( r=r_e, h=za );
      #translate( [0,0,za]) cylinder( r=r_in+1.0, h=ze );
      hull() {
        cylinder( r=r_e, h=zb );
        translate( [ xh,0,0] ) cylinder( r=r_h+2.0, h=zb );
        translate( [-xh,0,0] ) cylinder( r=r_h+2.0, h=zb );
      }
    }
    cylinder( r=r1, h=L_all );
    cylinder( r=r_in, h=za+zw );
    translate( [ xh,0,0] ) cylinder( r=r_h, h=zb );
    translate( [-xh,0,0] ) cylinder( r=r_h, h=zb );
  }
  
}

lbe_ho_5x15_floor();
// rotate([180,0,0]) lbe_ho_5x15_floor();

