PXAICPT ;ISL/JVS,ISA/KWP,ESW,SCK - SET THE PROCEDURE(CPT) NODES ;8/10/04 4:39pm
 ;;1.0;PCE PATIENT CARE ENCOUNTER;**19,73,108,112,149,124,164,194**;Aug 12, 1996;Build 2
 ;
 ;
 Q
CPT ;--CREAT PROVIDERS
 ;
 ;
SET ;--SET AND NEW VARIABLES
 N AFTER0,AFTER1,AFTER12,AFTER801,AFTER802,AFTER811,AFTER812
 N BEFOR0,BEFOR1,BEFOR12,BEFOR801,BEFOR802,BEFOR811,BEFOR812
 N PXAA,PXAB,SUB,PIECE,PXAAX,IENB,STOP
 ;New Modifier Variables
 D SET^PXAIMOD
 K PXAERR
 S PXAERR(8)=PXAK
 S PXAERR(7)="PROCEDURE"
 ;
 S SUB="" F  S SUB=$O(@PXADATA@("PROCEDURE",PXAK,SUB)) Q:SUB=""  D
 .S PXAA(SUB)=$G(@PXADATA@("PROCEDURE",PXAK,SUB))
 ;Setup PXAA array for Modifiers
 S SUB=""
 F  S SUB=$O(@PXADATA@("PROCEDURE",PXAK,"MODIFIERS",SUB)) Q:SUB=""  D
 .S PXAA("MODIFIERS",SUB)=""
 ;
VAL ;--VALIDATE ENOUGH DATA
 D VAL^PXAICPTV Q:$G(STOP)
 ;
 ;
SETVARA ;--SET VISIT VARIABLES
 S $P(AFTER0,"^",1)=$G(PXAA("PROCEDURE"))
 I $G(PXAA("DELETE")) S $P(AFTER0,"^",1)="@"
 S $P(AFTER0,"^",2)=$G(PATIENT)
 S $P(AFTER0,"^",3)=$G(PXAVISIT)
 S $P(AFTER0,"^",4)=$G(PXAA("NARRATIVE")) D
 .I $G(PXAA("NARRATIVE"))']""!($L($G(PXAA("NARRATIVE")))>245) D
 ..S $P(AFTER0,"^",4)=$P($$CPT^ICPTCOD($G(PXAA("PROCEDURE")),$G(IDATE)),"^",3) ;-- TEXT OF NARRATIVE
 .I $G(PXAA("NARRATIVE"))]"" S $P(AFTER0,"^",4)=+$$PROVNARR^PXAPI($G(PXAA("NARRATIVE")),9000010.18)
 I $P(AFTER0,"^",4)<0 D VAL04^PXAICPTV,ERR^PXAI Q:$D(STOP)
 S $P(AFTER0,"^",5)=$G(PXAA("DIAGNOSIS"))
 ;PX*1*124 - add dx
 S $P(AFTER0,"^",9)=$G(PXAA("DIAGNOSIS 2"))
 S $P(AFTER0,"^",10)=$G(PXAA("DIAGNOSIS 3"))
 S $P(AFTER0,"^",11)=$G(PXAA("DIAGNOSIS 4"))
 S $P(AFTER0,"^",12)=$G(PXAA("DIAGNOSIS 5"))
 S $P(AFTER0,"^",13)=$G(PXAA("DIAGNOSIS 6"))
 S $P(AFTER0,"^",14)=$G(PXAA("DIAGNOSIS 7"))
 S $P(AFTER0,"^",15)=$G(PXAA("DIAGNOSIS 8"))
 I $G(PXAA("QTY"))="" S PXAA("QTY")=1
 S $P(AFTER0,"^",16)=$G(PXAA("QTY")) I $G(PXAA("QTY"))<1 S PXAA("DELETE")=1
 S $P(AFTER0,"^",17)=$G(PXAA("ORD REFERENCE"))
 I $$SWSTAT^IBBAPI() D  ;PX*1.0*164
 . S $P(AFTER0,"^",19)=$G(PXAA("DEPARTMENT"))
 . I $P(AFTER0,"^",19)="",$G(^AUPNVSIT(PXAVISIT,0)),$P(^AUPNVSIT(PXAVISIT,0),"^",8) S $P(AFTER0,"^",19)=$P($G(^DIC(40.7,$P(^AUPNVSIT(PXAVISIT,0),"^",8),0)),"^",2)
 ;Set Modifier nodes in AFTER1
 D SETVARA^PXAIMOD
 ;
 S $P(AFTER12,"^",1)=$G(PXAA("EVENT D/T"))
 ;PX*1*124 - add ord prv
 S $P(AFTER12,"^",2)=$G(PXAA("ORD PROVIDER"))
 S $P(AFTER12,"^",4)=$G(PXAA("ENC PROVIDER"))
 ;PX*1*108 - do not try to file a provider from a "DELETED" cpt
 I $G(PXAA("ENC PROVIDER"))]"",'$G(PXAA("DELETE")) D
 .S ^TMP("PXAIADDPRV",$J,$G(PXAA("ENC PROVIDER")))=""
 ;PX*1*124 - do not try to file a provider from a "DELETED" cpt
 I $G(PXAA("ORD PROVIDER"))]"",'$G(PXAA("DELETE")) D
 .S ^TMP("PXAIADDPRV",$J,$G(PXAA("ORD PROVIDER")))=""
 ;
 S $P(AFTER802,"^",1)=$G(PXAA("CATEGORY"))
 I $G(PXAA("CATEGORY"))]"" S $P(AFTER802,"^",1)=+$$PROVNARR^PXAPI($G(PXAA("CATEGORY")),9000010.18)
 I $P(AFTER802,"^",1)<0 D VAL45^PXAICPTV,ERR^PXAI Q:$D(STOP)
 S $P(AFTER811,"^",1)=$G(PXAA("COMMENT"))
 ;
 ;
 ;
 ;--PACKAGE AND SOURCE
 ;
 S $P(AFTER812,"^",2)=$G(PXAPKG)
 S $P(AFTER812,"^",3)=$G(PXASOURC)
 ;
