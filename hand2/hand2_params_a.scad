ov      = 0.05;

d_bear_i = 50;
d_bear_o = 65;
r_bear_i  = ( d_bear_i - 0.0 ) / 2;
r_bear_o  = ( d_bear_o + 0.8 ) / 2 ;
h_bear    =  7.0;

h_force = 3.0;
l_force = 3.0;
h_all   = h_bear + h_force;
h_ax    = h_all  + 2 * ov;

r_out_b   = 47.0;
r_out_t   = 45.0;

h_main_t = 5.0;
h_fix_t  = 10.0;
h_gap_t = -0.5;
z_t_1 = h_main_t;
z_t_2 = z_t_1 + h_force;
z_t_3 = z_t_2 + h_bear + h_gap_t;
h_t_a = z_t_3 + 2 * ov;

d_axis0 =  8.0; // 4.0 + extra
d_axis  =  d_axis0 + 0.4;
r_axis  =  d_axis / 2;
mgear_h_tot   = 25.0;
agear_axis_d  =  3.6;

r_mou   =  2.1;
l_mou   = 40.0;
r_mou2  =  1.9;
h_mou2  =  h_ax;

r_puck_ext = 8.0;
r_mou_ext = 8.6 / 2;
l_mou_ext = r_out_b + r_puck_ext; // + 2; // to get round 55

part1_z0 = 35;

