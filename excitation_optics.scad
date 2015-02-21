
module collimation_lens
// radiospare P/N AC050-008-A-ML
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
    phi_ext=9.2, //9.2,
    height_ext=6.4,
    back_focal_length=5.2,
)
{
    translate(source_position)
	translate([0, 0, back_focal_length])
	cylinder(r=phi_ext/2, h=height_ext, center=false, $fn=100);
}

module excitation_mirror
// thorlabs P/N MRA05-E02
(
    optical_center=[0, 0, 0],
    width=5,
    height=5,
    angle=45,
)
{
    color([0.5, 0.5, 0.5])
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

module cylindrical_lens
// thorlabs P/N LJ1918L1-A
// NOTES/SPECIFICATIONS:
// 1.DESIGN WAVELENGTH: 587.6nm
// 2.FOCAL LENGTH: f=5.79mm ± 1%
// 3.BACK FOCAL LENGTH(REF): bf=4.0mm
// 4.CLEAR APERTURE: >90% OF SURFACE LENGTH AND HEIGHT
// 5.SURFACE QUALITY: 60-40 SCRATCH-DIG
// 6.CENTRATION: ≤ 5arcmin
// 7.LENGTH AND HEIGHT TOLERANCE: +0.0/-0.1mm
// 8.THICKNESS TOLERANCE: ±0.1mm
// 9.SURFACE ACCURACY:
// POWER = 1 FRINGE (S1), 3 FRINGES (S2)
// IRREGULARITY = λ/4 (S1), λ (S2 H), λ/cm (S2 L)
// 10.COATING: BBAR Ravg<0.5% FROM 350nm-700nm,
//   0 AOI, ON OUTER OPTICAL SURFACES
(
    height=4.0,
    length=6.0,
    rect_thick=2.0,
    tot_thick=2.8,
    radius=3.0,
    back_focal_length=4.0,
)
{
    cyl_thick = tot_thick - rect_thick;
    color([0., 0., 0.3, 0.5])
    translate([back_focal_length, 0, 0])
    intersection()
    {
	translate([tot_thick/2, 0, 0])
	cube([tot_thick, length, height], center=true);
	translate([tot_thick-radius, 0, 0])
	{
	    rotate([90, 0, 0])
	    cylinder(r=radius, h=length, center=true, $fn=100);
	}
    }
}


module excitation_filter
// edmund optics P/N 48-632
(
    diameter=12,
    thickness=2.5
)
{
    color([0.1, 0.2, 0.8, 0.5])
    cylinder(r=diameter/2, h=thickness, $fn=100);
}