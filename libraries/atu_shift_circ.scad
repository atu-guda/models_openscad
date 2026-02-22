
module shift_circ_n( l = 10, n = 4, sh_z = 0, alp_0 = 0 )
{
  d_alp = 360.0 / n;
  for( i= [0:(n-1)] ) {
    alp = alp_0 + d_alp * i;
    translate([ l*cos(alp), l*sin(alp), sh_z])
     rotate([0,0,alp]) children();
  }
}

module shift_quad( l = 10, sh_z = 0, alp_0 = 0 )
{
  shift_circ_n( l, 4, sh_z, alp_0 ) children();  
}

module shift_octo( l = 10, sh_z = 0, alp_0 = 0 )
{
  shift_circ_n( l, 8, sh_z, alp_0 ) children();
}

