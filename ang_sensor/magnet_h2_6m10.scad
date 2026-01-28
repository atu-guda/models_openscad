// magnet 10x3 holder on 6mm axis with thread

$fn=50;
ov = 0.1; // overshot for clear view

r_mag    = 5.0;
h_mag    = 3.0;
r_axis   = 2.8; // 5.6 = 6.0 - thread
h_axis   = 6.0;
h_mid    = 0.6;
r_out = max(r_mag,r_axis) + 2.0;
h_all = h_mag + h_mid + h_axis;

difference() {
  union() {
    cylinder( h=h_mag+h_mid, r=r_out );
    translate([0,0,h_mag+h_mid]) cylinder( h=1.0, r=r_axis+3.5 );
    translate([0,0,h_mag+h_mid]) cylinder( h=h_axis, r=r_axis+2.5 );
  }
  translate([0,0,-ov]) cylinder( h=h_mag+ov, r=r_mag );
  translate([0,0,h_mag+h_mid-ov]) cylinder( h=h_axis+2*ov, r=r_axis );
  translate([0,0,-ov]) cylinder( h=h_all+2-ov, r=1.5 );
}

