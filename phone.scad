module phone
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
