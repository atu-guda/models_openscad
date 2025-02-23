module trinket_body(thicknes, tittle)
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
        text(text=tittle, language="ua", font="Segoe Script:style=Book",size=13,$fn=30);}
    }
  }
}

trinket_body(3,"ITC");

translate([0,25,0]) trinket_body(3,"ITC");
translate([0,50,0]) trinket_body(3,"ITC");





