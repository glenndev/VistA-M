FHOMRO2 ;Hines OIFO/RTK CHECK MEAL WINDOW TIMES,FILE OP EVENTS ;2/04/03  14:05
 ;;5.5;DIETETICS;**5**;Jan 28, 2005;Build 53
 ;
 ; IF TIME (NOW) IS PAST MEAL SELECTED WINDOW DISPLAY MSG; SKIP TODAY
 ; IF TIME (NOW) IS WITHIN THE MEAL WINDOW (SEE FHORD1A) ASK "DO YOU
 ;   WANT TO ORDER A LATE TRAY" IF YES, LET THEM; IF NO SKIP TODAY
CHK1 ; Check if meal is past for today
 S X=FHTODAY D H^%DTC S FHK=$E("XMTWRFS",%Y+1) I FHDAYS'[FHK Q
 D VARS
 I FHMEAL="B",FHTIME>$P(FHWIND2,U,2) D MSG Q
 I FHMEAL="N",FHTIME>$P(FHWIND2,U,4) D MSG Q
 I FHMEAL="E",FHTIME>$P(FHWIND2,U,6) D MSG Q
 Q
CHK2 ; Check if late tray needs to be ordered
 S X=FHTODAY D H^%DTC S FHK=$E("XMTWRFS",%Y+1) I FHDAYS'[FHK Q
 D VARS
 I FHMEAL="B",FHTIME>$P(FHWIND2,U,1),FHTIME<$P(FHWIND2,U,2) D LATE
 I FHMEAL="N",FHTIME>$P(FHWIND2,U,3),FHTIME<$P(FHWIND2,U,4) D LATE
 I FHMEAL="E",FHTIME>$P(FHWIND2,U,5),FHTIME<$P(FHWIND2,U,6) D LATE
 Q
VARS ;
 S FHWIND1=$G(^FH(119.73,FHCOMM,1)),FHWIND2=$G(^FH(119.73,FHCOMM,2))
 D NOW^%DTC S FHTIME=$E($P(%,".",2),1,4)
 S MLTX=$S(FHMEAL="B":"breakfast",FHMEAL="N":"noon",1:"evening"),SKIP=0
 Q
SMGM ;entry point for Special/Guest meals
 S FHWIND1=$G(^FH(119.73,FHCOMM,1)),FHWIND2=$G(^FH(119.73,FHCOMM,2))
 D NOW^%DTC S FHTIME=$E($P(%,".",2),1,4)
 S MLTX=$S(FHMEAL="B":"breakfast",FHMEAL="N":"noon",1:"evening"),SKIP=0
 I FHMEAL="B",FHTIME>$P(FHWIND2,U,2) D MSG Q
 I FHMEAL="N",FHTIME>$P(FHWIND2,U,4) D MSG Q
 I FHMEAL="E",FHTIME>$P(FHWIND2,U,6) D MSG Q
 I FHMEAL="B",FHTIME>$P(FHWIND2,U,1),FHTIME<$P(FHWIND2,U,2) D LATE
 I FHMEAL="N",FHTIME>$P(FHWIND2,U,3),FHTIME<$P(FHWIND2,U,4) D LATE
 I FHMEAL="E",FHTIME>$P(FHWIND2,U,5),FHTIME<$P(FHWIND2,U,6) D LATE
 Q
MSG ;
 W !!,"The ",MLTX," window has passed for today!  Not ordered for today."
 D SKIP Q
LATE ;
 I $G(FHGML)=1 Q
 W !,"You have missed the ",MLTX," cut-off."
 K DIR S DIR("A")="Do you wish to order a LATE TRAY for today? (Y/N): "
 S DIR(0)="YA",DIR("B")="Y" D ^DIR
 I $D(DIRUT) D SKIP Q
 S FHLATE=Y I FHLATE'=1 D SKIP Q
 S FHLTFLG=1
 Q
SKIP ;
 S SKIP=1,X1=STDT,X2=1 D C^%DTC S STDT=X ;add (skip) a day to Start Date
 Q
 ;
 ; Entry points for filing Outpatient Dietetic Events
