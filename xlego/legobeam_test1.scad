use <LegoBeam-atu1.scad>

// translate([0,40,0]) LegoBeam( "+o!xX*.-O3489+" );

LegoBeam( "o+o" );

translate([0,20,0]) union() {
  LegoBeam("+");
  translate([0,0,7.8]) LegoBeam("o");
}

