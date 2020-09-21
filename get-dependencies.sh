#!/bin/bash
# go to upper folder
cd ../ &&\
# clone mechanical testing
git clone git@gitlab.cc-asp.fraunhofer.de:mat-info/ontology/mechanical-testing.git &&\
cd mechanical-testing   &&\
git checkout master &&\
cd ../ &&\
# imports of dependencies
git clone git@gitlab.cc-asp.fraunhofer.de:mat-info/ontology/geometrical_shapes.git
git clone git@gitlab.cc-asp.fraunhofer.de:mat-info/ontology/materials-composition.git
git clone git@gitlab.cc-asp.fraunhofer.de:mat-info/ontology/emmo-units.git
git clone git@gitlab.cc-asp.fraunhofer.de:mat-info/ontology/emmo-20200109.git
#
cd mechanical-testing/ &&\
exit 0

