
text="GRoza";
n=4;
size_symbol=20;
char_scale = 0.52;
height_symbol=5;
delta_z = 2;
fo = "Courier New; Style = Bold";
$fn=32;


for ( j = [0:1:n] ){
  he = height_symbol - (j % 2) * delta_z;
  // td = fontmetrics( font = fo, size = size_symbol );

  translate([size_symbol*char_scale*j,0,0])
     linear_extrude(height = he )
        text( text[j], font = fo, size = size_symbol, valign = "center", halign = "center");
}



translate([-size_symbol/1.8,0,height_symbol/2]){
    difference(){
        cylinder(h=height_symbol, r=4,center=true);
        cylinder(h=height_symbol+1, r=3,center=true);
    }
}

