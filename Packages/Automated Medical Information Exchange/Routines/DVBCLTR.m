DVBCLTR ;ALB/GTS-557/THM- PRINT BIG LETTERS ; 5/7/91  11:00 AM
 ;;2.7;AMIE;;Apr 10, 1995
 D ^DVBCLTR2 F DVBCLTR="VAMC","C/P","FEE","EXAM" D X1
Q K ^TMP("DVBCLTR",$J),DVBCLT1,DVBCLT2,DVBCLT3,DVBCLTX,DVBCLTY,DVBCLT
 Q
 ;
X1 S DVBCLTY=$E(DVBCLTR,1,6),DVBCLTX="" F DVBCLT1=1:1:$L(DVBCLTY) I $A(DVBCLTY,DVBCLT1)>32,$D(^TMP("DVBCLTR",$J,$E(DVBCLTY,DVBCLT1))) S DVBCLTX=DVBCLTX_$E(DVBCLTY,DVBCLT1)
 D X2
 Q
 ;
X2 W ! F DVBCLT1=9:-1:1 W ! F DVBCLT3=1:1:$L(DVBCLTX) S X=^TMP("DVBCLTR",$J,$E(DVBCLTX,DVBCLT3)) W "   " F DVBCLT2=1:1:5 W $S($E(X,(DVBCLT2-1*9+DVBCLT1)):"XXX",1:"   ")
 Q
 ;
X3 D ^DVBCLTR2 F DVBCLTR="NOTE","TO","THE","PHYS" D X1
 G Q