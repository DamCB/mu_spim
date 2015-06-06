use <phone.scad>;
use <excitation_optics.scad>;
use <collection_optics.scad>;
use <light_path.scad>;
use <chamber.scad>;
use <optic_blocks.scad>;
use <base.scad>;

// phone model = Samsung galaxy nexus -tm-
// portrait mode

focal_point = [0, 0, 0];
excitation_source = [14, 0, -24]; //estimated



module sample
(
  sample_pos = focal_point,
)
{translate(sample_pos) sphere(0.5, $fn=10);
}


// ** Excitation optics **
col_lens_BFL = 5.2;
filter_deport = 10;


collimation_lens(back_focal_length=col_lens_BFL,
                 source_position=excitation_source);

mirror_center = [excitation_source[0],
                 focal_point[1],
		 focal_point[2]];
excitation_mirror(optical_center=mirror_center);

translate([excitation_source[0]+2,
           focal_point[1],
	   focal_point[2] - filter_deport])
excitation_filter();

// cylindrical lens Back Focal Length
cyl_lens_BFL = 4.0;
cylindrical_lens(back_focal_length=cyl_lens_BFL);

//



// Imaging optics
im_lens_BFL=2;
imaging_lens(back_focal_length=im_lens_BFL);

translate([-2, 0, -filter_deport])
collection_filter();

excitation_beam(
    exc_waist=4., // collimated beam waist
    col_lens_BFL=col_lens_BFL, // colimation lens backfocal length
    excitation_source=excitation_source, // position of the excitation source
    cyl_lens_BFL=cyl_lens_BFL,
    mirror_center=mirror_center);

chamber_center=[-2., 0, 3.5];

//coverslips(chamber_center=chamber_center);

sample();
phone(phone_back_z=20);


whole_chamber(chamber_center=chamber_center);
sheet_focalisation();

base_block();
collimation_block();

// // carrenage
// //dimensions hors tout

// //color([0., 0., 0., 0.1])
// //translate([0, ])
// //rotate([0, 0, 90])
dt12xy();
optics_plate();