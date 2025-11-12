// magnet 5x2 holder on 6mm axis with thread

$fn=30;
ov = 0.05; // overshot for crear view

r_mag    = 2.5;
h_mag    = 2.0;
r_axis   = 2.8; // 5.6 = 6.0 - thread
h_axis   = 5.0;
h_mid    = 1.0;
r_out = max(r_mag,r_axis) + 2.0;
h_all = h_mag + h_mid + h_axis;

difference() {
  union() {
    cylinder( h=h_all, r=r_out );
  }
  translate([0,0,-ov]) cylinder( h=h_mag, r=r_mag );
  translate([0,0,h_mag+h_mid+ov]) cylinder( h=h_axis, r=r_axis );
  translate([0,0,-ov]) cylinder( h=h_all+2-ov, r=0.8 );
}

