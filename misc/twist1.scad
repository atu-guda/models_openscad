linear_extrude(height = 10, center = true, convexity = 50, twist = 720,
, slices = 100, scale=0, $fn=100)
translate([2, 0, 0])
circle(r = 1);
color("blue") linear_extrude(height = 5, center = false, convexity = 50, twist = 0, scale=[1,1,5], $fn=100)text("VAT");