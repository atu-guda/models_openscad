//$fn=100;

color ([0,0,0])
translate ([40,0,0])
union()
{
  cylinder (h=2.5,r1=20,r2=20);
  translate([0,0,2.5]) cylinder(h=50,r1=15,r2=5);
  translate([0,0,52.5]) sphere(10); //d=20

  difference()
  {
    translate([0,0,62.5]) sphere(10); //d=20
    translate([0,0,72.5]) rotate ([0,0,45])
      cube([17,17,20],center=true); //d=20
  }

  translate([0,0,65]) sphere(3); //d=20
}

color ([1,1,1])
rotate ([0,35,0])
translate ([-30,0,65])
union()
{

    cylinder (h=2.5,r1=20,r2=20);
    translate([0,0,2.5]) cylinder(h=50,r1=15,r2=5);
    translate([0,0,52.5]) sphere(10); //d=20

    difference(){
      translate([0,0,62.5]) sphere(10); //d=20
      translate([0,0,72.5]) rotate ([0,0,45])
        cube([17,17,20],center=true); //d=20
    }

    translate([0,0,65]) sphere(3); //d=20

}

color ([1,0,0])
union()
{
    cylinder (h=2.5,r1=20,r2=20);
    translate([0,0,2.5]) cylinder(h=40,r1=15,r2=5);
    translate([0,0,42.5]) sphere(10); //d=20
}

color ([0,1,0]) translate ([-40,0,0])
union()
{
  cylinder(h=2.5,r1=20,r2=20);
  translate([0,0,2.5]) cylinder(h=40,r1=15,r2=5);
  translate([0,0,42.5]) sphere(10); //d=20
}

color ([0,0,1])
translate ([-20,40,0])
union()
{
  cylinder (h=2.5,r1=20,r2=20);
  translate([0,0,2.5]) cylinder(h=40,r1=15,r2=5);
  translate([0,0,42.5]) sphere(10); //d=20
}

union(){
  color ([0,0,0]) translate ([0,0,-5])    cube([40,40,10],center=true);
  color ([1,1,1]) translate ([40,0,-5])   cube([40,40,10],center=true);
  color ([1,1,1]) translate ([-40,0,-5])  cube([40,40,10],center=true);
  color ([1,1,1]) translate ([0,40,-5])   cube([40,40,10],center=true);
  color ([0,0,0]) translate ([40,40,-5])  cube([40,40,10],center=true);
  color ([0,0,0]) translate ([-40,40,-5]) cube([40,40,10],center=true);
}

union(){
  color([0,1,1])
    difference(){

      minkowski(){
        translate ([0,0,130])
          cylinder(h=30,r1=50,r2=1);
        cube([120,80,10],center=true);
      }

      minkowski(){
        translate ([0,0,120])
          cylinder(h=20,r1=40,r2=1);
        cube([120,80,10],center=true);
      }

    }
}

union(){
  color([1,1,0])
    difference(){

      minkowski(){
        translate ([0,0,-60])
          cube([120,80,10],center=true);
        cylinder(h=50,r1=1,r2=50);
      }

      minkowski(){
        translate ([0,0,-70])
          cube([120,80,10],center=true);
        cylinder(h=70,r1=1,r2=40);
      }

    }
}

translate([0,0,-70])  cube([120,80,10], center=true);
translate([0,0,-80])  cube([110,70,10], center=true);
translate([0,0,-90])  cube([100,60,10], center=true);
translate([0,0,-100]) cube([90,50,10],  center=true);

translate([-80,0,80]) color([1,0,0]) sphere(40);

translate([-150,30,50]) color([1,0,1])  sphere(10);


