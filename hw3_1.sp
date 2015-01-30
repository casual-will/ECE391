HW3_1.sp kuhnw

I1  0 1 dc 0 ac 1
r1  0 1 16
c1  0 1 500p
l1  0 1 2.5u

.control
  set hcopydevtype=postscript

* uncomment next three lines to plot colors on white background
  set hcopypscolor=true
  set color0=rgb:f/f/f
  set color1=rgb:0/0/0

ac dec 1000 1 20MEG
let rin=v(1)/1A
plot rin

*plot to .ps file nodes tline_input and tline_output every 1ns for 45ns
  *hardcopy tline_plot.ps V(tline_input) V(tline_output) xl 1ns 45ns
  hardcopy hw3_1.ps rin

.endc

.end
