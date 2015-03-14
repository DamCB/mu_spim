
// phone model = Samsung galaxy nexus -tm-
// portrait mode


focal_point = [0, 0, 0];
excitation_source = [10, 0, -24]; //estimated

module sample
(
  sample_pos = focal_point,
)
{translate(sample_pos) sphere(0.5);
}

use <phone.scad>;
use <excitation_optics.scad>
use <collection_optics.scad>

sample();
phone(phone_back_z=20);

// Excitation optics
col_lens_BFL = 5.2;
collimation_lens(back_focal_length=col_lens_BFL,
                 source_position=excitation_source);

mirror_center = [excitation_source[0],
                 focal_point[1],
		 focal_point[2]];
excitation_mirror(optical_center=mirror_center);

filter_deport = 8.0;

translate([excitation_source[0],
           focal_point[1],
	   focal_point[2] - filter_deport])
excitation_filter();

// cylindrical lens Back Focal Length
cyl_lens_BFL = 4.0;
cylindrical_lens(back_focal_length=cyl_lens_BFL);

// Imaging optics
imaging_lens();

// Excitation light path
exc_waist = 4.;
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


scale([1, 1, 0.2]) union()
{
    rotate([0, 90, 0])
    cylinder(r1=0.2, r2=exc_waist/2, h=cyl_lens_BFL, $fn=100);
    rotate([0, -90, 0])
    cylinder(r1=0.2, r2=exc_waist/2, h=cyl_lens_BFL, $fn=100);
}