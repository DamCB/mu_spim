module imaging_lens
// radiospare P/N AC050-008-A-ML
// DESIGN WAVELENGTHS: 486.1nm, 587.6, AND 656.3nm
// FOCAL LENGTH: 7.5mm 1%
// BACK FOCAL LENGTH (REF): 5.2mm
// LENS DIAMETER: 5.0mm +0.00/-0.10mm
// LENS CENTER THICKNESS: 4.5mm
// CLEAR APERTURE: >90% OF LENS DIAMETER
// SURFACE QUALITY: 40-20 SCRATCH-DIG
// CENTRATION: ≤3 arcmin (less than a 1e-3 radian
// COATING: BBAR Ravg <0.5% FROM 400-700nm
// 0 AOI, ON BOTH OPTICAL SURFACES
(
    source_position=[0, 0, 0],
    phi_ext=9.2, //9.2,
    height_ext=6.4,
    back_focal_length=5.2,
)
{
    translate(source_position)
	translate([0, 0, back_focal_length])
	cylinder(r=phi_ext/2, h=height_ext, center=false, $fn=100);
}


module collection_filter
// edmund optics P/N 48-632
(
    diameter=12,
    thickness=2.5
)
{
    color([0.1, 0.2, 0.8, 0.5])
    cylinder(r=diameter/2, h=thickness, $fn=100);
}
