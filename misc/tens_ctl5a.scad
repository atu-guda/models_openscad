// use <MCAD/3d_triangle.scad>

$fn = 25;

// defs: b_ = base, a_ = axis towers, in_ = inlet,

// common and input
r_mhole = 2.1;
r_blin = 25.0 / 2;
a_r  = 4.7;
a_w  = 2.0;
in_y =  4;
cf_h = 2.0;

// base
b_x = 30;
b_y = 33;
b_z = 5;
b_cx = b_x / 2;

// axis
a1_x = 10;
a2_x =  5;
a_y  = 2 * ( ceil( a_r + a_w ) );
a_z  = 25;
ax_y = b_y-ceil(a_r+a_w);
ax_z = b_z+a_z-ceil(a_r+a_w);


// inlet
in_x = 12;
// in_y =  4;// upper
in_z = 10;
in_r1 = 2.0;
in_r2 = 0.5;

module conterforce( w, h=1.0 )
{
  polyhedron( points=[[0,-h,0],[0,0,0],[0,0,h],
                      [w,-h,0],[w,0,0],[w,0,h]],
    faces=[  [0,1,2],[0,2,5,3],[3,5,4],
            [0,3,4,1],[1,4,5,2]   ]  );               
}


// #conterforce( b_x, 1 );

difference() {  
  union() {
    cube([b_x,b_y,b_z]);                                         // base
    translate([b_x-a1_x,b_y-a_y,b_z]) cube([a1_x,a_y,a_z] );     // right (1) tower
    translate([       0,b_y-a_y,b_z]) cube([a2_x,a_y,a_z] );     // left (2) tower
    translate([b_cx-in_x/2,0,b_z]) cube([in_x,in_y,in_z] );      // inlet tower
    translate([0,b_y-a_w,b_z]) cube([b_x,a_w,a_w] );             // back bar
    translate([0,b_y-a_w,b_z]) conterforce( b_x, 1.0 );
    translate([0,b_y-a_y,b_z]) conterforce( a2_x, cf_h );  // left cf
    translate([0,b_y-a_y,b_z]) conterforce( 3, 10 );
    translate([a2_x,b_y-0.5-a_y,b_z])
      rotate([0,0,90]) conterforce( a_y-1, 1.4 );
    
    translate([b_x-a1_x,b_y-a_y,b_z]) conterforce( a1_x, cf_h );  // right cf
    translate([b_x-3,b_y-a_y,b_z]) conterforce( 3, 10 );
    translate([b_x-a1_x,b_y-0.8,b_z])
      rotate([0,0,-90]) conterforce( a_y-0.4, 1.4 );
    translate([b_cx+10,in_y,b_z])               // inlet cf
      rotate([0,0,180]) conterforce( 1.65*in_x, cf_h );
    translate([b_cx+in_x/2,0,b_z])
      rotate([0,0,90]) conterforce( in_y, in_x/2 ); 
    translate([b_cx-in_x/2,in_y,b_z])
      rotate([0,0,-90]) conterforce( in_y, in_x/2 ); 
    
    
    
  };
  translate([0,ax_y,ax_z]) rotate([0,90,0]) cylinder( r=a_r, h=b_x );
  translate([b_cx,0,b_z+in_z-in_r1-a_w]) rotate([-90,0,0]) cylinder( r1=in_r1, r2=in_r2, h=in_y );
  
  translate([b_cx,ax_y,0]) cylinder( r=r_mhole, h=b_z );
  translate([b_cx,ax_y-18,0]) cylinder( r=r_mhole, h=b_z );
  
  
}

echo( "a_y= ", a_y, "ax_y= ", ax_y, "ax_z= ", ax_z  );

  
