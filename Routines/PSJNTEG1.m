PSJNTEG1 ;ISC/XTSUMBLD KERNEL - Package checksum checker ;2971216.152955
 ;;0.0;
 ;;7.3;2971216.152955
 S XT4="I 1",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
CONT F XT1=1:1 S XT2=$T(ROU+XT1) Q:XT2=""  S X=$P(XT2," ",1),XT3=$P(XT2,";",3) X XT4 I $T W !,X X ^%ZOSF("TEST") S:'$T XT3=0 X:XT3 ^%ZOSF("RSUM") W ?10,$S('XT3:"Routine not in UCI",XT3'=Y:"Calculated "_$C(7)_Y_", off by "_(Y-XT3),1:"ok")
 ;
 K %1,%2,%3,X,Y,XT1,XT2,XT3,XT4 Q
ONE S XT4="I $D(^UTILITY($J,X))",X=$T(+3) W !!,"Checksum routine created on ",$P(X,";",4)," by KERNEL V",$P(X,";",3),!
 W !,"Check a subset of routines:" K ^UTILITY($J) X ^%ZOSF("RSEL")
 W ! G CONT
ROU ;;
PSJMDIR1 ;;3416867
PSJMDWS ;;5917842
PSJMEDS ;;7358516
PSJMIV ;;7396273
PSJMP ;;2603394
PSJMPEND ;;6364272
PSJMPRT ;;9141134
PSJMPRTU ;;4110253
PSJMUTL ;;11606487
PSJO ;;12385055
PSJO1 ;;9390577
PSJO2 ;;14730087
PSJO3 ;;6619707
PSJOE ;;17536494
PSJOE0 ;;11844732
PSJOE1 ;;13855940
PSJOEEW ;;15692721
PSJORDA ;;2313670
PSJOREN ;;9651252
PSJORRE ;;12172794
PSJORRE1 ;;10676907
PSJORUT2 ;;12058214
PSJORUTL ;;6511653
PSJP ;;14835057
PSJPDIR ;;14335988
PSJPDV ;;20985117
PSJPDV0 ;;13480233
PSJPDV1 ;;8902448
PSJPL0 ;;8059345
PSJPR ;;18633818
PSJPR0 ;;6196651
PSJQPR ;;12216853
PSJRXI ;;4797385
PSJSPU ;;10487611
PSJSPU0 ;;2604506
PSJSV ;;13252411
PSJSV0 ;;19096014
PSJUNITD ;;4667049
PSJUTL ;;11616725
PSJUTL1 ;;11303263
PSJUTL5 ;;14534172