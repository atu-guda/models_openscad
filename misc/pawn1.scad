cellsz = 40;
cell_z = 5;
base_r = cellsz / 4;
h_def  = cellsz * 0.8;
h_base = cellsz * 0.2;
r_top = cellsz * 0.125;


module pawn( color )
{
  color(color) union()
  {
    cylinder( h=h_base, r1=base_r*1.1, r2=base_r*1.1 );
    translate([0,0,h_base]) {
      cylinder( h=h_def, r1=base_r, r2=base_r/8, $fn=32 );
    }
    translate([0,0,h_base+h_def]) {
      sphere( r=r_top, $fn=32 );
    }
  }
}

//translate( [i*cellsz, row*cellsz, -cell_z] ) {
translate([0,0,h_def*1.4]) mirror([0,0,1])
  pawn("red");
//}



