
use <excitation_optics.scad>;

module coverslip
(
    coverslip_tk=0.18,
    coverslip_w=10
)
{
    color([0.4, 0.4, 0.4, 0.1])
    cube([coverslip_tk,
	    coverslip_w,
	    coverslip_w], center=true);
}

chamber_center=[-2., 0, 3.5];
module coverslips
(
    coverslip_tk=0.18,
    coverslip_w=10,
    chamber_center=[-2., 0, 3.5]
)
{
    shift = coverslip_w/2 + coverslip_tk;
    translate(chamber_center)
    {
	//illumination lens face
	translate([0, 0, -shift])
	rotate([0, 90, 0])
	coverslip();
	//oposite to illumination lens face
	translate([0, 0, shift])
	rotate([0, 90, 0])
	coverslip();
	//collection lens face
	translate([-shift, 0, 0])
	coverslip();
	//opposite to collection lens face
	translate([shift, 0, 0])
	coverslip();
    }
}


module chamber_cube
(
    chamber_center=[0, 0, 0],
    outer=14,
    inner=10.2,
)
{
    translate(chamber_center)
    color([0.2, 0.8, 0.2, 0.5])
    {
	difference()
	{
	    cube(outer, center=true);
	    union()
	    {
		translate([0, outer-inner-1, 0])
		cube([inner, outer+1, inner], center=true);
		translate([0, 0, -8])
		cylinder(r=5, h=16, $fn=100);
		rotate([0, 90, 0])
		translate([0, 0, -8])
		cylinder(r=5, h=16, $fn=100);
	    }

	}
    }
}

cyl_lens_BFL = 4.0;

module whole_chamber
(
    chamber_center=[-2., 0, 3.5]
)
{
    difference()
    {
	chamber_cube(chamber_center=chamber_center);
	union()
	{
	    cylindrical_lens(back_focal_length=cyl_lens_BFL-1);
	    cylindrical_lens(back_focal_length=cyl_lens_BFL+1);
	}
    }
}

coverslips();
whole_chamber();