# Dataloop test @ Vivado

## quick start
* clone this repo
* open vivado tcl shell
* cd repo path
* source ./tcl/dataloop_prjgen.tcl
* run simulation

## module overview
* |Datasource|  ----- |Datatx|-----|Datarx|

## function describe
* generate 8bit data @50MHz, send 1bit data @400MHz,recieve 1bit data @400MHz and recover the data.
