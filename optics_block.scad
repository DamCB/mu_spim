use <chamber.scad>;
use <excitation_optics.scad>;
use <collection_optics.scad>;

use <libraries/thread.scad>;


module hex_adjustment_screw
(
    //THORLABS P/N F3SS8
)
{
    color([0, 0, 0])
    union()
    {
	difference()
	{
	    metric_thread(3, 0.25, 7.6);
	    translate([0, 0, -0.1]) cylinder(r=0.75, h=2.1, $fn=6);
	}
	translate([0, 0, 7.]) sphere(d=1.5, $fn=100);
    }
}

module adjuster_nut
(
    //THORLABS P/N N250L3
)
{
    difference()
    {
	union()
	{
	    cylinder(r=3, h=2, $fn=6);
	    translate([0, 0, 2]) metric_thread(4.5, 0.5, 3);
	}
	translate([0, 0, -1]) metric_thread(3, 0.25, 7.6, internal=true);
    }
}

module adjuster
(
    nut_shift=1.2
)
{
    translate([0, 0, -8])
    {
	hex_adjustment_screw();
	translate([0, 0, nut_shift]) adjuster_nut();
    }
}

module x_excitation_adjuster
(
    adjuster_tip = [10, 0, 15]
)
{
    translate(adjuster_tip)
    rotate([0, -90, 0])
    adjuster();
}

module y_excitation_adjuster
(
    adjuster_tip = [18, 0, -5]
)
{
    translate(adjuster_tip)
    rotate([0, 180, 0])
    adjuster(nut_shift=-0.);
}


module x_excitation_rods
(
    interaxial_dist = 12,
    position=[15, 0, 15],
)
{
    translate(position)
    {
	translate([0, -interaxial_dist/2, 0])
	rotate([0, -90, 0])
	cylinder(r=2, h=12.7, $fn=36);//THORLABS P/N SR05
	translate([0, interaxial_dist/2, 0])
	rotate([0, -90, 0])
	cylinder(r=2, h=12.7, $fn=36);//THORLABS P/N SR05
    }
}

module y_excitation_rods
(
    interaxial_dist = 22,
    position=[15, 0, -5],
)
{
    translate(position)
    {
	translate([0, -interaxial_dist/2, 0])
	cylinder(r=2, h=12.7, $fn=36);//THORLABS P/N SR0.5
	translate([0, interaxial_dist/2, 0])
	cylinder(r=2, h=12.7, $fn=36);//THORLABS P/N SR0.5
    }
}

module collimation_block
(
    position=[15, 0, 3.5],
    exc_axis_x=10,
)
{
    translate(position)
    {
	difference()
	{
	    translate([0, 0, 4]) cube([15, 30, 24], center=true);
	    union()
	    translate(-position)
	    {
		translate([exc_axis_x-1.8, 0, -4.51])
		cube([6.1*1.42, 5.1*1.42, 10*1.42], center=true);
		translate([exc_axis_x-3, 0, 15]) cube([8, 19, 20], center=true);
		xy_excitation_holes();
	    }
	}
    }
}

module xy_excitation_holes
(
    x_tip=[10, 0, 15],
    y_tip = [18, 0, -5],
)
{
    // x axis
    x_excitation_rods();
    translate([12, 0, 0]) x_excitation_rods();
    // y axis
    y_excitation_rods();
    translate([0, 0, 12])
    y_excitation_rods();
    translate(y_tip+[0, 0, 8]) rotate([0, 180, 0])
    union()
    {
	translate([0, 0, -18])
	//cylinder(r=4, h=20, $fn=60);
	translate([-4.8, -4, 0])
	cube([8, 8, 20], center=True);
	translate([0, 0, 1.8])
	metric_thread(4.5, 0.5, 6.2, internal=true);
    }
    translate(x_tip+[6.2, 0, 0])
    rotate([0, -90, 0])
    metric_thread(4.5, 0.5, 6.2, internal=true);

}

chamber_cube_outer=14;
chamber_center=[-2., 0, 3.5];
magnets_center = chamber_center + [3, 0, chamber_cube_outer/2];


