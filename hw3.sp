HW3.sp kuhnw

V1  1 0 dc 0 ac 1
r1  1 2 1
l1  2 3 1u
c1  3 0 2n

*.options keepopinfo
.control
  set hcopydevtype=postscript

* uncomment next three lines to plot colors on white background
  set hcopypscolor=true
  set color0=rgb:f/f/f
  set color1=rgb:0/0/0

ac dec 100 1 20MEG
plot I(V1)
let rin = v(1)/i(v1)
plot db(rin)

*plot to .ps file nodes tline_input and tline_output every 1ns for 45ns
  *hardcopy tline_plot.ps V(tline_input) V(tline_output) xl 1ns 45ns
  *hardcopy hw3.ps vdb(Ri) vp(Ri)
  hardcopy hw3.ps db(v(1)/i(v1))


.endc

.end
