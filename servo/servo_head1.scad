// modules for misc servo related files

module servo_gear( len, da )
{
  r1 = da[0];
  r2 = da[1];
  n  = da[2];

  ang1 = 180 / n; // 360 / (2*n)
  po1 = [
    for( a = [0 : 2*n-1])
      [ ((a%2)?r1:r2)*cos(a*ang1), ((a%2)?r1:r2)*sin(a*ang1) ],
  ];

  linear_extrude( len )
   polygon( points=po1, convexity=50 );
}



module servo_head( len, da, r3 = 4.0 )
{
  difference(){
    cylinder( len, r3, r3, $fn=50 );
    servo_gear( len, da );
  };
}

// test
servo_head( 5.0, B25T_data, 5.0 );
