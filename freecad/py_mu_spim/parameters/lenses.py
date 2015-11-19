# -*- coding: utf-8 -*-


def get_col_translation():

    constants = get_constants_f75()
    z_shift = (constants['focal_length'] -
               constants['center_thickness'] +
               constants['back_focal_length'])

    return z_shift



def get_constants_f75():
    '''
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
    '''

    constants = {
        'meta':'radiospare P/N AC050-008-A-ML',
        'focal_length': 7.5,
        'back_focal_length': 5.2,
        'diameter': 5.,
        'center_thickness': 4.5,
        'apperture': 0.9 * 5.,
        }

    return constants
