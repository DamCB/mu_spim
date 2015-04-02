use <phone.scad>;


module dt12xy
(
    //thorlabs P/N DT12XY/M
    position=[60, -20, 8]
)
{
    translate(position)
    {
	union()
	{
	    rotate([0, 90, 0]) translate([-5, 0, 13]) dt12xy_ajust();
	    rotate([90, 0, 0]) translate([0, -5, 13]) dt12xy_ajust();
	    cube([25.4, 25.4, 30], center=true);
	}
	rotate([0, 0, 90])
	dt12b_m();
	rotate([180, 0, 0])
	dt12b_m();
    }
}


module dt12xy_ajust
(
)
{
    union()
    {
	cylinder(r=4, h=20, $fn=60);
	translate([0, 0, 10]) cylinder(r=5, h=10, $fn=60);
	translate([0, 0, 9]) cylinder(r1=4, r2=5, h=1, $fn=60);
    }
}

module dt12b_m
(
    //thorlabs P/N DT12B/M
    position=[0, 0, 14.7+3.]
)
{
    translate(position)
    difference()
    {
	cube([43, 25.4, 8], center=true);
	union()
	{
	    translate([0, 0, -3.5])
	    {
		cube([25.5, 25.5, 2], center=true);
		cylinder(r1=3, r2=3, h=20, $fn=60);
	    }
	    translate([0, 0, -3.2])
	    cylinder(r1=10, r2=3., h=2.4, $fn=60);
	}
    }
}


module optics_plate
(
    position=[36, -10, -19]
)
{
    translate(position)
    translate([0, 0, 2.5])
    difference()
    {
	cube([92, 50, 5], center=true);
	translate([5.05-position[0], -position[1], 0])
	cube([36, 25.1, 5.1], center=true);
    }
}


// module foot
// (

// )

//dt12b_m();
module phone_stand
(
    angle = -45,
)
{
     difference()
    {
	translate([50, 0, 6])
	cube([180, 100, 70], center=true);
	union()
	{
	    translate([43, 0, -20])
	    cube([140, 80, 30], center=true);
	    translate([40, 40, 40]) rotate([angle, 0, 0])
	    cube([210, 80, 40], center=true);
	    translate([40, -50, 0]) cube([220, 50, 100], center=true);
	}
    }
}

dt12xy();
phone();
phone_stand();
