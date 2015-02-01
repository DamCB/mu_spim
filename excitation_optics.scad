
module collimation_lens
// DESIGN WAVELENGTHS: 486.1nm, 587.6, AND 656.3nm
// FOCAL LENGTH: 7.5mm 1%
// BACK FOCAL LENGTH (REF): 5.2mm
// LENS DIAMETER: 5.0mm +0.00/-0.10mm
// LENS CENTER THICKNESS: 4.5mm
// CLEAR APERTURE: >90% OF LENS DIAMETER
// SURFACE QUALITY: 40-20 SCRATCH-DIG
// CENTRATION: ≤3 arcmin
// COATING: BBAR Ravg <0.5% FROM 400-700nm
// 0 AOI, ON BOTH OPTICAL SURFACES
(
    source_position=[0, 0, 0],
    phi_ext=18.4, //9.2,
    height_ext=6.4,
    back_focal_length=5.2,
)
{
    translate(source_position)
	translate([0, 0, back_focal_length])
	cylinder(d=phi_ext, h=height_ext, center=false, $fn=100);
}

module excitation_mirror
(
    optical_center=[0, 0, 0],
    width=5,
    height=5,
    angle=45,
)
{
    translate(optical_center)
    {
	mirror([1, 0, 0])
	difference()
	{
	    cube(size=[width, width, width], center=true);
	    rotate([0, angle, 0]) translate([width*0.707, 0, 0])
	    cube(size=[width*1.42, width*1.42, width*1.42], center=true);
	}
    }
}
