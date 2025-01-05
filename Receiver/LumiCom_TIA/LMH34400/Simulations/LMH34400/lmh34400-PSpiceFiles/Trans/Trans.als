.ALIASES
X_U1            U1(IN=N09523 +=VDD SD=0 alc=N09707 Gnd=0 OUT=N09651 ) CN
+@LMH34400.Trans(sch_1):INS9439@LMH34400.LMH34400.Normal(chips)
C_Cout          Cout(1=N09663 2=N09657 ) CN @LMH34400.Trans(sch_1):INS9579@ANALOG.C.Normal(chips)
C_CL            CL(1=N09669 2=0 ) CN @LMH34400.Trans(sch_1):INS9783@ANALOG.C.Normal(chips)
T_T3            T3(A+=N09663 A-=0 B+=N09669 B-=0 ) CN @LMH34400.Trans(sch_1):INS9527@ANALOG.T.Normal(chips)
T_T2            T2(A+=N09503 A-=0 B+=N09523 B-=0 ) CN @LMH34400.Trans(sch_1):INS9409@ANALOG.T.Normal(chips)
I_I1            I1(+=N09503 -=VPD ) CN @LMH34400.Trans(sch_1):INS9595@SOURCE.ISIN.Normal(chips)
V_V1            V1(+=N09707 -=0 ) CN @LMH34400.Trans(sch_1):INS9807@SOURCE.VDC.Normal(chips)
C_Cj            Cj(1=VPD 2=N09503 ) CN @LMH34400.Trans(sch_1):INS9623@ANALOG.C.Normal(chips)
V_Vdd           Vdd(+=VDD -=0 ) CN @LMH34400.Trans(sch_1):INS9319@SOURCE.VDC.Normal(chips)
R_Rout          Rout(1=N09657 2=N09651 ) CN @LMH34400.Trans(sch_1):INS9557@ANALOG.R.Normal(chips)
R_RL            RL(1=N09669 2=0 ) CN @LMH34400.Trans(sch_1):INS9761@ANALOG.R.Normal(chips)
C_Cj2           Cj2(1=VDD 2=0 ) CN @LMH34400.Trans(sch_1):INS9303@ANALOG.C.Normal(chips)
V_Vapd          Vapd(+=VPD -=0 ) CN @LMH34400.Trans(sch_1):INS9337@SOURCE.VDC.Normal(chips)
_    _(GND=0)
_    _(Vdd=VDD)
_    _(Vpd=VPD)
.ENDALIASES
