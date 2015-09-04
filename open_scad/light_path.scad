use <excitation_optics.scad>

// Excitation light path
module excitation_beam
(
    exc_waist = 4., // collimated beam waist
    col_lens_BFL=4., // colimation lens backfocal length
    excitation_source=[10, 0, -24], // position of the excitation source
    cyl_lens_BFL=4,
    mirror_center=[10, 0, 0]
)
{
    color([0.1, 0.4, 0.4, 0.15])
    {
	translate(excitation_source)
	cylinder(r1=0.1, r2=exc_waist/2, h=col_lens_BFL, $fn=100);

	difference()
	{
	    union()
	    {
		translate([excitation_source[0],
			excitation_source[1],
			excitation_source[2] + col_lens_BFL])
		cylinder(r=exc_waist/2,
	            h=-excitation_source[2]-col_lens_BFL, $fn=100);

		translate([cyl_lens_BFL, 0, 0])
		rotate([0, 90, 0])
		cylinder(r=exc_waist/2,
	            h=excitation_source[0]-cyl_lens_BFL, $fn=100);
	    }
	    excitation_mirror(optical_center=mirror_center);
	}
	light_sheet(w_0=0.2,
	    cyl_lens_BFL=cyl_lens_BFL,
	    w_oo=exc_waist);
    }
}
module light_sheet
(
    w_0=0.1,
    cyl_lens_BFL=4,
    w_oo=4,
)
{
    d = (w_oo - w_0)/2.;
    r = (d*d + cyl_lens_BFL*cyl_lens_BFL)/(2*d);
    difference()
    {
	translate([-cyl_lens_BFL, 0, 0 ])
	rotate([0, 90, 0])
	cylinder(r=w_oo/2, h=2*cyl_lens_BFL, $fn=100);
	union()	rotate([90, 0, 0])
	{
	    translate([0, r+w_0, -cyl_lens_BFL/2])
	    cylinder(r=r, h=w_oo+0.2, $fn=200);
	    translate([0, -r-w_0, -cyl_lens_BFL/2])
	    cylinder(r=r, h=w_oo+0.2, $fn=200);
	}
    }
}


excitation_beam();