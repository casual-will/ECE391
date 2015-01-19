Multidrop line with long stubs
*A backbone line with nasty stubs hanging off of it
*Stubs are made from high-Z lines (90 ohms) that are 200ps long (long!).
*There are three branch taps each with loads plus the end with a load.
*

.include input_struct.inc

*dummy power supply
Vdd vdd 0 3.3

*input source with 5ns delay, 500pS edges, 20ns pulse width, 41ns cycle time
Vin vin 0 3.3 PULSE(0 3.3 5e-9 500p 500p 20e-9 41e-9)

*source output impedance 
rsrc vin  tl_in  14 

*the transmission line backbone, 50 ohm, 2ns electrical length
*total length is about 1ft
t1 tl_in   0  junct0  0  z0=50 td=0.5ns
t2 junct0  0  junct1  0  z0=50 td=0.5ns
t3 junct1  0  junct2  0  z0=50 td=0.5ns
t4 junct2  0  tl_out  0  z0=50 td=0.5ns

*the transmission line stubs, 50 ohm, 0.2ns electrical length each
*2 inch stubs
ts1 junct0  0 br0  0  z0=90 td=0.15ns
ts2 junct1  0 br1  0  z0=90 td=0.15ns
ts3 junct2  0 br2  0  z0=90 td=0.15ns

*the buffer inputs 
*.SUBCKT input_struct  vin pair_output e_vdd e_vss
xinput_struct1  br0     br0_out     vdd  0  input_struct
xinput_struct2  br1     br1_out     vdd  0  input_struct
xinput_struct3  br2     br2_out     vdd  0  input_struct
xinput_struct4  tl_out  tl_out_out  vdd  0  input_struct

*parallel termaination at end of T-line
*rload tl_out 0 70  

*AC termaination 
*load br0   tie 80  
*load tie    0 100p

*load br1   tie1 80  
*load tie1    0 100p

*Thevenin termaination at end of T-line
rload1 tl_out 0   82  
rload2 tl_out vdd 82 

.control
  op
  tran 100ps 40ns
  plot  V(tl_in) V(br0) V(br1) V(br2) V(tl_out) xl 1ns 40ns
.endc

.end

