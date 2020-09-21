```mermaid
graph TD;
    mesomics_bending_test-- has_parameter_some --> Temperature;
    mesomics_bending_test-- has_parameter_some --> Humidity;
    
    
    
    mesomics_bending_test-- has_participant_some -->measurement_device;
    mesomics_bending_test-- has_participant_some -->bending_machine;
    mesomics_bending_test-- operates_on --> mesomics_specimen;

    Temperature -- has_value --> dfdff{a_number};
    Temperature -- has_unit --> untrrer{Kelvin};

    Humidity -- has_value --> a_number_sdsd{number} ;
    Humidity -- has_unit --> asdsad{Percent};

   
    mesomics_bending_test-- has_output_some --> mesomics_measurement;
    mesomics_measurement -- has_participant_some --> mesomics_measurement_data
    mesomics_measurement_data -- has_part_some --> mesomics_measurement_datum;

    mesomics_measurement_datum-- has_part_1 -->Time  ;
    Time -- has_part_1 --> num1{a_number};
    Time -- has_part_1 --> unit2{second};

    mesomics_measurement_datum-- has_part_1 -->Force  ;
    Force -- has_part_1 --> num2{a_number};
    Force -- has_part_1 --> unit3{Newton};


    mesomics_measurement_datum-- has_part_1 -->Displacement;
    Displacement -- has_part_1 --> num3{a_number};
    Displacement -- has_part_1 --> unit4{mm};

    mesomics_specimen -- has_part_1 --> cross_section;
    mesomics_specimen -- has_part_1 --> Length;

    Length -- has_part_1 --> num433{a_number};
    Length -- has_part_1 --> unitwfgg{Meter};
    cross_section -- has_part_1 --> num43{a_number};
    cross_section -- has_part_1 --> unitwgg{Meter};

    mesomics_specimen -- has_part_some --> taping_shape;

    mesomics_specimen -- has_part some --> material_specification;
    
    material_specification -- has_part_some --> label;
    material_specification -- has_part_some --> number;

    

    mesomics_bending_analysis -- has_input --> mesomics_measurement_data;
    mesomics_bending_analysis -- has_output --> bending_stiffness;

    bending_stiffness -- has_part_1 --> num4343{a_number};
    bending_stiffness -- has_part_1 --> unitwfegg{NewtonPerMeter};
```


```mermaid
graph TD;

subgraph materials

composition -- has_part_some --> material_specification;
composition -- has_part_some --> composition_measurement;
  
material_specification -- has_part_some --> label;

chemical_composition -- has_part --> iupac_element_name;
chemical_composition -- has_part --> a_number;
chemical_composition -- has_part --> a_unit;

composition_measurement -- has_output --> chemical_composition;
material_specification -- has_output_some --> chemical_composition;


part -- has_part --> material;
material--has_part--> composition;
end
```
```mermaid
graph TD;
subgraph states of the part
part -- has_direct_part --> part1_1[state1];
part -- has_direct_part --> part1_2[state2];
part -- has_direct_part --> part1_3[state3];
part -- has_direct_part --> part1_4[state4];
end

```

```mermaid
graph TD;
subgraph process

heating   -- operates_on --> part1_1[state1];
heating   -- produces    --> part1_2[state2];
quenching -- operates_on --> part1_2[state2];
quenching -- produces    --> part1_3[state3];
annealing -- operates_on --> part1_3[state3];
annealing -- produces    --> part1_4[state4];
end
```

```mermaid
graph TD;
subgraph process_parameters

heating -- has_parameter--> 123[temperature];
heating -- has_parameter--> sdöew8z32r[time];
sdöew8z32r -- has_part_1 --> num4343WEWEWE{a_number};
sdöew8z32r -- has_part_1 --> unitwfeggWEWE{minutes};
321 -- has_part_1 --> adfgdf{a_number};
321 -- has_part_1 --> dkdf{DegreeCelsius};

quenching -- has_parameter --> ssdsdd[temperature];
ssdsdd -- has_part_1 --> adkfgsdsddf{a_number};
ssdsdd -- has_part_1 --> dkfgsdsddf{DegreeCelsius};

annealing -- has parameter --> 321[temperature];
123 -- has_part_1 --> adkfgdf{a_number};
123 -- has_part_1 --> dkfgdf{DegreeCelsius};

annealing -- has_parameter--> sdsd[time];
sdsd -- has_part_1 --> lkehlehr{minutes};
sdsd -- has_part_1 --> lsdsdsdehr{a_number};

end

```

