PRCHFPT1 ;WISC/RSD/RHD-CONT. OF PRINT ;5/1/98  15:59
 ;;5.1;IFCAP;**143**;Oct 20, 2000;Build 3
 ;Per VHA Directive 2004-038, this routine should not be modified.
 I $P($G(^PRC(442,D0,24)),U,3)="RMPR" D  K RMPRPO,RMPR664,RMPRR3
 . S RMPRPO=$P($P($G(^PRC(442,D0,0)),U),"-",2) Q:RMPRPO=""
 . S RMPR664=$O(^RMPR(664,"G",RMPRPO,0)) Q:RMPR664'>0
 . S RMPRR3=$G(^RMPR(664,RMPR664,3)) I $P(RMPRR3,U)="",$P(RMPRR3,U,4)="" Q
 . W !,"Prosthetics Delivery information:"
 . W !,?7,"Delivery To: ",$P(RMPRR3,U)
 . W !,?9,"Attention: ",$P(RMPRR3,U,4)
 . W ?96 F I=1:1:96 W @IOBS
 . W PRCHULN
 S Y=0 I PRCHDES="R",PRCHFPT,$D(^PRC(442,D0,11,PRCHFPT,0)),$P(^(0),U,12)]"" S X=^(0) D RR^PRCHFPT4
 D:'Y INV W !,"FOB POINT: ",$S("O"=$E($P(PRCH1,U,6)):"ORIGIN","D"=$E($P(PRCH1,U,6)):"DESTINATION",1:""),?34,"|","PROPOSAL: " S DIWL=1,DIWR=16,DIWF="",X=$P(PRCH1,U,8) K ^UTILITY($J,"W") D DIWP^PRCUTL($G(DA))
 K ^TMP($J,"W") S %X="^UTILITY($J,""W"",DIWL,",%Y="^TMP($J,""W"",DIWL," D %XY^%RCR
 W ?45,$G(^TMP($J,"W",1,1,0)),?64,"|",PRCHINV(1),!,"GOV'T BL #: ",$P(PRCH12,U,7),?34,"|",?45,$G(^TMP($J,"W",1,2,0)),?64,"|",PRCHINV(2)
 W !,$P(PRCH1,U,14) D TY W X,?34,"|",?45,$G(^TMP($J,"W",1,3,0)),?64,"|",PRCHINV(3)
 W !,"DELIVER ON/BEFORE " S Y=$P(PRCH0,U,10) D DT W ?34,"|","CONTRACT: "
 W ?64,"|",PRCHINV(4),!
 W "DISCOUNT TERM: " S PRCH=0 I $D(^PRC(442,D0,5,0)) F I=1:1:2 S PRCH=$O(^PRC(442,D0,5,PRCH)) Q:PRCH=""!(PRCH'>0)  W $P(^(PRCH,0),U,4),$P(^(0),U,1) W:$P(^(0),U,1)=+$P(^(0),U,1) "%" W $P(^(0),U,2)," "
 K Y S PRCH=0
 F I=1:1:3 S:PRCH'="" PRCH=$O(^PRC(442,D0,2,"AC",PRCH)) S:PRCH'="" Y=$O(^(PRCH,0)) W:I=2 "SHIP VIA: ",$P(PRCH12,U,8) W ?34,"|" W:$G(Y)'="" ?42,$S($D(^(Y)):$J(^(Y),3),1:"") W:PRCH'="" ?45,PRCH W ?64,"|" D  ; <<< rew
 .W:$D(PRCHINV(I+4)) PRCHINV(I+4) W ! K Y
 W $E(PRCHULN,1,34),"|",$E(PRCHULN,1,29),"|",$E(PRCHULN,1,31)
 W ! W:$G(PRCHTYPE)'="S" ?59,"UNIT" W ?69,"TOTAL" W:PRCHDES="R" ?80,"QTY",?90,"AMT"
 W !,"ITEM",?15,"DESCRIPTION" W:$G(PRCHTYPE)'="S" ?46,"QTY",?51,"UNIT",?59,"COST" W ?69,"COST"
 W:PRCHDES="R" ?80,"REC",?90,"REC" W ?96 F I=1:1:96 W @IOBS
 W PRCHULN K PRCHHSP,PRCHINV,PRCHSHP,PRCHST,S,V,^TMP($J,"P") S PRCHL=18,P=1,PRCH=0
 ;
CNTI S PRCH=$O(^PRC(442,D0,2,PRCH)) G:PRCH'>0 CNTD S LITEM=$G(^(PRCH,2)),PRCHLB=1,PRCHL1=$P(LITEM,U,4) S:$P(^(0),U,6)]"" PRCHL1=PRCHL1+1 S:$P(^(0),U,13)]"" PRCHL1=PRCHL1+1 S:$P(LITEM,U,9)]"" PRCHL1=PRCHL1+1 S:$P(LITEM,U,11)]"" PRCHL1=PRCHL1+1
 S:$P($G(^PRC(442,D0,2,PRCH,2)),U,9)]""!($P($G(^(2)),U,11)]"") PRCHL1=PRCHL1+3 S:$P($G(^PRC(442,D0,2,PRCH,4)),U,12) PRCHL1=PRCHL1+1 S:P=1 PRCHL1=PRCHL1+3
 D P:PRCHL-1<1 S ^TMP($J,"P",P,PRCH)=PRCHLB_U_PRCHL1,PRCHL=PRCHL-PRCHL1-1
 G CNTI
