T line with and without standing waves 

*example (a)
*terminated 75 ohm line will show no standing waves. 
*Vin vin 0 ac 1.0 sin
*vsamplei  vin tie 0
*rsrc  tie  tl_in  75
*t1 tl_in 0 tl_out 0 z0=75 td=1u
*rload tl_out 0 75       

*example (b)
*unterminated (1e7) 75 ohm line will show standing waves. 
Vin vin 0 ac 1.0 sin
vsample  vin tie 0
rsrc  tie  tl_in  75
t1 tl_in 0 tl_out 0 z0=75 td=1u
rload tl_out 0 1e7      

*example (c)
*unterminated (0.01 ohm) 75 ohm line will show standing waves. 
*Vin vin 0 ac 1.0 sin
*rsrc  vin  tl_in  75
*t1 tl_in 0 tl_out 0 z0=75 td=1u
*rload tl_out 0 0.01     

*example (d)
*terminated (75 ohm at end point) line will not show standing waves. 
*Vin vin 0 ac 1.0 sin
*rsrc  vin  tl_in  0.01
*vsrc  vin  tl_in  0.001
*t1 tl_in 0 tl_out 0 z0=75 td=1u
*rload tl_out 0 75       

.control
 set hcopydevtype=postscript
* set hcopydev=kec3112-clr
 set hcopypscolor=true
 set color0=rgb:f/f/f
 set color1=rgb:0/0/0
 ac lin 1000 1m 2Meg 

*normal plot
 plot vm(vin) vm(tl_in) vm(vin,tl_in)  vm(tl_out)

*plot for resistance, won't work
*plot Vm(tl_in)/(Vm(vin,tl_in)/75)

*plot (Vm(vin,tl_in)/75)
*plot Vm(tl_in)

*plot Vm(tl_in)  Vm(vin,tl_in)/75
*plot VM(tl_in)  IM(vsample)

* plot (V(tline_input)/I(vsample)) xl 1ns 20ns


* plot  I(vsrc) 
* hardcopy temp.ps vm(vin) vm(tl_in) vm(vin,tl_in) vm(tl_out) 
.endc

.end