```mermaid
graph TD;
subgraph example of cutting a specimen process

specimen_cutting  -- has_parameter --> cutting_direction;

cutting_direction -- has_part --> sdöew8z32r[parallel _or_ perpendicular];

specimen_cutting -- operates on --> metal_sheet;

specimen_cutting -- produces --> sample;
end

```

```mermaid
graph TD;
subgraph example of hardness specification 

specimen  -- has_part--> shape;

shape  -- has_part --> edge;
edge -- hasProperty --> 121212212[hardness]; 
 121212212 -- has_part--> unit;
 121212212 -- has_part_-->value;

shape  -- has_part --> centre;
centre -- hasProperty --> 121212213[hardness]; 
 121212213 -- has_part--> 1[unit];
 121212213 -- has_part_-->2[value];

end

```

```mermaid
graph TD;
subgraph materials composition example 

specimen  -- has_part--> material;

material -- has_part --> material_description;

material_description -- has_value --> s1;
s1 -- is --> adsd;

end

```
# schema 

## options 1: everything on the metal_sheet (workpiece) directly. 

(indentation means an "has-a" relation except when "is" is explicitly mentioned-)

- workpiece has:        +
   - composition        +
   - properties         + 
     - hardness         +
       - is HV          +
       - is CHD         +
       - is edge_hardness +
       - is center_hardness +
     - roughness  +
       - is Rz  +
       - is RzRy5 +
       - is Surface_factor_Ko   +
     - residual_stress_edge     +
       - axial                  +
       - tangential              +
     - Young_Modulus_E            +
     - Yield_stress_0.2           +
     - Tensile_strength (Rm)      
     - Fracture_strain
   - Processing                   +  
     - annealing                   +
     - quenching_and_tempering    +
     - hardening                   +
       - is Martensitic_hardening +
       - is bainite_hardening..  +
       - surface hardening        +
         - is case_hardening      +
           - case_hardening_method  +
             - is low_pressure_cooling +
             - simple_hardening       +
             - direct_hardening       +
           - surface_hardening_method   +
             - Nitration      +
             - Nitocarbonation      +
             - induction_hardening  +
      - surface treatment           +
        - shot_peening              +
      - manufacturing_protocol      +
        - forging               +
        - rolling               +
         - rolling_direction    +
           - length              +
           - width              +
      - Description             +
        - text                  +
  - fatigue_test                +
    - fatigue_specimen          +
      - name                    +
      - shape                   +
        - is non_standard_shape +
          - is IWM_fatigue_probe_shape  +
            - is Karsch024  +
            - is Burkart2011   +
            - is Bomas1999   +
            - is Schumacher2012  +
            - is Russenberger   +
            - is Rundzugprobe_D6   +
            - is IWM_rundProbe_Umlaufkerb +
            - is IWM_rundprobe_zylindrechen_teil +
      - cross_section   +
        - shape   +
          - round   +
          - rectangular  +
      - length   + 
      - notch  +
        - length  +
        - radius  +
        - elastic_stress_concentration_factor_kt  +
      - sketch    + 
        - image  +  
          - png_file +
      - diameter  +
        - minimum_value +
        - maximum_value  +
      - width +
      - thickness +
    - loading +
      - tension_compression +
      - three_point_bending +
      - rotating_bending +
      - torsion  +
      - four_point_bending +
    - parameters +
      - stress_ratio (equiv. R_ratio) +   
      - frequency   +
      - temperature +
      - environment 
        - is air
      - max_load_cycles +  (use max load, has part number of cycles has part maximum_value) 
      - staircase_method +
      - applied  +  # one can add temperature etc under applied. 
        - stress  
          - minimum +
          - maximum + 
          - median +
          - amplitude +
    - result/product + 
      - cycles + 
        - see max_load_cycles
      - specimen + 
        - description 
          - rapture + 
          - failure + 
            - type +
              - volume + 
              - surface +
            - cause +
              - inclusion +
                - chemical_elements +
                - shape +
                  - rectangular +
                  - round +
                - morphology +
                  - branched +
                  - elongated +
              - pore +
            - origin_from_edge 
            - area +
            - residual_stress +
              - axial +
              - tangential +
        - description  +
        - 
      - 

 
