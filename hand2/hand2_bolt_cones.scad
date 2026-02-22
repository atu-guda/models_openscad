
module bolt_cone_out()
{
  atu_bolt_cone( r_1=r_mou, r_2=r_mou+1.5, h_all=h_ax, h_top=3 );
}

module bolt_cone_in()
{
  atu_bolt_cone( r_1=r_mou2, r_2=r_mou2+1.5, h_all=h_ax, h_top=2 );
}

module bolt_cone_top()
{
  atu_bolt_cone( r_1=r_mou2, r_2=r_mou2+1.1, h_all=h_t_a, h_top=2 );
}

