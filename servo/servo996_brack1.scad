$fn = 32;
h  = 8.0; // like lego
hm = h+0.1; // for better holes

r1 = 2.5;

// X
L0L = 39.0;  L0R = 19.0; L0 = L0L + L0R; // outer
L1L = 37.6;  L1R = 17.9; L1 = L1L + L1R; // servo dimensions - unused
L2L = 34.0;  L2R = 15.0; L2 = L2L + L2R; // mounting holes
L3L = 30.1;  L3R = 10.4; L3 = L3L + L3R; // inner hole
Lm = 7.8; // mounting extra

//
W1 = 21.0; W1_2 = W1 / 2; // inner
W2 = 32.0; W2_2 = W2 / 2; // outer
W3 = 50.0; W3_2 = W3 / 2; // mounting

// translate([]) cube([]);

// #cylinder( r=0.2, h = 1.5*h );
//#translate([ 0,  20.0, 0]) cylinder( r=0.2, h = 1.5*h );
//#translate([ 0, -20.0, 0]) cylinder( r=0.2, h = 1.5*h );

difference() {
  union() {
    translate([-L0L,-W2_2,0]) cube([L0,W2,h]);
    translate([-L3L,-W3_2,0]) cube([Lm,W3,h]);
    translate([   0,-W3_2,0]) cube([Lm,W3,h]);
    translate([   0, -W2_2-1.4, 0]) rotate([0,0,45]) cube([2,2,h]);
    translate([   0,  W2_2-1.4, 0]) rotate([0,0,45]) cube([2,2,h]);
    translate([ -L3L+Lm, -W2_2-1.4, 0]) rotate([0,0,45]) cube([2,2,h]);
    translate([ -L3L+Lm,  W2_2-1.4, 0]) rotate([0,0,45]) cube([2,2,h]);
  }
  translate([-L3L,-W1_2,-0.05]) cube([L3,W1,hm]);
  translate([-L2L,-5.0,-0.05]) cylinder( r=r1, h=hm );
  translate([-L2L, 5.0,-0.05]) cylinder( r=r1, h=hm );
  translate([ L2R,-5.0,-0.05]) cylinder( r=r1, h=hm );
  translate([ L2R, 5.0,-0.05]) cylinder( r=r1, h=hm );
  translate([ -L0L, 20.0, h/2]) rotate([0,90,0]) cylinder( r=r1, h=L0 );
  translate([ -L0L,-20.0, h/2]) rotate([0,90,0]) cylinder( r=r1, h=L0 );
}
