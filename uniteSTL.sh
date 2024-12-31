#!/bin/bash

# name of the output file
TARGET=bending_elbow.stl
INLET_FLUID1=inlet1.stl
INLET_FLUID2=inlet2.stl
OUTLET_FLUID=outlet.stl
WALLS_FLUID=wall.stl
#BASE_FINS=inlet2.stl
#WALLS_HEATER=walls_heater.stl


[ -f $TARGET ] && rm $TARGET

# create an empty file name defined by TARGET
touch $TARGET

# find text solid and add name of the surface (here inlet_fluid)
sed -i '1 s/^.*$/solid inlet1/' $INLET_FLUID1
# add the modified file to target file
cat $INLET_FLUID1 >> $TARGET


# find text solid and add name of the surface (here inlet_fluid)
sed -i '1 s/^.*$/solid inlet2/' $INLET_FLUID2
# add the modified file to target file
cat $INLET_FLUID2 >> $TARGET


sed -i '1 s/^.*$/solid outlet/' $OUTLET_FLUID
cat $OUTLET_FLUID >> $TARGET

sed -i '1 s/^.*$/solid wall/' $WALLS_FLUID
cat $WALLS_FLUID >> $TARGET

#sed -i '1 s/^.*$/solid walls_heater/' $WALLS_HEATER
#cat $WALLS_HEATER >> $TARGET

#sed -i '1 s/^.*$/solid base_fins/' $BASE_FINS
#cat $BASE_FINS >> $TARGET
