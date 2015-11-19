# -*- coding: utf-8 -*-
from phones import get_phone_cst
from lenses import get_col_translation

def get_optics_cst():

    constants = {
        # ## Principal coordinates
        "focal_point": [0, 0, 0],
        "phone_back_z": -25,
        "excitation_source_x": 10, # default
        # ## Collection optics
        }
    phone_cst = get_phone_cst()
    constants['excitation_source_x'] = phone_cst['cam_to_led_dist']
    return constants