module chamber_top
(
    position=[0, 0, 0]
)
{
    translate(position)
    difference()
    {
	translate([-7, 0, 0]) cube([14, 18, 10], center=true);
	union()
	{
	    //offset(0.1)
	    x_excitation_rods(position=[-2, 0, 0]);
	    x_excitation_rods(position=[2, 0, 0]);
	    translate([-12, 0, -5]) cylinder(r=5, h=3, $fn=50);
	    translate([-15, 0, -5]) rotate([0, 30, 0])
	    union()
	    {
		cylinder(r1=5, r2=5, h=20, $fn=50);
		translate([-5, 0, 10])
		cube([10, 10, 20], center=true);
	    }
	    translate([-8, 0, 5]) rotate([0, -30, 0])
	    cube([20, 20, 6], center=true);
	    translate([-9, 0, 1.2]) rotate([0, -60, 0])
	    cube([2, 10, 2], center=true);
	    translate(magnets_center - position )//magnets_center)//+[0, 0, -1.1])
	    four_magnet_holes(inter_axial_x=6,
		inter_axial_y=12);
	    translate(chamber_center - position - [-5, 0, 0])
	    cube(chamber_cube_outer+0.2, center=true);
	}
    }
}


module base_block
(
    position=[5, 0, -5],
    filter_thick=2.5+0.1,
    cube_h=14.,
    exc_axis_x=10,
    //position=[0, 0, 0]
)
{
    translate(position)
    union()
    {
	difference()
	{
	    translate([0, 0, -cube_h/2])
	    cube([35, 30, cube_h], center=true);
	    union()
	    {
		filter_slot(filter_center=[2+exc_axis_x, 0, -10.] - position);
		rotate([0, 0, 180]) translate([2, 0, -10.] - position)  filter_slot();
		//excitation clearing
		translate([exc_axis_x, 0, -20] - position) cylinder(r=3, h=30, $fn=100);
		//collection clearing
		translate([0, 0, -20] - position)
		cylinder(r=5, h=14, $fn=100);
		translate([0, 0, -8] - position)
		cylinder(r=1.5, h=5, $fn=100);
		translate([exc_axis_x, 0, -22] - position)
		metric_thread(9, 0.5, 10, internal=true);
		// four_magnet_holes(inter_axial_x=6,
		// 	inter_axial_y=12);
	    }
	}
	translate(-position)
	%lens_holder();
    }
}

module lens_holder
(
    lens_BFL=2,
    lens_dia=2,
    position=[4, 0, 0],
    cube_h=2.5,
    cone_h=3,
)
{
    translate(position)
    union()
    translate(-position)
    translate([0, 0, -lens_BFL-cone_h])
    difference()
    {
	cylinder(r1=3., r2=2., h=cone_h, $fn=100);
	translate([0, 0, -0.05])
	cylinder(r1=1.5, r2=1.02, h=cone_h+0.1, $fn=100);
    }
}



module filter_slot
(
    filter_thick=2.5,
    filter_center=[7, 0, 0],
    filter_dia=12,
    tol=0.15,
)
{

    translate(filter_center)
    union()
    {
	translate([0, -(filter_dia+tol)/2, 0])
	cube([filter_dia+tol, filter_dia+tol, filter_thick+tol], center=false);
	cylinder(r=(filter_dia+tol)/2, h=filter_thick+tol, $fn=100);
    }
}
//whole_chamber(chamber_center=chamber_center, outer=chamber_cube_outer);

x_adjust_contact = [10, 0, 15];
x_excitation_adjuster(adjuster_tip=x_adjust_contact);

// translate([4, 0, 0])
// x_excitation_rods(position=x_adjust_contact);

// Imaging optics
im_lens_BFL=2;
//imaging_lens(back_focal_length=im_lens_BFL);

y_excitation_rods();
x_excitation_rods();
y_excitation_adjuster();

//chamber_top(position=x_adjust_contact);
base_block();
%collimation_block();
//xy_excitation_holes();