Simple T-line
*A backbone line with multiple taps off of it.
*Each tap has a CMOS load hanging off of it.

.include input_struct.inc

*dummy power supply
Vdd vdd 0 3.3

*input source with 5ns delay, 500pS edges, 20ns pulse width, 41ns cycle time
Vin vin 0 3.3 PULSE(0 3.3 5e-9 500p 500p 20e-9 41e-9)

*source output impedance 
rsrc vin  tl_in    14 

*the backbone transmission line, 35 ohm, 2ns electrical length
t1 tl_in   0 junct0  0  z0=35 td=0.5ns
t2 junct0  0 junct1  0  z0=35 td=0.5ns
t3 junct1  0 junct2  0  z0=35 td=0.5ns
t4 junct2  0 tl_out  0  z0=35 td=0.5ns

*the loads hang off the junction of the backbone line
*.SUBCKT input_struct  vin pair_output e_vdd e_vss
xinput_struct1  junct0 junct0_out  vdd  0  input_struct
xinput_struct2  junct1 junct1_out  vdd  0  input_struct
xinput_struct3  junct2 junct2_out  vdd  0  input_struct
xinput_struct4  tl_out tl_out_out  vdd  0  input_struct

*possible termination scenarios
*parallel termaination at end of T-line
*rload tl_out 0 75  

*AC termaination at end of T-line
*rload tl_out tie 40  
*cload tie    0 100p

*Thevenin termaination at end of T-line
*rload1 tl_out   0  82  
*rload2 tl_out vdd  82 

.control
  op
  tran 100ps 40ns
  plot  V(tl_in) V(junct0) V(junct1) V(junct2) V(tl_out) xl 1ns 40ns
.endc

.end

