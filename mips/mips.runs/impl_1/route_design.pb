
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a35t2default:defaultZ17-349h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2w
cPartially locked IO Bus is found. Following components of the IO Bus an[3:0] are not locked:  an[3]2default:defaultZ23-20h px? 
?
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2?
lPartially locked IO Bus is found. Following components of the IO Bus btn[4:0] are not locked:  btn[3] btn[2]2default:defaultZ23-20h px? 
?
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2?
zPartially locked IO Bus is found. Following components of the IO Bus cat[6:0] are not locked:  cat[4] cat[3] cat[1] cat[0]2default:defaultZ23-20h px? 
?
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2?
?Partially locked IO Bus is found. Following components of the IO Bus led[15:0] are not locked:  led[14] led[13] led[10] led[9] led[8] led[5] led[4] led[3] led[2] led[1]2default:defaultZ23-20h px? 
?
Rule violation (%s) %s - %s
20*drc2
PLIO-32default:default2B
.Placement Constraints Check for IO constraints2default:default2?
?Partially locked IO Bus is found. Following components of the IO Bus sw[15:0] are not locked:  sw[12] sw[10] sw[7] sw[6] sw[4] sw[3] sw[2]2default:defaultZ23-20h px? 
b
DRC finished with %s
79*	vivadotcl2(
0 Errors, 5 Warnings2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
y
BMultithreading enabled for route_design using a maximum of %s CPUs97*route2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
C
.Phase 1 Build RT Design | Checksum: 1221c4806
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:17 ; elapsed = 00:00:16 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
B
-Phase 2.1 Create Timer | Checksum: 1221c4806
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 1221c4806
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 1221c4806
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.4 Update Timing | Checksum: 20aeab410
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=4.487  | TNS=0.000  | WHS=-0.117 | THS=-1.048 |
2default:defaultZ35-416h px? 
I
4Phase 2 Router Initialization | Checksum: 1dc915b85
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
C
.Phase 3 Initial Routing | Checksum: 146481962
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:16 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
4.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 4.1.1 Update Timing | Checksum: 13008fdef
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=4.355  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 16961d6f5
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 16961d6f5
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 16961d6f5
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 16961d6f5
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 16961d6f5
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 6.1.1 Update Timing | Checksum: 1d59033a3
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=4.434  | TNS=0.000  | WHS=0.135  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 1d59033a3
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 1d59033a3
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 1583ad22d
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 1583ad22d
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 1c411d9cf
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
?
Estimated Timing Summary %s
57*route2J
6| WNS=4.434  | TNS=0.000  | WHS=0.135  | THS=0.000  |
2default:defaultZ35-57h px? 
?
?The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px? 
G
2Phase 10 Post Router Timing | Checksum: 1c411d9cf
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
=
Router Completed Successfully
16*routeZ35-16h px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:18 ; elapsed = 00:00:17 . Memory (MB): peak = 1115.422 ; gain = 118.0822default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
522default:default2
102default:default2
252default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:192default:default2
00:00:172default:default2
1115.4222default:default2
118.0822default:defaultZ17-268h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:012default:default2 
00:00:00.0652default:default2
1115.4222default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2K
7D:/VivadoProjects/mips/mips.runs/impl_1/lab4_routed.dcp2default:defaultZ17-1381h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
;D:/VivadoProjects/mips/mips.runs/impl_1/lab4_drc_routed.rpt;D:/VivadoProjects/mips/mips.runs/impl_1/lab4_drc_routed.rpt2default:default8Z2-168h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
GD:/VivadoProjects/mips/mips.runs/impl_1/lab4_methodology_drc_routed.rptGD:/VivadoProjects/mips/mips.runs/impl_1/lab4_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
?
Command: %s
53*	vivadotcl2x
dreport_power -file lab4_power_routed.rpt -pb lab4_power_summary_routed.pb -rpx lab4_power_routed.rpx2default:defaultZ4-113h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
622default:default2
102default:default2
252default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 


End Record