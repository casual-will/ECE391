Simple T-line (example.sp)
*source terminated at Z0

*PULSE source parameters
*            initial   pulse   delay  trise  tfall  pulse  period
*             value    value                        width
*     PULSE(    0       1.0    2e-9    10p    10p   40e-9  81e-9)

*3.3v square wave source; 5ns delay, 100pS edges, 20ns pulse width, 40ns cycle time
Vin vin 0 3.3 PULSE(0 3.3 5e-9 100p 100p 20e-9 40e-9)

*source output impedance
rsrc vin tline_input 20

*transmission line, 50 ohm, 2ns electrical length
t1 tline_input 0 tline_output 0 z0=50 td=2ns

*10K termaination at end of T-line
rload tline_output 0  10000 

.control
  set hcopydevtype=postscript

* color0 is background color
* color1 is the grid and text color
* colors 2-15 are for the vectors if you want to specify them
* uncomment next three lines to plot colors on white background
  set hcopypscolor=true
  set color0=rgb:f/f/f
  set color1=rgb:0/0/0

* to print the results directly to a printer uncomment the following line
* set hcopydev=kec3112

* run DC operating point simulation first
  op

*run transient simulation for 40ns with timesteps of 100ps
  tran 100ps 40ns

*plot nodes tline_input and tline_output every 1ns for 45ns
  plot  V(tline_input) V(tline_output) xl 1ns 45ns

*plot to .ps file nodes tline_input and tline_output every 1ns for 45ns
  hardcopy tline_plot.ps V(tline_input) V(tline_output) xl 1ns 45ns

.endc

.end