SETSM ; Set specific variables for SM Events then call SETORX
 S FHDIET=$P(FHZN,U,4),FHLOC=$P(FHZN,U,3),FHMEAL=$P(FHZN,U,9)
 D SETORX Q
SETGM ; Set specific variables for GM Events then call SETORX
 S FHDIET=$P(FHZN,U,6),FHLOC=$P(FHZN,U,5),FHMEAL=$P(FHZN,U,3)
 D SETORX Q
SETAET ; Set specific variables for RM AO, E/L, TF Events then do SETORX
 S FHZN=$G(^FHPT(FHDFN,"OP",+FHRNUM,0)),FHDIET=$P(FHZN,U,2)
 S FHLOC=$P(FHZN,U,3),FHMEAL=$P(FHZN,U,4)
 I $G(FHC) S FHOPDT=$P(FHLIST(FHC),U,2) D SETORX Q
 S FHOPDT=FHRMDT
SETORX ; Set variables for RM Events and call FHORX
 I $G(FHOPDT)'="" S FHOPDT=$P($$FMTE^XLFDT(FHOPDT,"P"),",",1)
 K FHTXT S (FHDDISP,FHLDSP)=""
 I FHDIET'="" S FHDDISP=$P($G(^FH(111,FHDIET,0)),U,1)
 I FHLOC'="" S FHLDSP=$P($G(^FH(119.6,FHLOC,0)),U,1)
 S FHMLDSP=$S(FHMEAL="B":"Breakfast",FHMEAL="N":"Noon",1:"Evening")
 S FHFROMD=$O(ODAYS("")),FHFROMD=$P($$FMTE^XLFDT(FHFROMD,"P"),",",1)
 S FHTOD=$O(ODAYS(""),-1),FHTOD=$P($$FMTE^XLFDT(FHTOD,"P"),",",1)
 S FHOPTY2="Outpatient "_$S(FHOPTY="R":"Recurring Meal",FHOPTY="S":"Special Meal",FHOPTY="G":"Guest Meal",FHOPTY="I":"Isolation/Precaution",FHOPTY="A":"Add. Order",FHOPTY="E":"E/L Tray",1:"TF")
 S FHACT2=$S(FHACT="O":": ",1:" cancelled: ") I FHOPTY="S" S FHACT2=$S(FHSTAT="A":" authorized: ",FHSTAT="D":" denied: ",1:FHACT2)
 S FHTXT=FHOPTY2_FHACT2_FHDDISP_", "_FHLDSP_", "_FHMLDSP
 I FHOPTY="R",FHACT="O" D DAYS S FHTXT=FHTXT_", "_FHDAZ_", "_FHFROMD_"-"_FHTOD D OPFILE^FHORX Q
 S FHTXT=FHTXT_", "_$G(FHOPDT) I $G(FHAET)'="" S FHTXT=FHTXT_", "_FHAET
 I FHOPTY="I" S FHTXT=$P(FHTXT,":",1)_": "_FHIP
 D OPFILE^FHORX Q
DAYS ; External display of Days
 S FHDAZ="" F A=1:1:7 S B=$E(FHDAYS,A) Q:B=""  S FHDAZ=FHDAZ_$S(B="M":"Mon",B="T":"Tue",B="W":"Wed",B="R":"Thu",B="F":"Fri",B="S":"Sat",1:"Sun")_"/"
 S FHDAZ=$E(FHDAZ,1,$L(FHDAZ)-1)
 Q
