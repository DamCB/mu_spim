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