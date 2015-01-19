Star T-line
*Six lines radiating from a central point
*Radial lines are set to a high impedance, 90 ohms.
*CMOS input loads are at the end of each arm.
*Note that the driver is not that low of a driving impedance.
*
.include input_struct.inc

*dummy power supply
Vdd vdd 0 3.3

*input source with 5ns delay, 500pS edges, 20ns pulse width, 41ns cycle time
Vin vin 0 3.3 PULSE(0 3.3 5e-9 500p 500p 20e-9 41e-9)

*source output impedance (like AC244) 
rsrc vin  tl_in   14

*the transmission line backbone, 90 ohm, 0.5ns electrical length
t1 tl_in   0  star1  0  z0=90 td=0.5ns
t2 tl_in   0  star2  0  z0=90 td=0.5ns
t3 tl_in   0  star3  0  z0=90 td=0.5ns
t4 tl_in   0  star4  0  z0=90 td=0.5ns
t5 tl_in   0  star5  0  z0=90 td=0.5ns
t6 tl_in   0  star6  0  z0=90 td=0.5ns

*the buffer input loads
*.SUBCKT input_struct  vin pair_output e_vdd e_vss
xinput_struct1  star1  star1_out  vdd  0  input_struct
xinput_struct2  star2  star2_out  vdd  0  input_struct
xinput_struct3  star3  star3_out  vdd  0  input_struct
xinput_struct4  star4  star4_out  vdd  0  input_struct
xinput_struct5  star5  star5_out  vdd  0  input_struct
xinput_struct6  star6  star6_out  vdd  0  input_struct

*possible termination sceanrios
*parallel termainations at end of T-line
*rload1 star1  0 120 
*rload2 star2  0 120 
*rload3 star3  0 120 
*rload4 star4  0 120 
*rload5 star5  0 120 
*rload6 star6  0 120 

*AC termaination at end of T-line
*rload tl_out tie 40  
*cload tie    0 100p

*Thevenin termaination at end of T-line
*rload1 tl_out 0   82  
*rload2 tl_out vdd 82 

.control
  op
  tran 100ps 40ns
  plot  V(tl_in) V(star1) V(star2) V(star3) V(star4) xl 1ns 40ns
.endc

.end

