use <optic_blocks.scad>;

focal_point = [0, 0, 0];
excitation_source = [14, 0, -24]; //estimated
exc_axis_x = excitation_source[0];


collimation_block(position=[15, 0, 3.5], exc_axis_x=10);