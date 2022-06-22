cellsz = 40;
cell_z = 5;
base_r = cellsz / 4;
h_def  = cellsz * 0.8;
h_base = cellsz * 0.2;
r_top = cellsz * 0.125;

for( i = [0:7] ) {
  for( j = [0:7] ) {
    col = ( ((i+j) % 2 ) < 0.1 ) ? [0.9,0.9,0.9] : [0.1,0.1,0.1];
    translate( [i*cellsz, j*cellsz, -cell_z] ) {
      color(col) cube([cellsz,cellsz,cell_z],true);
    }
  }
}

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

module pawn_row( row, color )
{
  for( i = [0:7] ) {
    translate( [i*cellsz, row*cellsz, -cell_z] ) {
      pawn(color);
    }
  }
}

pawn_row( 1, [0.7,0.7,0.7] );
pawn_row( 6, [0.3,0.3,0.3] );

