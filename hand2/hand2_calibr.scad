$fn = 72;


include <hand2_params_a.scad>


difference(){
  cylinder( r = r_bear_o+3, h = 3 );
  cylinder( r = r_bear_o,   h = 3 );
}

translate([65,0,0])
difference(){
  cylinder( r = r_bear_i, h = 3 );
  cylinder( r = r_bear_i-3,   h = 3 );
}

echo( "l_mou= ", l_mou, " l_mou_ext= ", l_mou_ext, "r_out_b= ", r_out_b );
echo( "h_all= ", h_all, " r_bear_o= ", r_bear_o ); 
