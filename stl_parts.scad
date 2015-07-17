include <base_dimensions.scad>;
use <chamber.scad>;

use <optic_blocks.scad>;
use <base.scad>;


// position=[exc_axis_x+5, 0, 3.5];
// collimation_block(position=position, exc_axis_x=exc_axis_x);

// chamber_top_pos = [10, 0, 15];
// chamber_top(position=chamber_top_pos);

//base_block();
chamber_center=[-2., 0, 3.5];
whole_chamber(chamber_center=chamber_center);

//optics_plate();