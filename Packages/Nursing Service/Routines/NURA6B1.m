NURA6B1 ;HIRMFO/RM/YH,FT-AGE REPORT BY SERVICE BY CATEGORY ;3/27/97
 ;;4.0;NURSING SERVICE;**13**;Apr 25, 1997
 Q:'$D(^DIC(213.9,1,"OFF"))  Q:$P(^DIC(213.9,1,"OFF"),"^",1)=1
 S (NURQUIT,NURQUEUE,NUROUT)=0
 D EN1^NURSAUTL G QUIT:NUROUT
 I NURMDSW D EN12^NURSAGSP G:$G(NUROUT) QUIT S DIC(0)="AEMQZ",NURPLSCR=0 D EN5^NURSAGSP G:$G(NUROUT) QUIT
 I NURMDSW=0,NURPLSW=1 S NURPLSCR=0 D PRD^NURSAGSP K NURPLSCR I $G(NUROUT) G QUIT
 D EN3^NURSAGSP G:NUROUT QUIT
 D EN3^NURSAGP0 W ! G QUIT:NUROUT
 S ZTDESC="Age Report by Nursing Location & Category",ZTRTN="START^NURA6B1" D EN7^NURSUT0 G:POP!($D(ZTSK)) QUIT
START ;
 K ^TMP("NURA",$J),^TMP($J) S NSEL="C",(NURQUIT,NURSW1,NURSW1(1),NURPAGE,NTCT)=0,(NL1,NCATPOS)=""
 D SORT I '$G(NUROUT) U IO D NPRINT,FINCAT^NURAGE
QUIT K ^TMP("NURA",$J),^TMP($J) D CLOSE^NURSUT1,^NURAKILL
 Q
NPRINT F NURI=1:1:8 S (NURSOLD(NURI),NURSFOLD(NURI),NURSWOLD(NURI),NURSPOLD(NURI),NURSMOLD(NURI))=0
 S NURFAC="" F  S NURFAC=$O(^TMP($J,"L",NURFAC)) Q:NURFAC=""  D NM Q:NURQUIT  D:NURMDSW FSUBTL^NURAGE Q:NURQUIT
 Q
NM S NURSPROG="" F  S NURSPROG=$O(^TMP($J,"L",NURFAC,NURSPROG)) Q:NURSPROG=""  D:'$G(NURSUMSW) HDGING^NURAGE Q:NURQUIT  D NN Q:NURQUIT  I NURPLSW,'$G(NURSUMSW) D PSUBTL^NURAGE Q:NURQUIT
 Q
NN S NCATPOS="" F  S NCATPOS=$O(^TMP($J,"L",NURFAC,NURSPROG,NCATPOS)) Q:NCATPOS=""  D HDGBYP^NURAGE D NO Q:NURQUIT  D WRTCAT^NURAGE Q:NURQUIT
 Q
NO S NURDOB="" F  S NURDOB=$O(^TMP($J,"L",NURFAC,NURSPROG,NCATPOS,NURDOB)) Q:NURDOB=""  D NP Q:NURQUIT
 Q
NP S NURN1="" F  S NURN1=$O(^TMP($J,"L",NURFAC,NURSPROG,NCATPOS,NURDOB,NURN1)) Q:NURN1=""  S NURSORT=$G(^(NURN1)) I NURSORT D NQ Q:NURQUIT
 Q
NQ S DA="" F  S DA=$O(^TMP($J,"L1",NURSORT,DA)) Q:DA=""  D ^NURAGE Q:NURQUIT
 Q
SORT W ! S NRPT=7 D EN1^NURAAGS0
 S X=$O(^TMP($J,""))
 I X="" S NUROUT=1,NURFAC=$S($G(NURFAC)=0:$G(NURFAC(1)),1:""),NURSPROG=$S($G(NURSPROG)=0:NURSPROG(1),1:"") D HDGING^NURAGE W !,"THERE IS NO DATA FOR THIS REPORT"
 Q