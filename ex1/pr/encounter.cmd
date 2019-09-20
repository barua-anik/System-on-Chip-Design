#######################################################
#                                                     #
#  Encounter Command Logging File                     #
#  Created on Tue Apr 12 13:41:07 2016                #
#                                                     #
#######################################################

#@(#)CDS: Encounter v13.13-s017_1 (64bit) 07/30/2013 13:03 (Linux 2.6)
#@(#)CDS: NanoRoute v13.13-s005 NR130716-1135/13_10-UB (database version 2.30, 190.4.1) {superthreading v1.19}
#@(#)CDS: CeltIC v13.13-s001_1 (64bit) 07/19/2013 04:50:05 (Linux 2.6.18-194.el5)
#@(#)CDS: AAE 13.13-e003 (64bit) 07/30/2013 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 13.13-s004_1 (64bit) Jul 30 2013 05:44:27 (Linux 2.6.18-194.el5)
#@(#)CDS: CPE v13.13-s001
#@(#)CDS: IQRC/TQRC 12.1.1-s225 (64bit) Wed Jun 12 20:28:41 PDT 2013 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_gnd_net GND
set init_lef_file {/tech/umc/faraday/Core/fsd0a_a/2007Q1v1.7/GENERIC_CORE_1D2V/BackEnd/lef/header8m026_V55.lef /tech/umc/faraday/Core/fsd0a_a/2007Q1v1.7/GENERIC_CORE_1D2V/BackEnd/lef/fsd0a_a_generic_core.lef}
set init_verilog netlist_syn.v
set init_pwr_net VCC
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site core -r 0.9 0.7 5 5 5 5
uiSetTool select
getIoFlowFlag
fit
saveDesign counter.enc
windowSelect 5.234 16.616 4.823 16.513
clearGlobalNets
globalNetConnect GND -type net -net GND -module {}
globalNetConnect GND -type net -net GND -module {}
globalNetConnect VCC -type pgpin -pin VCC -inst * -module {}
globalNetConnect VCC -type pgpin -pin VCC -inst * -module {}
globalNetConnect VCC -type tiehi -pin VCC -inst * -module {}
globalNetConnect GND -type tielo -pin GND -inst * -module {}
clearGlobalNets
globalNetConnect GND -type net -net GND -module {}
globalNetConnect GND -type net -net GND -module {}
globalNetConnect VCC -type pgpin -pin VCC -inst * -module {}
globalNetConnect VCC -type pgpin -pin VCC -inst * -module {}
globalNetConnect VCC -type tiehi -pin VCC -inst * -module {}
globalNetConnect GND -type tielo -pin GND -inst * -module {}
clearGlobalNets
globalNetConnect VCC -type pgpin -pin VCC -inst * -module {}
globalNetConnect GND -type pgpin -pin GND -inst * -module {}
globalNetConnect VCC -type tiehi -pin VCC -inst * -module {}
globalNetConnect GND -type tielo -pin GND -inst * -module {}
globalNetConnect VCC -type net -net VCC -module {}
globalNetConnect GND -type net -net GND -module {}
clearGlobalNets
globalNetConnect VCC -type pgpin -pin VCC -inst * -module {}
globalNetConnect GND -type pgpin -pin GND -inst * -module {}
globalNetConnect VCC -type tiehi -pin VCC -inst * -module {}
globalNetConnect GND -type tielo -pin GND -inst * -module {}
globalNetConnect VCC -type net -net VCC -module {}
globalNetConnect GND -type net -net GND -module {}
clearGlobalNets
globalNetConnect VCC -type pgpin -pin VCC -inst * -module {}
globalNetConnect GND -type pgpin -pin GND -inst * -module {}
globalNetConnect VCC -type tiehi -pin VCC -inst * -module {}
globalNetConnect GND -type tielo -pin GND -inst * -module {}
globalNetConnect VCC -type net -net VCC -module {}
globalNetConnect GND -type net -net GND -module {}
clearGlobalNets
globalNetConnect VCC -type pgpin -pin VCC -inst * -module {}
globalNetConnect GND -type pgpin -pin GND -inst * -module {}
globalNetConnect VCC -type tiehi -pin VCC -inst * -module {}
globalNetConnect GND -type tielo -pin GND -inst * -module {}
globalNetConnect VCC -type net -net VCC -module {}
globalNetConnect GND -type net -net GND -module {}
clearGlobalNets
globalNetConnect VCC -type pgpin -pin VCC -inst * -module {}
globalNetConnect GND -type pgpin -pin GND -inst * -module {}
globalNetConnect VCC -type tiehi -pin VCC -inst * -module {}
globalNetConnect GND -type tielo -pin GND -inst * -module {}
globalNetConnect VCC -type net -net VCC -module {}
globalNetConnect GND -type net -net GND -module {}
set sprCreateIeRingNets {}
set sprCreateIeRingLayers {}
set sprCreateIeRingWidth 1.0
set sprCreateIeRingSpacing 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
addRing -center 1 -stacked_via_top_layer metal7 -around core -jog_distance 0.28 -threshold 0.28 -nets {GND VCC} -stacked_via_bottom_layer metal7 -layer {bottom metal1 top metal1 right metal2 left metal2} -width 0.28 -spacing {bottom 0.12 top 0.12 right 0.14 left 0.14} -offset 0.28
addRing -use_wire_group_bits 2 -center 1 -stacked_via_top_layer metal7 -use_wire_group 1 -around core -jog_distance 0.28 -threshold 0.28 -nets {GND VCC} -stacked_via_bottom_layer metal7 -layer {bottom metal1 top metal1 right metal2 left metal2} -width 0.28 -spacing 0.8 -offset 0.28
set sprCreateIeStripeNets {}
set sprCreateIeStripeLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeSpacing 2.0
set sprCreateIeStripeThreshold 1.0
addStripe -use_wire_group_bits 2 -block_ring_top_layer_limit metal8 -max_same_layer_jog_length 0.56 -padcore_ring_bottom_layer_limit metal7 -number_of_sets 3 -use_interleaving_wire_group 1 -stacked_via_top_layer metal8 -use_wire_group 1 -padcore_ring_top_layer_limit metal8 -spacing 0.8 -xleft_offset 3 -xright_offset 3 -merge_stripes_value 0.28 -layer metal8 -block_ring_bottom_layer_limit metal7 -width 0.28 -nets {GND VCC} -stacked_via_bottom_layer metal1
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { metal1 metal8 } -blockPinTarget { nearestRingStripe nearestTarget } -padPinPortConnect { allPort oneGeom } -stripeSCpinTarget { blockring padring ring stripe ringpin blockpin } -checkAlignedSecondaryPin 1 -blockPin useLef -allowJogging 1 -crossoverViaBottomLayer metal1 -allowLayerChange 1 -targetViaTopLayer metal8 -crossoverViaTopLayer metal8 -targetViaBottomLayer metal1 -nets { GND VCC }
setPlaceMode -fp false
placeDesign -prePlaceOpt
clockDesign -specFile {} -outDir clock_report -fixedInstBeforeCTS
saveDesign counter.enc
saveDesign counter.enc
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
getFillerMode -quiet
addFiller -cell FILLER1 FILLER2 FILLER3 -prefix FILLER
addMetalFill -layer { metal1 metal2 metal3 metal4 metal5 metal6 metal7 metal8 } -nets { GND VCC }
saveDesign counter.enc
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000 -warning 50
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
saveNetlist counter.v
extractRC
rcOut -setload counter.setload
rcOut -setres counter.setres
rcOut -spf counter.spf
rcOut -spef counter.spef
all_hold_analysis_views 
all_setup_analysis_views 
write_sdf  -ideal_clock_network counter.sdf
write_sdf  -ideal_clock_network layout.sdf
streamOut layout.gds -mapFile /tech/umc/faraday/Core/fsd0a_a/2007Q1v1.7/GENERIC_CORE_1D2V/TECH/milkyway/gdsOutLayer_1p8m026.map -libName DesignLib -units 1000 -mode ALL
saveDesign counter.enc
saveDesign counter.enc
