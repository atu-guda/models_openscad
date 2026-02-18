// based on https://www.thingiverse.com/thing:5029938/files
// small adjutment by atu
//---------------------------------------
// LEGO Technic Beam
//

/* [Facets:] */
$fn= 43;

/* [Extrusion:] */
EC= 0.3;  // Extrusion Correction
PC= 0.01; // Preview Coincient surface adjustment

// Hole sequence.
// . = pinhole
// * - side pinhole
// | = flag hole
// ! = side flat hole
// - = flat hole
// = = side flat hole
// o = round hole,
// + = cross hole,
// x = x hole
// X = side x hole,
// O = side hole,
// P = side crosshole,
// 3 = M3 for thread
// 8 = M3 for thread side
// 4 = M4 for thread
// 9 = M4 for thread side
// other - blank position.


LegoBeam( "+o!xX*.-O3489+" );

module LegoBeam( Model ) {
  SegLen     = 8;            // [1:1:50]
  R1         = 2.5 + EC/2;
  R2         = 3.05 + EC/2;
  Height     = 7.8;          // [4.0,7.8];
  Depth      = 0.85;
  Width      = 7.3;
  W2         = Width/2;
  Cross_Wid  = 2.0;
  PinHoleR   = .5;
  R_M3       = 1.4;
  R_M4       = 1.9;
  rot_h = [90,0,0];

  difference() {
    Body();

    for (i = [0:len(Model)-1]) {
      L_i = i*SegLen;
      shift_z = [L_i, W2, 0];
      shift_y = [L_i, W2, -SegLen+Depth/2];

      if (Model[i] == ".")
        translate(shift_z)
          PinHole();

      else if (Model[i] == "*")
        rotate(rot_h)
          translate(shift_y)
            PinHole();

      else if (Model[i] == "|")
        translate(shift_z)
          Flat();

      else if (Model[i] == "!")
        rotate(rot_h)
          translate(shift_y)
            Flat();

      else if (Model[i] == "-")
        translate(shift_z)
          rotate([0,0,90])
            Flat();

      else if (Model[i] == "=")
        rotate(rot_h)
          translate(shift_y)
            rotate([0,0,90])
              Flat();

      else if (Model[i] == "X")
        rotate(rot_h)
          translate(shift_y)
            rotate([0,0,45])
              Cross();

      else if (Model[i] == "x")
        translate(shift_z)
          rotate([0,0,45])
            Cross();

      else if (Model[i] == "+")
        translate(shift_z)
          Cross();

      else if (Model[i] == "o")
        translate(shift_z)
          Hole();

      else if (Model[i] == "3")
        translate(shift_z)
          Hole_M3();

      else if (Model[i] == "8")
        rotate(rot_h)
          translate(shift_y)
            Hole_M3();

      else if (Model[i] == "4")
        translate(shift_z)
          Hole_M4();

      else if (Model[i] == "9")
        rotate(rot_h)
          translate(shift_y)
            Hole_M4();


      else if (Model[i] == "O")
        rotate(rot_h)
          translate([L_i, W2,-SegLen+Depth/2])
            Hole();

      else if (Model[i] == "P")
        rotate(rot_h)
          translate([L_i, W2,-SegLen+Depth/2])
          Cross();

      else {}
    }
  }


  //---------------------
  // Generate Beam Body
  module Body() {

    translate([0, W2, 0])
      hull() {
        cylinder(d=Width, h=Height);

        translate([(len(Model)-1)*SegLen, 0, 0])
          cylinder(d=Width, h=Height);
      }
  }


  //----------------------
  // Generate Round Hole
  module Hole() {

    cylinder(r=R1+EC/2,h=Height);

    translate([0,0,Height-Depth+PC])
      cylinder(r=R2+EC/2,h=Depth);

    translate([0,0,-PC/2])
      cylinder(r=R2+EC/2,h=Depth);

    translate([0,0,Depth-PC])
      cylinder(h=(R2 - R1), r1=R2+EC/2, r2=R1+EC/2);
  }


  //----------------------
  // Generate Round PinHole
  module PinHole() {

    translate([0,0,-PC/2])
      cylinder(r=PinHoleR+EC/2,h=Height+PC);

  }

  module Hole_M3() {

    translate([0,0,-PC/2])
      cylinder(r=R_M3+EC/2,h=Height+PC);

  }

  module Hole_M4() {

    translate([0,0,-PC/2])
      cylinder(r=R_M4+EC/2,h=Height+PC);

  }


  //---------------------------
  // Generate cross type hole
  module Cross() {

    translate([-(Cross_Wid + EC)/2, -R1, -PC])
      cube([Cross_Wid + EC, R1*2, Height+PC*2]);
    translate([-R1, -(Cross_Wid+EC)/2, -PC])
      cube([R1*2, Cross_Wid + EC, Height+PC*2]);
  }


  //---------------------------
  // Generate flat type hole
  module Flat() {

    translate([-(Cross_Wid + EC)/2, -R1, -PC])
      cube([Cross_Wid + EC, R1*2, Height+PC*2]);
  }

}

