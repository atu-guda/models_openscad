// wire feeder back part for trans wingding machine
$fn = 32;

x_m  = 50.0;
y_m  = 30.0;
x_c  = x_m / 2;
y_1a =  9.0;
y_1b =  3.0;

z_1  =  3.0;
r_1x = 30.0;
r_1y =  5.0;

r_mh = 4.2 / 2 + 0.3; // mounting hole


difference() {
  union() {
    cube( [x_m,y_1a,z_1] );
    translate([x_c-4,1.0,0.0] )cube( [8.0,y_m-1,4] );
    translate([x_c-2,1.0,0.0] )cube( [4.0,y_m-1,8] );
    translate([0,-y_1b,0.0] )cube( [x_m,y_1b,z_1/2] );
    translate([x_c,0,7.0] ) rotate([-90,0,0])
      resize([30,14,30]) cylinder( r1=r_1x, r2=6.0, h=y_m );
  }
 
  translate( [    5.0,5.0,0.0]) cylinder( r=r_mh, h=z_1 );
  translate( [x_m-5.0,5.0,0.0]) cylinder( r=r_mh, h=z_1 );
   translate([x_c,0,7.0] ) rotate([-90,0,0])
      resize([26,10,30]) cylinder( r1=r_1x, r2=6.0, h=y_m );
  
}
