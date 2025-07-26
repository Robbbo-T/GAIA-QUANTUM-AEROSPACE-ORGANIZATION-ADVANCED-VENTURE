
"""

from __future__ import annotations


from textwrap import dedent

from .mapper import CadParameters


def generate_step(parameters: CadParameters) -> str:

        FILE_SCHEMA(('AUTOMOTIVE_DESIGN {{ 1 0 10303 214 1 1 1 1 }}'));
        ENDSEC;
        DATA;"""
    )

    fuselage = parameters.fuselage
    wing = parameters.wing
    data_section = dedent(

        #1 = PRODUCT('AMPEL360E','Synthetic','',(#2));
        #2 = PRODUCT_CONTEXT('',#3,'mechanical');
        #3 = APPLICATION_CONTEXT('design');
        #10 = ADVANCED_BREP_SHAPE_REPRESENTATION('',(),#900);
        #900 = ( GEOMETRIC_REPRESENTATION_CONTEXT(3) GLOBAL_UNIT_ASSIGNED_CONTEXT((#901)) REPRESENTATION_CONTEXT('Context #1','3D') );
        #901 = ( LENGTH_UNIT() NAMED_UNIT() SI_UNIT(.MILLI.,.METRE.) );
        /* Parameters: length={fuselage.length}, diameter={fuselage.max_diameter}, blend={fuselage.blending_factor}, sweep={wing.sweep_angle} */
        ENDSEC;
        END-ISO-10303-21;"""
    )
    return header + "\n" + data_section