CNTD S (PRCHLE,PRCHLB,PRCH)=0 F J=0:0 S PRCH=$O(^PRC(442,D0,3,PRCH)) Q:PRCH=""!(PRCH'>0)  S:PRCHLB=0 PRCHLB=PRCH S PRCHLE=PRCH D P1:PRCHL-2<1 S ^TMP($J,"P",P,"D")=PRCHLB_U_PRCHLE,PRCHL=PRCHL-2
 I $P(PRCH0,U,13)>0!($P(PRCH0,U,18)>0) D:PRCHL-3<1 P1 S ^TMP($J,"P",P,"E")=$P(PRCH0,U,13),PRCHL=PRCHL-3 I PRCHDES="R",PRCHDTA,PRCHFPT=1 S PRCHDTA=PRCHDTA+$P(PRCH0,U,13)
 I $D(^PRC(442,D0,15)) F J=0:0 S J=$O(^PRC(442,D0,15,J)) Q:'J  S PRCHJ=^(J,0),PRCH="F"_J_U_+PRCHJ,PRCHLB=1,PRCHL1=$P(PRCHJ,U,2) D P:PRCHL-1<PRCHL1 S ^TMP($J,"P",P,PRCH)=PRCHLB_U_PRCHL1,PRCHL=PRCHL-PRCHL1-1
 G REQ:'$D(^PRC(442,D0,4,0)) K ^UTILITY($J,"W") S PRCH="W",DIWL=1,DIWR=64,DIWF="",PRCHJ=0 F  S PRCHJ=$O(^PRC(442,D0,4,PRCHJ)) Q:PRCHJ=""  S X=^(PRCHJ,0) D DIWP^PRCUTL($G(DA))
 K ^TMP($J,"PRCH") S %X="^UTILITY($J,""W"",DIWL,",%Y="^TMP($J,""PRCH"",1," D %XY^%RCR
 S PRCHL1=+^UTILITY($J,"W",DIWL),PRCHLB=1 D P:PRCHL-1<PRCHL1 S ^TMP($J,"P",P,"W")=PRCHLB_U_PRCHL1,PRCHL=PRCHL-PRCHL1-1
 ;
REQ I $D(^PRC(442,D0,13,0)) S (PRCHLE,PRCHLB,PRCH)=0 F J=0:0 S PRCH=$O(^PRC(442,D0,13,PRCH)) Q:'PRCH  S:PRCHLB=0 I=3,PRCHLB=PRCH S PRCHLE=PRCH D P1:PRCHL-I<3 S ^TMP($J,"P",P,"X")=PRCHLB_U_PRCHLE,PRCHL=PRCHL-I,I=2
 ;
BOCLN S CHGSHP=$P($G(^PRC(442,D0,0)),U,13)
 S (N,COUNT)=0 I $G(^PRC(442,D0,22,0))'="" F  S COUNT=$O(^PRC(442,D0,22,COUNT)) Q:COUNT=""!(COUNT'>0)  S BCT=$G(^(COUNT,0)) I $P(BCT,U,3)'=991 S N=N+1
 S:CHGSHP>0 N=N+1
 S N=N-2 S:N<1 N=0
 S BOCPG=N\45,BOCPG=$S(N#45'=0:BOCPG+1,1:BOCPG) S:PRCHL-1<3 PRCHL=45 S P=P+BOCPG
 G ^PRCHFPT2
 ;
P S PRCHL=45,P=P+1 Q
 ;
P1 S PRCHLB=PRCHLE,PRCHL=45,P=P+1 Q
 ;
DT I Y W Y\100#100,"/",Y#100\1,"/",Y\10000+1700 Q
 Q
 ;
TY S X=+$P(PRCH1,U,7),X=$P($G(^PRCD(420.8,X,0)),U,1),X=$S(X=2:"PURCHASE ORDER",X="B":"DELIVERY & PURCHASE ORDER",X="":"",1:"DELIVERY ORDER")
 Q
 ;
INV ;
 I $P($G(^PRC(442,D0,0)),U,2)=25 D  Q
 . N PRCA,PRCB,PRCC
 . S PRCHINV(1)="** No Purchase Card Info",PRCHINV(2)="",PRCHINV(3)="",PRCHINV(4)=""
 . S PRCA=$P($G(^PRC(442,D0,23)),U,8) Q:PRCA'>0
 . S PRCB=$G(^PRC(440.5,PRCA,0)) Q:PRCB=""
 . S PRCC=$P(PRCB,U,8) S:PRCC>0 PRCC=$P($G(^VA(200,PRCC,0)),U)
 . S PRCA=$P(PRCB,U,11),PRCHINV(1)="PURCHASE CARD HOLDER"
 . S PRCHINV(2)=" "_$E(PRCC,1,25),PRCHINV(3)="PURCHASE CARD NAME"
 . S PRCHINV(4)=" "_$E(PRCA,1,25)
 S PRCHINV(1)=" MAIL INVOICE TO:",PRCHINV(2)=" "_$P(PRCHINV,U,1),PRCHINV(3)=" "_$P(PRCHINV,U,2),X=4
 S:$P(PRCHINV,U,3)]"" PRCHINV(X)=" "_$P(PRCHINV,U,3),X=X+1 S:$P(PRCHINV,U,4)]"" PRCHINV(X)=" "_$P(PRCHINV,U,4),X=X+1
 S PRCHINV(X)=" "_$P(PRCHINV,U,5)_", "_$P($G(^DIC(5,+$P(PRCHINV,U,6),0)),U,2)_" "_$P(PRCHINV,U,7)
 Q