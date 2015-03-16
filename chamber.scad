
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


//aimants
// (phi 1 x 1 )
// http://superaimants.fr/index.php?item=&action=article&group_id=70&aid=1477&lang=FR
// (phi 1.5 x 0.5 )
// http://superaimants.fr/index.php?item=&action=article&group_id=70&aid=1752&lang=FR
module magnet(){cylinder(r=0.5, h=1., $fn=60);}
module magnet_hole(){cylinder(r=0.55, h=1.1, $fn=60);} // adding 0.1 to the specs for tolerance

module four_magnets
(
    inter_axial_x=12,
    inter_axial_y=12,

)
{
    translate([-inter_axial_x/2, -inter_axial_y/2, 0]) magnet();
    translate([-inter_axial_x/2, inter_axial_y/2, 0]) magnet();
    translate([inter_axial_x/2, -inter_axial_y/2, 0]) magnet();
    translate([inter_axial_x/2, inter_axial_y/2, 0]) magnet();
}

module four_magnet_holes
(
    inter_axial_x=12,
    inter_axial_y=12,

)
{
    translate([-inter_axial_x/2, -inter_axial_y/2, 0]) magnet_hole();
    translate([-inter_axial_x/2, inter_axial_y/2, 0]) magnet_hole();
    translate([inter_axial_x/2, -inter_axial_y/2, 0]) magnet_hole();
    translate([inter_axial_x/2, inter_axial_y/2, 0]) magnet_hole();
}

module chamber_cube
(
    chamber_center=[0, 0, 0],
    outer=14,
    inner=10.2,
)
{
    translate(chamber_center)
    {
	difference()
	{
	    cube(outer, center=true);
	    union()
	    {
		translate([0, -outer+inner+1.5, 0])
		cube([inner, outer+1, inner], center=true);
		translate([0, 0, -8])
		cylinder(r=4.5, h=16, $fn=100);
		rotate([0, 90, 0])
		translate([0, 0, -8])
		cylinder(r=4.5, h=16, $fn=100);
		translate([3, 0, outer/2-1.])
		four_magnet_holes(inter_axial_x=6,
		    inter_axial_y=12);
	    }

	}
    }
}



cyl_lens_BFL = 4.0;

module whole_chamber
(
    chamber_center=[-2., 0, 3.5],
    outer=14,
)
{
    color([0.2, 0.8, 0.2, 0.5])
    difference()
    {
	chamber_cube(chamber_center=chamber_center, outer=outer);
	union()
	{
	    cylindrical_lens(back_focal_length=cyl_lens_BFL-1);
	    cylindrical_lens(back_focal_length=cyl_lens_BFL+1);
	}
    }
}




coverslips();
whole_chamber();
