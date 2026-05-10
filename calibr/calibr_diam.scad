
za = 2.0;

dr = 2.0;
r1 = 11.0;

difference() {
  cylinder( r=r1+dr, h = za );
  cylinder( r=r1   , h = za );
}


translate([27,0,0]) difference() {
  cylinder( r=r1+dr+0.2, h = za );
  cylinder( r=r1+0.2   , h = za );
}

