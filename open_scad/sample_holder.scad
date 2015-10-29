/*---------------------------------------------------------\
|     From: Ekobots Innovation Ltda - www.ekobots.com      |
|       by: Juan Sirgado y Antico - www.jsya.com.br        |
|----------------------------------------------------------|
|         Program Gear Cylinder Tooth - 2014/10/08         |
|               All rights reserved 2014                   |
|---------------------------------------------------------*/
num_teeth_internal = 12;


num_teeth_external = 15;

module gear
()
{
difference()
{
    translate([2.15, 0, 0])
    {
	rotate([0, 0, 180/num_teeth_internal])
	gear_external(num_teeth=num_teeth_internal);
    }
    translate([-0.2, 0, 0])
    {
	cylinder(gear_height+0.2,
            0.3,
            0.3,center=true,$fn=36);
    }
}

gear_internal(num_teeth=num_teeth_external,
              gear_diameter=30);
}


//---------------------------------------------------------|
module gear_external
(
  // gear parameters
  num_teeth=30,      // number of teeth
  tooth_diameter=2,  //tooth diameter
  tooth_clear=0.15,  // tooth clear
  tooth_deep=0.15,   // tooth deep
  gear_height=5,     // gear height
  // central hole parameters
  hole_diameter=6   // diameter of central hole
)
{
   // gear values
   tooth_radius = tooth_diameter/2;                 // tooth radius
   hole_radius = hole_diameter/2;                   // hole radius
   tooth_distance = tooth_diameter+tooth_clear;     // tooth distance
   gear_radius=(tooth_distance*num_teeth)/3.141592; // gear ray
   tooth_angle=360/num_teeth;                       // tooth rotation
   tooth_end=360-tooth_angle+0.1; // (round error)  // tooth end
   cylinder_faces=36;                               // cylinder faces
   // gear rendering
   difference()
   {
      union()
      {
         cylinder(gear_height,
                  gear_radius,
                  gear_radius,center=true,$fn=cylinder_faces);
         for(gear_angle=[0:tooth_angle:tooth_end])
         {
            rotate([0,0,gear_angle]) translate([gear_radius,0,0])
            {
               cylinder(gear_height,
                        tooth_radius,
                        tooth_radius,center=true,$fn=cylinder_faces);
            }
         }
      }
      for(gear_angle=[0:tooth_angle:tooth_end])
      {
         rotate([0,0,gear_angle+(tooth_angle/2)])
            {
            translate([gear_radius-tooth_deep,0,0])
               cylinder(gear_height+0.2,
                        tooth_radius+tooth_clear,
                        tooth_radius+tooth_clear,center=true,$fn=cylinder_faces);
            translate([gear_radius,0,0])
               cube([tooth_deep*2,
                     (tooth_radius+tooth_clear)*2,
                     gear_height+0.2],center=true);
            }
      }
      // central hole
      cylinder(gear_height+0.2,
               hole_radius,
               hole_radius,center=true,$fn=cylinder_faces);
   }
}



//---------------------------------------------------------|
module gear_internal
(
  // gear parameters
  num_teeth=60,     // number of teeth
  tooth_diameter=2,   // tooth diameter
  tooth_clear=0.15, // tooth clear
  tooth_deep=0.15,  // tooth deep
  gear_height=5,    // gear height
  gear_diameter=30,      // gear diameter
  // central hole parameters
  num_hole=4,       // number of holes
  hole_diameter=2       // hole diameter
)
{
   // gear values
   tooth_distance = tooth_diameter+tooth_clear;     // tooth distance
   gear_radius=(tooth_distance*num_teeth)/3.141592; // gear ray
   tooth_angle=360/num_teeth;                       // tooth rotation
   tooth_end=360-tooth_angle;                       // tooth end
   tooth_radius=tooth_diameter/2;                   // tooth ray
   hole_angle=360/num_hole;                         // hole rotation
   hole_end=360-hole_angle+0.1; // (round error)    // hole end
   cylinder_faces=36;                               // cylinder faces
   // gear rendering
   difference()
   {
      union()
      {
         difference()
         {
            cylinder(gear_height,
                     gear_radius+gear_diameter,
                     gear_radius+gear_diameter,center=true,$fn=cylinder_faces);
            cylinder(gear_height+0.2,
                     gear_radius,
                     gear_radius,center=true,$fn=cylinder_faces);
         }
         for(gear_angle=[0:tooth_angle:tooth_end])
         {
            rotate([0,0,gear_angle]) translate([gear_radius,0,0])
            {
               cylinder(gear_height,
                        tooth_radius,
                        tooth_radius,center=true,$fn=cylinder_faces);
            }
         }
      }
      for(gear_angle=[0:tooth_angle:tooth_end])
      {
         rotate([0,0,gear_angle+(tooth_angle/2)])
            {
            translate([gear_radius+tooth_deep,0,0])
               cylinder(gear_height+0.2,
                        tooth_radius+tooth_clear,
                        tooth_radius+tooth_clear,center=true,$fn=cylinder_faces);
            translate([gear_radius,0,0])
               cube([tooth_deep*2,
                     (tooth_radius+tooth_clear)*2,
                     gear_height+0.2],center=true);
            }
      }
      // for(gear_angle=[0:hole_angle:hole_end]) // holes
      // {
      //    rotate([0,0,gear_angle])
      //    {
      //       translate([gear_radius+(gear_diameter/2),0,0])
      //       cylinder(gear_height+0.2,
      //                hole_diameter,
      //                hole_diameter,center=true,$fn=cylinder_faces);
      //    }
      // }
   }
}
//---------------------------------------------------------|
