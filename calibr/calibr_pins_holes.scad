$fn = 32;
ov = 0.05;

difference() {
  union() {
    cube([65,45,1]);
    xp = 5;
    for( i = [0:9] ) {
      dia = 2.0 + i * 1.0;
      xp = 5 + (i%5) * 13;
      yp = 5 + 10 * floor( i / 5 );
      echo( dia );
      translate([xp,yp,1]) cylinder( d = dia, h=2 );
    }
  }
  xh = 5;
    for( i = [0:9] ) {
      dia = 2.0 + i * 1.0;
      xh = 5 + (i%5) * 13;
      yh = 25 + 10 * floor( i / 5 );
      echo( dia );
      translate([xh,yh,-ov]) cylinder( d = dia, h=3 );
    }
}

