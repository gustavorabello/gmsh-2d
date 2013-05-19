#!/bin/bash

for i in 0*.geo; do
 gmsh -1 $i
done

# $Id: $


