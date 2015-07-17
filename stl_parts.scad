include <base_dimensions.scad>;

use <optic_blocks.scad>;


position=[exc_axis_x+5, 0, 3.5];
//position=[0, 0, 0];
//translate(-position)
//projection(cut=true)
//translate([0, 2, 3.414])//3.414])
//rotate([90, 0, 0])
collimation_block(position=position, exc_axis_x=exc_axis_x);
//sheet_focalisation(x_adjust_contact, y_adjust_contact);
