PSDAPU ;BIR/JPW-Mark/Unmark Drugs for CS Appl. Pkg. Use ; 8 Aug 94
 ;;3.0; CONTROLLED SUBSTANCES ;**2**;13 Feb 97
 S PSIUX="N^CONTROLLED SUBSTANCES"
 K DIC F  W ! S DIC=50,DIC("A")="Select DRUG: ",DIC(0)="QEAMZ" D ^DIC K DIC Q:Y<0  S PSIUDA=+Y D FLAG
END K DIC,DTOUT,DUOUT,PSIUA,PSIUDA,PSIUX,X,Y
 Q
FLAG ; flag drugs
 S X="PSSGIU" X ^%ZOSF("TEST") I $T D EN^PSSGIU Q
 D EN^PSGIU
 Q