// magnet 10x3 holder on 6mm axis with thread

$fn=50;
ov = 0.1; // overshot for clear view

r_mag    = 5.0;
h_mag    = 2.2;
r_axis   = 4.1; // 
h_axis   = 8.0;
h_mid    = 0.0;
r_out = max(r_mag,r_axis) + 2.0;
h_all = h_mag + h_mid + h_axis;

difference() {
  union() {
    cylinder( h=h_mag+h_mid, r=r_out );
    //translate([0,0,h_mag+h_mid]) cylinder( h=1.0, r=r_axis+3.5 );
    translate([0,0,h_mag+h_mid]) cylinder( h=h_axis, r=r_out );
  }
  translate([0,0,-ov]) cylinder( h=h_mag+ov, r=r_mag );
  translate([0,0,h_mag+h_mid-ov]) cylinder( h=h_axis+2*ov, r=r_axis );
  translate([0,0,-ov]) cylinder( h=h_all+2-ov, r=0.8 );
}