SOSFFP ;Add diet (pattern) associated SO's, SF's, FP's for outpatients
 S FHDPT=FHDPATT F ZZZ=1:1:4 I $L(FHDPT,"^")<5 S FHDPT=FHDPT_"^"
 S FHSTADT="",FHDPIEN=$O(^FH(111.1,"AB",FHDPT,0)) I FHDPIEN="" Q
 F FHOPB=FHNOW:0 S FHOPB=$O(^FHPT(FHDFN,"OP","B",FHOPB)) Q:FHOPB'>0  D
 .I FHSTADT="" S DTP=FHOPB D DTP^FH S FHSTADT=DTP
 .F FHOPN=0:0 S FHOPN=$O(^FHPT(FHDFN,"OP","B",FHOPB,FHOPN)) Q:FHOPN'>0  D
 ..S FHZN=$G(^FHPT(FHDFN,"OP",FHOPN,0)) I $P(FHZN,U,15)="C" Q
 ..I $P(FHZN,U,2)'=$P(FHDPT,U,1),$P(FHZN,U,7,11)'=FHDPT Q  ;check dietpat
 ..D NOW^%DTC S FHNNN=%,FHYES="Y"
 ..D SOSET,SFSET,FPSET Q
 Q
SOSET ;Diet related SO's
 F FHMLSO="BS","NS","ES" D
 .F FHSO=0:0 S FHSO=$O(^FH(111.1,FHDPIEN,FHMLSO,FHSO)) Q:FHSO'>0  D
 ..S FHQ=0,FHSOZN=$G(^FH(111.1,FHDPIEN,FHMLSO,FHSO,0))
 ..S FHSIEN=$P(FHSOZN,U,1),FHSQTY=$P(FHSOZN,U,2),FHMLZ=$P(FHZN,U,4)
 ..F FHX=0:0 S FHX=$O(^FHPT(FHDFN,"OP",FHOPN,"SP",FHX)) Q:FHX'>0  D
 ...I $P($G(^FHPT(FHDFN,"OP",FHOPN,"SP",FHX,0)),U,2)=FHSIEN,$P($G(^FHPT(FHDFN,"OP",FHOPN,"SP",FHX,0)),U,9)="Y" S FHQ=1
 ..I FHQ=1 Q
 ..I $P(FHZN,U,4)'=$E(FHMLSO,1) Q  ;check for meal
 ..K DIC,DO S DA(2)=FHDFN,DA(1)=FHOPN
 ..S DIC="^FHPT("_DA(2)_",""OP"","_DA(1)_",""SP"","
 ..S DIC(0)="L",DIC("P")=$P(^DD(115.016,26,0),U,2)
 ..S X=$P($G(^FHPT(FHDFN,"OP",FHOPN,"SP",0)),U,3)+1
 ..D FILE^DICN I Y=-1 Q
 ..K DIE S DA(2)=FHDFN,DA(1)=FHOPN,(DA,FHI)=+Y
 ..S DIE="^FHPT("_DA(2)_",""OP"","_DA(1)_",""SP"","
 ..S DR="1////^S X=FHSIEN;2////^S X=FHMLZ;3////^S X=FHNNN;4////^S X=DUZ;7////^S X=FHSQTY;8////^S X=FHYES"
 ..D ^DIE
 ..S FHSOO(FHI,FHSIEN)=FHSQTY,FHCNSOF=1
 Q
SFSET ;Diet related SF's
 S FHSF=$P($G(^FH(111.1,FHDPIEN,0)),U,8) I FHSF="" Q
 L +^FHPT(FHDFN,"OP",FHOPN,"SF",0)
 I '$D(^FHPT(FHDFN,"OP",FHOPN,"SF",0)) S ^FHPT(FHDFN,"OP",FHOPN,"SF",0)="^115.1627^^"
 S FHX=^FHPT(FHDFN,"OP",FHOPN,"SF",0),FHN3=+$P(FHX,"^",3),FHNO=FHN3+1
 I $P($G(^FHPT(FHDFN,"OP",FHOPN,"SF",FHN3,0)),U,5,28)=$P($G(^FH(118.1,FHSF,1)),U,1,24) Q  ;don't add duplicate
 S ^FHPT(FHDFN,"OP",FHOPN,"SF",0)=$P(FHX,U,1,2)_"^"_FHNO_"^"_($P(FHX,"^",4)+1)
 L -^FHPT(FHDFN,"OP",FHOPN,"SF",0)
 S FHPNO=$G(^FH(118.1,+FHSF,1)) Q:FHPNO=""
 S FHPNN="^"_FHNNN_"^"_DUZ_"^"_FHSF_"^"_FHPNO
 S ^FHPT(FHDFN,"OP",FHOPN,"SF",FHNO,0)=FHNO_"^"_$P(FHPNN,"^",2,99)
 I FHN3,$D(^FHPT(FHDFN,"OP",FHOPN,"SF",FHN3,0)),'$P(^FHPT(FHDFN,"OP",FHOPN,"SF",FHN3,0),U,32) D
 .S $P(^FHPT(FHDFN,"OP",FHOPN,"SF",FHN3,0),"^",32,33)=FHNNN_"^"_DUZ
 S:FHNO $P(^FHPT(FHDFN,"OP",FHOPN,"SF",FHNO,0),"^",30,31)=FHNNN_"^"_DUZ
 S:FHNO $P(^FHPT(FHDFN,"OP",FHOPN,"SF",FHNO,0),"^",34)="Y"
 S FHADSFF=1,FHSFMEN=$P($G(^FH(118.1,+FHSF,0)),U,1)
 Q
