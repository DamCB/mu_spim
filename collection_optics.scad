module imaging_lens
(
    radius=2.0,
    thickness=1.0,
    back_focal_length=2.0,
)
{
    translate([0, 0, -back_focal_length])
    difference()
    {
	sphere(r=radius, $fn=100, center=true);
	translate([0, 0, radius+0.1])
	cube([2*radius+0.1, 2*radius+0.1, 2*radius+0.1], center=true);
    }
}


module collection_filter
// edmund optics P/N 48-632
(
    diameter=12,
    thickness=2.5
)
{
    color([0.1, 0.2, 0.8, 0.5])
    cylinder(r=diameter/2, h=thickness, $fn=100);
}
