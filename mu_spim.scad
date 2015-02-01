
// phone model = Samsung galaxy nexus -tm-
// portrait mode

focal_point = [0, 0, 0];

module sample
(
  sample_pos = focal_point,
)
{translate(sample_pos) sphere(0.5);
}

module phone
(
  /// Phone is assumed to be in portrait mode
  // phone outisde dimensions
  phone_length = 136,      // x axis
  phone_width = 68,  // y axis
  phone_thikness = 10,
  phone_back_z = 1, // distance of phone back from the focal point
  phone_aperture_diameter = 16, // estimated
  // detector and source position with respect to
  // phone face upper right corner
  detector_pos_x = 25,
  detector_pos_y = 34,
  detector_pos_z = 10,
  //
  source_pos_x = 35,
  source_pos_y = 34,
  source_pos_z = 10,
)
{
    detector_pos = [detector_pos_x, detector_pos_y, detector_pos_z];
    source_pos = [source_pos_x, source_pos_y, source_pos_z];
    translate(-detector_pos)
    {
	difference()
	{
	    cube(size=[phone_length,
	            phone_width,
	  	    phone_thikness], center=false);
	    union()
	    {
		translate([0, 0, -1.5])
		{
		    translate(detector_pos) cylinder(h=2, d=phone_aperture_diameter, $fn=100);
		    translate(source_pos)  cylinder(h=2, d=phone_aperture_diameter, $fn=100);
		}
	    }
	}
}
}


sample();
phone(
  phone_length = 136,      // x axis
  phone_width = 68,  // y axis
  phone_thikness = 10, // z axis
  phone_back_z = 1, // distance of phone back from the focal point
  phone_aperture_diameter = 16, // estimated
  // detector and source position with respect to
  // phone face upper right corner
  detector_pos_x = 25,
  detector_pos_y = 34,
  detector_pos_z = 10,
  source_pos_x = 35,
  source_pos_y = 34,
  source_pos_z = 10,
);