FPSET ;Diet related FP's
 F FHFP=0:0 S FHFP=$O(^FH(111.1,FHDPIEN,"RES",FHFP)) Q:FHFP'>0  D
 .S DPAT=FHDPIEN D UPD^FHMTK7
 Q
KILL ;kill variables from FHOMRO1
 K A,AA,AB,CCC,CONT,ENDL,ENDT,FHDFN,FHDAYS,FHDEF,FHDIET,FHDIETS
 K FHDIETX1,FHDIETX2,FHDIETX3,FHDIETX4,FHDIETX5,FHEXST,FHIFLG,FHLOC
 K FHMPNUM,FHSMYES,FHYIEN,FHZ,FLAG,J,FHMEAL,MLT,ODAYS,SPDIETS,STDT,DFN
 K FHSO,FHSOO,FHDAT,FHSODAT,NUM,FHSOI,FHSOQ,FHSOCN,FHPRML,FHPRCN
 K BID,P,LS,LN,SP,NO,DR,DIC,DIR,FHSERV,FHSF1,OCXTSPI,PNN,SKIP,STDTMP
 K FHZ,FHBID,FHSSN,FHDI,FHDIETX,FHDX,FHRMDT,FHMEAL,FHD0,FHDI,FHCK,FHJ
 K EX,FHDIETP,FHDNM,FHDPTR,FHDTRLE,FHLIST,FHLOCZN,FHLPT,FHNODE,FHRM,FHI
 K FHSF10,FHSF2,FHSF8,FHSFDAT,FHSRV,FHSRVPT,FHTZ,FHTZCNT,FHTZSO,FHTZSO2
 K FHTZSO6,FHTZSO8,FHTZSOCN,FHTZSOL,FHTZSON,FHZDA,FHNNN
 K FHAGE,FHCOMM,FHCUT,FHD3,FHD4,FHDOB,FHMAX,FHMSG1,FHMSGML,FHNOW,FHOSTDT
 K FHOUT,FHPCZN,FHPTNM,FHSEX,FHTODAY,FHZ115,FILE,IEN,IEN200,FHODNM
 K J,K,N1,PID,PREC,FHI,FHACT,FHACT2,FHADSFF,FHALML,FHCNSOF,FHDAZ,FHDDISP
 K FHDOW,FHDTC,FHDTM,FHDTP,FHDUR,FHFROMD,FHK,FHLDSP,FHLOCN,FHLTFLG
 K FHMLDSP,FHMPN,FHNMSAV,FHODAYS,FHTYPE,FHWIND1,FHWIND2,FHX,MLTX,N,NOW
 K FHOENDT,FHOLOC,FHOLOCNM,FHOMEAL,FHOPTY,FHOPTY2,FHORN,FHPREVML,FHRNM
 K FHRNUM,FHSETFLG,FHSF,FHSFCX,FHSFMEN,FHTDTMP,FHTIME,FHTOD,FHTXT,FHTYP
 K L,OCXSEG,ORDNUM,ORPC,ORVARY,PAD,PCE,SF,ADM,FH1,FHOTDAY,FILL,M,MEAL
 Q