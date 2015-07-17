use <phone.scad>;
include <base_dimensions.scad>;


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
    position=[36, -8, -19]
)
{
    translate(position)
    translate([0, 0, 2.5])
    difference()
    {
	cube([92, 50, 5], center=true);
	union()
	{
	    translate([5.05-position[0], -position[1], 0])
	    cube([36, 25.1, 5.1], center=true);
	}
    }
}

module backplate
(
    position=[60, -20, 30]
)
{
    translate(position)
    cube([50, 50, 10], center=true);
}


// module foot
// (

// )

module rail
(
    entraxe=10,
    dia=3,
    length=100,
)
{
    ax_shift=entraxe/2;
    rad = dia/2;
    union()
    {
	translate([-ax_shift, 0, 0])
	cylinder(r=rad, h=length,
	    center=true, $fn=12);
	translate([ax_shift, 0, 0])
	cylinder(r=rad, h=length,
	    center=true, $fn=12);
    }
}


module xy_rails
(
    position=[130, 30, -20],
    x_shift=-70,
    x_length=200,
    y_shift=-30,
    y_length=100,
    entraxe=10
)
{
    translate(position) translate([0, 0, -entraxe*0.75])
    {
	// x axis
	translate([x_shift, 0, entraxe/2])
	rotate([0, 90, 0])
	rail(length=x_length);
	// y axis
	translate([0, y_shift, 0])
	rotate([0, 90, 0]) rotate([90, 0, 0])
	rail(length=y_length);
    }
}



module crux
(
        position=[130, 40, -20],
)
{
    translate(position)
    {
	xy_rails(position=[0, 0, 0]);
	difference()
	{
	    translate([-10, 0, -5])
	    cube([30, 30, 25], center=true);
	    union()
	    {
		xy_rails(position=[0, 0, 0]);
		translate([-24, -12, -5])// rotate([90, 0, 0])
		sphere(r=8, center=true);
		translate([-24, -19, -5]) rotate([90, 0, 0])
		cylinder(r=8, h=20, center=true);
	    }
	}
    }
}




module phone_stand
(
    angle = -45,
)
{


}

dt12xy();
optics_plate();
phone();
backplate();
phone_stand();

crux();