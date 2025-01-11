.ALIASES
V_V1            V1(+=VCC -=0 ) CN @OPA2675.SCHEMATIC1(sch_1):INS121@SOURCE.VDC.Normal(chips)
V_V2            V2(+=VEE -=0 ) CN @OPA2675.SCHEMATIC1(sch_1):INS254@SOURCE.VDC.Normal(chips)
R_Rf            Rf(1=N00597 2=OUT ) CN @OPA2675.SCHEMATIC1(sch_1):INS565@ANALOG.R.Normal(chips)
R_Rg            Rg(1=0 2=N00597 ) CN @OPA2675.SCHEMATIC1(sch_1):INS581@ANALOG.R.Normal(chips)
R_Rl            Rl(1=0 2=OUT ) CN @OPA2675.SCHEMATIC1(sch_1):INS700@ANALOG.R.Normal(chips)
C_C1            C1(1=0 2=OUT ) CN @OPA2675.SCHEMATIC1(sch_1):INS725@ANALOG.C.Normal(chips)
V_V3            V3(+=N01029 -=0 ) CN @OPA2675.SCHEMATIC1(sch_1):INS990@SOURCE.VSIN.Normal(chips)
X_U1            U1(+=N01029 -=N00597 OUT=OUT Vs+=VCC Vs-=VEE PD=0 Ref=0 ) CN
+@OPA2675.SCHEMATIC1(sch_1):INS2709@OPA2675.OPA2675.Convert(chips)
_    _(Gnd=0)
_    _(OUT=OUT)
_    _(Vcc=VCC)
_    _(Vee=VEE)
.ENDALIASES
