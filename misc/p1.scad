
translate([x,PI,0]) {
  color([1,0,0]) {
    scale([2,4,5]) cube([2,3,4]);
  }
};
translate([0,0,-10]) resize(newsize=[30,60,10]) sphere(r=10);

color("blue") for (i=[0:3]) {
   translate([i*10,0,0])
     cube(i+1);
}

echo( "\u03A9 x=", x, sv[3] );
x=3;
// x=5;
sv = ["aaa","bbb", "ccc", "ddd" ];

