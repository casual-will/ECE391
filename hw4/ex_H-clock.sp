H-clock tree ngspice skeleton code
*
*
.include o_buffer_soic.inc      ; output buffer embedded in 14-pin soic package
.include input_struct_soic.inc  ; input buffer embedded in 14-pin soic package

*power supply   
VDD VDD_pin 0 3.3
VSS VSS_pin 0 0

*input source to drive the output buffer
Vin input_pin 0 3.3 PULSE(0 3.3 5e-9 100p 100p 20e-9 40e-9)

*instantiate the soic14 package and output buffer 
X_test_buffer input_pin buffer_o_pin VDD_pin VSS_pin o_buffer_soic

*instantiate the soic14 package input buffer
X_test_in_buffer tline_out in_buffer_out VDD_pin VSS_pin input_struct_soic

*Transmission line connected to the buffer output and input buffer 
t1 buffer_o_pin  0  tline_out 0 z0=50 td=1ns

.control
  set asknoquit
  op
  tran 1ns 50ns
  set hcopydevtype=postscript
  set hcopypscolor=true
  set color0=rgb:f/f/f
  set color1=rgb:0/0/0
  plot V(buffer_o_pin) V(tline_out)  xl 0ns 50ns
.endc

.end

