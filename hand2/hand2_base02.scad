$fn = 72;
ov      = 0.05;
h_all   = 7.0;
h_a     = h_all + 2 * ov;

r_out   = 43.0;
r_balls = 35.0;
r_axis  =  4.0; // 4.0 + extra
d_ball  =  6.0;
r_mou   =  2.1;
l_mou   = 42.0;
r_mou2  =  1.7;
h_mou2  =  h_a; 
z_deep =  0.5;

module shift_quad( l = 10, sh_z = 0 )
{
  translate([ l, 0, sh_z]) children();
  translate([-l, 0, sh_z]) children();
  translate([ 0,-l, sh_z]) children();
  translate([ 0, l, sh_z]) children();
}

module bolt_cone( r_1, r_2, h_all, h_top )
{
  union() {
    cylinder(  r = r_1, h = h_all );
    translate([0,0,h_all-h_top]) cylinder( r1 = r_1, r2= r_2, h = h_top );
  }
}

module bolt_cone_in()
{
  bolt_cone( r_1=r_mou2, r_2=r_mou2+1.5, h_all=h_a, h_top=2 );
}

module axis_part( r_1, h_1, l_1 )
{
  difference() {
    cylinder( r = r_1, h = h_1 );
    translate([l_1,-2*r_1,-0.2*h_1]) cube([2*r_1,4*r_1,1.5*h_1]);
  }
}

module hand2_base02()
{
  difference(){
    cylinder( r = r_out, h = h_all );
    
    translate([0,0,-ov]) cylinder( r = r_axis, h= h_a );
    translate([-10.0,-1.0,-ov]) cube([20.0,2.0,4.1]);
    translate([0,0,h_all+z_deep]) rotate_extrude(angle=360)
      translate([r_balls, 0, 0]) circle( r = d_ball/2 );
      
    translate([-14.0,     0,0]) bolt_cone_in();
    translate([-14.0,  10.0,0]) bolt_cone_in();
    translate([-14.0, -10.0,0]) bolt_cone_in();
    translate([ 21.0,   7.0,0]) bolt_cone_in();
    translate([ 21.0,  -7.0,0]) bolt_cone_in();
    translate([ 10.5,  17.0,0]) bolt_cone_in();
    translate([ 10.5, -17.0,0]) bolt_cone_in();
    
    //shift_quad( l=15, sh_z = -ov ) bolt_cone_in();
      
    
    
  }
}

hand2_base02();


 