// bracket for servo - v0.2
pth = 2.0; // plate thikness
he = 46.0;
wz = 20.0;
xw = 20.5; /* 20.5 */ xw2 = xw/2;
rh = 2.0;
xb = 13;

x_all = xw + 2 * xb + 2 * pth;
x_all2 = x_all /2;

t_scale = 1.025;

module servo_brack()
{
  difference() {
    union() {
      // low panes
      translate([-xw2-pth-xb,0,0])  cube( [xb+pth, he+2*pth, pth ] );
      translate([ xw2       ,0,0])  cube( [xb+pth, he+2*pth, pth ] );
      // high panes

      // Y-oriented panes
      translate([-xw2-pth,0,0])   cube([pth,he+2*pth,wz]);
      translate([ xw2    ,0,0])   cube([pth,he+2*pth,wz]);
      translate([-xw2-xb-pth ,0,wz-pth])   cube([pth,he+2*pth,pth]);
      translate([ xw2+xb     ,0,wz-pth])   cube([pth,he+2*pth,pth]);
      //translate([20+xw+pth,0,0])   cube([pth,he+2*pth,wz]);

      // x-orienred panes
      translate([-x_all2,0,0])      cube([x_all,pth,wz]);
      translate([-x_all2,30,0])     cube([xb+pth,pth,wz]);
      translate([-x_all2,he+pth,0]) cube([xb+pth,pth,wz]);
      translate([xw2    ,30,0])     cube([xb+pth,pth,wz]);
      translate([xw2    ,he+pth,0]) cube([xb+pth,pth,wz]);
    }{
      // holes
      translate([-20, -1,wz/2]) rotate([-90,0,0]) cylinder(r=rh,h=1.2*he);
      translate([ 20, -1,wz/2]) rotate([-90,0,0]) cylinder(r=rh,h=1.2*he);
    }
  }
}

//scale(t_scale)
servo_brack();

echo( x_all );



