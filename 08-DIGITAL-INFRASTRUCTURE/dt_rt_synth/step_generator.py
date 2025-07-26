"""
STEP File Generator for AMPEL360E Digital Twin
----------------------------------------------

Produces simplified ISO-10303-21 STEP representations based on
current CAD parameters. This module uses a textual placeholder
approach suitable for integration testing when the full OCC kernel
is unavailable.
"""

from __future__ import annotations

from datetime import datetime
from textwrap import dedent

from .mapper import CadParameters


def generate_step(parameters: CadParameters) -> str:
    """Generate a minimal STEP string from parameters."""

    header = dedent(
        f"""\
        ISO-10303-21;
        HEADER;
        FILE_DESCRIPTION(('AMPEL360E Synthetic Model'),'2;1');
        FILE_NAME('ampel360e.step','{datetime.utcnow().isoformat()}',('GAIA-QAO'),('GAIA-QAO'), 'Python', 'DT-RT-SYNTH','');
        FILE_SCHEMA(('AUTOMOTIVE_DESIGN {{ 1 0 10303 214 1 1 1 1 }}'));
        ENDSEC;
        DATA;"""
    )

    fuselage = parameters.fuselage
    wing = parameters.wing
    data_section = dedent(
        f"""\
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

