# -*- coding: utf-8 -*-

def get_phone_cst():

    constants = moto_G4G_cst()
    constants['cam_to_led_dist'] = (
        constants['detector_pos'][0] -
        constants['source_pos'][0]
        )
    return constants


def moto_G4G_cst():

    constants = {
        #/ Phone is assumed to be in portrait mode
        # phone outisde dimensions
        'length': 136, # x axis
        'width': 68,  # y axis
        'thikness': 10,
        'col_aperture_dia': 8, # estimated
        'exc_aperture_dia': 8,
        # detector and source position with respect to
        # phone face upper right corner (screen-side)
        'detector_pos': [25, 34, 10],
        #
        'source_pos': [39, 34, 10],
        }

    return constants


def smsg_nexus_cst():

    constants = {
        #/ Phone is assumed to be in portrait mode
        # phone outisde dimensions
        'phone_length': 141.5,      # x axis
        'phone_width': 70.7,  # y axis
        'phone_thikness': 11,
        'phone_back_z': 21, # distance of phone back from the focal point
        'phone_aperture_diameter': 10, # estimated
        'phone_excitation_diameter': 5,
        # detector and source position with respect to
        # phone face upper right corner
        'detector_pos':[22.75, 35.35, 11],
        #
        'source_pos':[37.75, 35.35, 11],
        }
    return constants
