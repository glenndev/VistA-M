PSDCOR3 ;BIR/JPW-CS Correction Action (cont'd) ; 22 May 93
 ;;3.0; CONTROLLED SUBSTANCES ;**66**;13 Feb 97;Build 3
COM ;complete correction
 S CPBYD=+$P(NODE,"^",19)
 F  L +^PSD(58.87,0):$S($G(DILOCKTM)>0:DILOCKTM,1:3) I  Q
FIND S PSDCOR=$P(^PSD(58.87,0),"^",3)+1 I $D(^PSD(58.87,PSDCOR)) S $P(^PSD(58.87,0),"^",3)=PSDCOR G FIND
 K DA,DIC,DLAYGO S (DIC,DLAYGO)=58.87,DIC(0)="L",X=PSDCOR D ^DIC K DIC,DLAYGO
 L -^PSD(58.87,0)
 K DA,DIE,DR S DIE=58.87,DA=PSDCOR,DR="1////"_RECDT_";2////"_PSDUZ_";3////"_PSDPN_";4////"_PSDR_";5////"_NAOU_";7////"_CPBYD_";8////"_ORD_";9////"_CPBY_";11////"_TYPE_";12////"_PSDS_";13////"_OCOMP_";14////"_COMP
 D ^DIE K DA,DIE,DR
END K CPBY,CPBYD,PSDCOR
 Q
