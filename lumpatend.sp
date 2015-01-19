All loads lumped at the end  (lumpedatend.sp)
*
*All loads are lumped at the end of a 1ns T-line
*The loads are attached via short (1 inch) stubs and 
*are represented as CMOS inputs.
*
.include input_struct.inc

*dummy power supply
Vdd vdd 0 3.3

*input source with 5ns delay, 500pS edges, 20ns pulse width, 41ns cycle time
Vin vin 0 3.3 PULSE(0 3.3 5e-9 500p 500p 20e-9 41e-9)

*source output impedance 
rsrc vin  tl_in  24 

*the transmission line, 50 ohm, 1ns electrical length
t1 tl_in  0 tl_out 0  z0=35  td=1.0ns

*short stubs (~1") that go to each receiver 
t2 tl_out   0  stub1  0  z0=80 td=0.18ns
t3 tl_out   0  stub2  0  z0=80 td=0.18ns
t4 tl_out   0  stub3  0  z0=80 td=0.18ns
t5 tl_out   0  stub4  0  z0=80 td=0.18ns
t6 tl_out   0  stub5  0  z0=80 td=0.18ns
t7 tl_out   0  stub6  0  z0=80 td=0.18ns

*.SUBCKT input_struct  vin pair_output e_vdd e_vss
xinput_struct1  stub1  out1 vdd  0  input_struct
xinput_struct2  stub2  out2 vdd  0  input_struct
xinput_struct3  stub3  out3 vdd  0  input_struct
xinput_struct4  stub4  out4 vdd  0  input_struct
xinput_struct5  stub5  out5 vdd  0  input_struct
xinput_struct6  stub6  out6 vdd  0  input_struct

*possible load scenarios below
*parallel termaination at end of T-line
*rload1 stub1  0 150  
*rload2 stub2  0 150  
*rload3 stub3  0 150  
*rload4 stub4  0 150  
*rload5 stub5  0 150  
*rload6 stub6  0 150  

*AC termaination at end of T-line
*rload  tl_out  tie 35  
*cload  tie    0 100p

*Thevenin termaination at end of T-line
*rload1 tl_out 0   82  
*rload2 tl_out vdd 82 

.control
  op
  tran 100ps 40ns
  plot  V(tl_in)  V(stub1) V(stub2)  xl 1ns 40ns
.endc

.end

