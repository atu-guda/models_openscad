fnt="Century Schoolbook:style=Bold";
txt="J\u0424\u263A.";

module trinket_body(thicknes, title)
{
  difference(){

    linear_extrude(height=thicknes,convexity=10){

      hull(){
        offset(r=0.8){
          square([30,20],center=true);
        }
        translate([30,0,0]) circle(r=5,$fn=64);
      }
    }

    translate([30,0,0]) cylinder(h=thicknes*2+1,r=3,$fn=64,center=true);

    translate([-10,-6,0]){
      linear_extrude(height=15, convexity = 10,center=true){
        text(text=title, language="ua", font="Segoe Script:style=Book",size=13,$fn=30);}
    }
  }
}

// trinket_body(3,"ITC");

tm = textmetrics(text=txt, font=fnt,size=15,$fn=30 );
echo( tm );
 // { position = [0.864, -1.2192]; 
 //   size = [57.8924, 16.272];
 //   ascent = 15.0528; descent = -1.2192; offset = [0, 0];
 //   advance = [59.9366, 0]; }
 
linear_extrude(height=5, convexity = 10,center=false){
  text(text=txt, font=fnt,size=15,$fn=30);
}

translate( [tm.position.x,tm.position.y,])
  cube([tm.size.x, tm.size.y, 0.5] );

// translate([0,20,0]) roof(convexity=6) text("W", font=fnt, size=25);

//translate([0,25,0]) trinket_body(3,"ITC");
//translate([0,50,0]) trinket_body(3,"ITC");





