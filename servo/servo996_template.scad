$fn = 52;
use <atu_rounds.scad>


h  = 1.0;
hm = h+0.1; // for better holes

r2 = 0.8;

// X
L0L = 39.0;  L0R = 19.0; L0 = L0L + L0R; // outer
L1L = 37.6;  L1R = 17.9; L1 = L1L + L1R; // servo dimensions - unused
L2L = 34.0;  L2R = 15.0; L2 = L2L + L2R; // mounting holes
L3L = 31.1;  L3R = 11.4; L3 = L3L + L3R; // inner hole

//
W1 = 21.0; W1_2 = W1 / 2; // inner
W2 = 32.0; W2_2 = W2 / 2; // outer
W3 = 50.0; W3_2 = W3 / 2; // mounting


difference() {
  union() {
    translate([-L0L,-W2_2,0]) cube_round_xy(L0,W2,h, 3); 
  }
  translate([-L3L,-W1_2,-0.5]) cube_round_xy(L3,W1,hm+2, 0.5); // main brick hole
  // mounting holes targets
  translate([-L2L,-5.0,-0.05]) cylinder( r=r2, h=hm );
  translate([-L2L, 5.0,-0.05]) cylinder( r=r2, h=hm );
  translate([ L2R,-5.0,-0.05]) cylinder( r=r2, h=hm );
  translate([ L2R, 5.0,-0.05]) cylinder( r=r2, h=hm );
  
  // indicators
  translate([  0, 13, h-1]) cylinder( r=r2, h=2 );
  translate([  0,-13, h-1]) cylinder( r=r2, h=2 );
  translate([ 17,  0, h-1]) cylinder( r=r2, h=2 );
  translate([-37,  0, h-1]) cylinder( r=r2, h=2 );
  
}