SETPXKA ;--SET PXK ARRAY AFTER
 S ^TMP("PXK",$J,"CPT",PXAK,0,"AFTER")=AFTER0
 ;Set ^TMP("PXK",$J,"CPT",PXAK,1,ien,"AFTER")=MODIEN
 D SETPXKA^PXAIMOD
 S ^TMP("PXK",$J,"CPT",PXAK,12,"AFTER")=AFTER12
 S ^TMP("PXK",$J,"CPT",PXAK,802,"AFTER")=AFTER802
 S ^TMP("PXK",$J,"CPT",PXAK,811,"AFTER")=AFTER811
 S ^TMP("PXK",$J,"CPT",PXAK,812,"AFTER")=AFTER812
 ;
SETVARB ;--SET VARIABLES BEFORE
 D
 .N PXBKY,PXBSAM,PXBSKY,PXBCNT,PXI,PRV,ITEM,PXICPT
 .D CPT^PXBGCPT(PXAVISIT)
 .;S PXAAX("PROCEDURE")=$P($G(^ICPT($G(PXAA("PROCEDURE")),0)),"^",1)
 .S PXICPT=$$CPT^ICPTCOD($G(PXAA("PROCEDURE")))
 .S PXAAX("PROCEDURE")=$S(+PXICPT>0:$P(PXICPT,"^",2),1:"")
 .;I $G(PXAA("DELETE"))=1 S PXAAX("PROCEDURE")=$P($G(^ICPT($G(PXAA("PROCEDURE")),0)),"^",1)
 .I $G(PXAA("DELETE"))=1 S PXAAX("PROCEDURE")=$S(+PXICPT>0:$P(PXICPT,"^",2),1:"")
 .S ITEM=""
 .I PXBCNT>0,$G(PXAAX("PROCEDURE"))]"" S ITEM=$O(PXBKY(PXAAX("PROCEDURE"),0))
 .I ITEM]"" D
 ..;--LOOK UP USING CPT AND PROVIDER
 ..S PXI="" F  S PXI=$O(PXBKY(PXAAX("PROCEDURE"),PXI)) Q:PXI=""  D
 ...I $D(^IBE(357.69,PXAAX("PROCEDURE"))) D  Q  ;DBIA #: 1906
 ....S (^TMP("PXK",$J,"CPT",PXAK,"IEN"),IENB)=$O(PXBSKY(PXI,0))
 ...I $G(PXAA("ENC PROVIDER")) D  Q
 ....S PRV=$P(^VA(200,$G(PXAA("ENC PROVIDER")),0),"^",1)
 ....I $P($G(PXBKY(PXAAX("PROCEDURE"),PXI)),"^",3)=PRV D
 .....S (^TMP("PXK",$J,"CPT",PXAK,"IEN"),IENB)=$O(PXBSKY(PXI,0))
 I $G(IENB) D
 .F PIECE=0,12,802,811,812 S ^TMP("PXK",$J,"CPT",PXAK,PIECE,"BEFORE")=$G(^AUPNVCPT(IENB,PIECE))
 .;Set ^TMP("PXK",$J,"CPT",PXAK,1,ien,"BEFORE")=MODIEN
 .D SETVARB^PXAIMOD
 E  D
 .S (BEFOR0,BEFOR12,BEFOR802,BEFOR811,BEFOR812)=""
 .;
SETPXKB .;--SET PXK ARRAY BEFORE
 .S ^TMP("PXK",$J,"CPT",PXAK,0,"BEFORE")=BEFOR0
 .;Set ^TMP("PXK",$J,"CPT",PXAK,1,ien,"BEFORE")=MODIEN
 .D SETPXKB^PXAIMOD
 .S ^TMP("PXK",$J,"CPT",PXAK,12,"BEFORE")=BEFOR12
 .S ^TMP("PXK",$J,"CPT",PXAK,802,"BEFORE")=BEFOR802
 .S ^TMP("PXK",$J,"CPT",PXAK,811,"BEFORE")=BEFOR811
 .S ^TMP("PXK",$J,"CPT",PXAK,812,"BEFORE")=BEFOR812
 .S ^TMP("PXK",$J,"CPT",PXAK,"IEN")=""
 ;
MISC ;--MISCELLANEOUS NODE
 ;
 Q