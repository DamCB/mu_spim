
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

sample();

phone(phone_back_z=20);

collimation_lens(source_position=excitation_source);

mirror_center = [excitation_source[0],
    focal_point[1],
    focal_point[2]];
excitation_mirror(optical_center=mirror_center);
