Multibranched T line
*
*Ugly, multibranched T-line. One line branches into two lines.
*The branch lines have one load on one and two on the other line.
*
.include input_struct.inc

*dummy power supply
Vdd vdd 0 3.3

*input source with 5ns delay, 500pS edges, 20ns pulse width, 41ns cycle time
Vin vin 0 3.3 PULSE(0 3.3 5e-9 500p 500p 20e-9 41e-9)

*source output impedance 
rsrc vin  tl_in    14

*the transmission lines, 50 ohm, various electrical lengths
t1 tl_in   0 junct0  0  z0=50  td=0.5ns
t2 junct0  0 endpt1  0  z0=50  td=0.25ns
t3 junct0  0 endpt2  0  z0=50  td=0.4ns

*.SUBCKT input_struct  vin pair_output e_vdd e_vss
xinput_struct1  tl_in   out0  vdd  0  input_struct
xinput_struct2  junct0  out1  vdd  0  input_struct
xinput_struct3  endpt1  out2  vdd  0  input_struct
xinput_struct4  endpt2  out3  vdd  0  input_struct
xinput_struct5  endpt2  out4  vdd  0  input_struct


*possible scenarios for termination
*parallel termaination at end of T-line
*rload tl_out 0 75  

*AC termaination at end of T-line
*rload1 endpt1 tie1 70  
*cload1 tie1    0 100p

*rload2 endpt2 tie2 70  
*cload2 tie2    0 100p

*Thevenin termaination at end of T-line
*rload1 tl_out   0  82  
*rload2 tl_out vdd  82 

.control
  op
  tran 100ps 40ns
  plot  V(tl_in) V(junct0) V(endpt1) V(endpt2) xl 1ns 40ns
.endc

.end

