$fn = 32;
h0  = 2.0; // base plate
h1  = 8.0; // mounting places - like lego
hm  = h0+0.1; // for better holes
hm1 = h1+0.1;
w = 1.5;

r_e  = 19.5; // encoder case radius
rr_1 = 15.0; // first mounting ring (30)
rr_2 = 14.0; // second mounting ring (28)
r_c = 11.4; // central encoder hole

rm1 = 2.2; // external mounting holes
rm2 = 1.7; // encoder mouting holes

x0 = 20.0;
x1 = x0 + 0;
y0 = 20.0;
y1 = y0 + h1/2;
lx = 2 * x1;
ly = 2 * y1;
zm = h1/2 + 1.0;

// translate([]) cube([]);

difference() {
  union() {
    translate([-x1,-y1,0]) cube([lx,ly,h0]); // main
    translate([ -x1, -y1,0]) cube([lx,w,h1]); // box
    translate([ -x1,y1-w,0]) cube([lx,w,h1]);
    translate([ -x1, -y1,0]) cube([w,ly,h1]);
    translate([x1-w, -y1,0]) cube([w,ly,h1]);
    translate([   -x1,   -y1, 0]) cube([h1,h1,h1]); // mounting cubes
    translate([ x1-h1,   -y1, 0]) cube([h1,h1,h1]);
    translate([   -x1, y1-h1, 0]) cube([h1,h1,h1]);
    translate([ x1-h1, y1-h1, 0]) cube([h1,h1,h1]);
    // reinfocement
    translate([-x1,-y1+w-0.2  ,h0-w/2-0.2]) rotate([45,0,0]) cube([lx,w,w]);
    translate([-x1, y1-w+0.2  ,h0-w/2-0.2]) rotate([45,0,0]) cube([lx,w,w]);
    translate([-x1+w/2-0.5,-y1,h0-w/2+0.8]) rotate([0,45,0]) cube([w,ly,w]);
    translate([ x1-1.5*w,-y1  ,h0-w/2+0.8]) rotate([0,45,0]) cube([w,ly,w]);
  }
  
  translate([0,0,-0.05]) cylinder( r = r_c, h=hm );
  // encoder mouting holes
  for( phi=[0:60:360] ) {
    translate([rr_1*cos( phi ),rr_1*sin( phi ),-0.05]) cylinder( r = rm2, h=hm );
  }
  for( phi=[30:60:360] ) {
    translate([rr_2*cos( phi ),rr_2*sin( phi ),-0.05]) cylinder( r = rm2, h=hm );
  }
  
  // main mounting holes
  translate([x1-h1-0.05,  y0,zm]) rotate([0,90,0]) cylinder( r=rm1, h=hm1 );
  translate([x1-h1-0.05, -y0,zm]) rotate([0,90,0]) cylinder( r=rm1, h=hm1 );
  translate([-x1-0.05,    y0,zm]) rotate([0,90,0]) cylinder( r=rm1, h=hm1 );
  translate([-x1-0.05,   -y0,zm]) rotate([0,90,0]) cylinder( r=rm1, h=hm1 );

}
// translate([0,0,-35]) cylinder( r=r_e, h=35 );

