use <atu_rounds.scad>

$fn = 72;
ov = 0.05;

h_base = 1.0;
h_all  = 3.0;
l_wall = 1.0;


difference() {
  union() {
    cube_round_xy( 60, 80, h_base, 3 );
    for( d1=[1:1:8]) {
      yp = -6.0 + 10*d1;
      for( df=[0.0:0.2:0.8] ) {
        do = d1 + df + 1;
        di = do - 2 * l_wall;
        xp = 5.0 + 60*df;
        translate([xp,yp,0]) cylinder( d = do, h=h_all );
      }
    }
  }

  for( d1=[1:1:8]) {
    yp = -6.0 + 10*d1;
    for( df=[0.0:0.2:0.8] ) {
      do = d1 + df;
      di = do - 2 * l_wall;
      xp = 5.0 + 60*df;
      translate([xp,yp,-ov]) cylinder( d = di, h=h_all+2*ov );
    }
  }
}

