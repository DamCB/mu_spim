module phone_sgn // samsung Galxy Nexus
(
  /// Phone is assumed to be in portrait mode
  // phone outisde dimensions
  phone_length = 136,      // x axis
  phone_width = 68,  // y axis
  phone_thikness = 10,
  phone_back_z = 20, // distance of phone back from the focal point
  phone_aperture_diameter = 8, // estimated
  phone_excitation_diameter = 8,
  // detector and source position with respect to
  // phone face upper right corner
  detector_pos = [25, 34, 10],
  //
  source_pos = [35, 34, 10],
)
{
    color([0.2, 0.2, 0.2, 0.8])
    translate(-detector_pos) translate([0, 0, -phone_back_z])
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
		    translate(detector_pos) cylinder(h=2,
			r=phone_aperture_diameter/2, $fn=100);
		    translate(source_pos)  cylinder(h=2,
			r=phone_excitation_diameter/2, $fn=100);
		}
	    }
	}
    }
}


module phone_mg4G // Motorola G 4G (2015)
(
  /// Phone is assumed to be in portrait mode
  // phone outisde dimensions
  phone_length = 141.5,      // x axis
  phone_width = 70.7,  // y axis
  phone_thikness = 11,
  phone_back_z = 21, // distance of phone back from the focal point
  phone_aperture_diameter = 10, // estimated
  phone_excitation_diameter = 5,
  // detector and source position with respect to
  // phone face upper right corner
  detector_pos = [22.75, 35.35, 11],
  //
  source_pos = [37.75, 35.35, 11],
  corner_radius = 12.3,
)
{
    color([0.2, 0.2, 0.2, 0.8])
    translate(-detector_pos) translate([0, 0, -phone_back_z])
    {
	difference()
	{
	    translate([corner_radius, corner_radius, 1])
	    minkowski()
	    {
		cube(size=[phone_length - 2 * corner_radius,
			phone_width - 2 * corner_radius,
	  		phone_thikness-2], center=false);
		scale([1, 1, 1/corner_radius])
		{
		    sphere(r=corner_radius);//, h=1);
		}
	    }
	    union()
	    {
		translate([0, 0, -1.5])
		{
		    translate(detector_pos) cylinder(h=2,
			r=phone_aperture_diameter/2, $fn=100);
		    translate(source_pos)  cylinder(h=2,
			r=phone_excitation_diameter/2, $fn=100);
		}
	    }
	}
    }
}

module phone()
{
    //phone_sgn();
    phone_mg4G();
}