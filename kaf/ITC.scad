linear_extrude(height=15, convexity = 10){
    
text(text="Кафедра ITC",
     language="ua",
     font="Segoe Script:style=Book",
     $fn=30);
    
}

translate([0,-6,0]) cube([90,4,15]);

translate([0,-6,0])
rotate([-90,0,0]) cube([90,4,16]);