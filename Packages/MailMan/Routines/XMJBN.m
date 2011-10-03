XMJBN ;ISC-SF/GMB-Access new mail in mailbox ;05/18/2004  08:37
 ;;8.0;MailMan;**25**;Jun 28, 2002
 ; Replaces ^XMA (ISC-WASH/THM/CAP)
 ; Entry points used by MailMan options (not covered by DBIA):
 ; NEW   XMNEW - Read new messages
NEW ;
 ; XMNEW    Number of new messages
 ; XMKMULT  1=New msgs in multiple baskets; 0=new msgs in one basket
 N XMABORT,XMK,XMKN,XMNEW,XMKMULT,XMNEWS
 S XMABORT=0
 D INIT^XMJBN1(XMDUZ,.XMK,.XMKN,.XMNEW,.XMKMULT,.XMABORT) Q:XMABORT
 S XMNEWS=1 ; Makes 'new'd msgs drop off list 'til next time
 I XMNEW=1 D  Q
 . N XMZ
 . S XMZ=$O(^XMB(3.7,XMDUZ,"N0",XMK,""))
 . I XMDUZ'=DUZ,'$$SURRACC^XMXSEC(XMDUZ,"",XMZ,$G(XMB(3.9,XMZ,0))) D  Q
 . . D ZSHOW^XMJERR
 . . D WAIT^XMXUTIL
 . I '$D(^XMB(3.7,XMDUZ,2,XMK,1,XMZ,0)) D ADDITN^XMUT4A(XMDUZ,"N0",XMK,XMZ)
 . D READNEW(XMDUZ,XMK,XMKN,XMZ)
 . D:$D(^XTMP("XM","MAKENEW",XMDUZ)) NEWAGAIN^XMJBN1(XMDUZ)
 F  D  Q:'$D(^XMB(3.7,XMDUZ,"N0"))!XMABORT
 . N XMDIR,XMOPT,XMOX,XMY
 . S XMDIR("A")=$$EZBLD^DIALOG(34085) ; Select New mail option
 . D SET^XMXSEC1("R",34086,.XMOPT,.XMOX)  ; Read new mail by basket
 . D SET^XMXSEC1("LB",34087,.XMOPT,.XMOX) ; List Baskets with new mail
 . D SET^XMXSEC1("LN",34088,.XMOPT,.XMOX) ; List all new messages
 . D SET^XMXSEC1("LP",34089,.XMOPT,.XMOX) ; List all priority messages
 . I '$D(^XMB(3.7,XMDUZ,"N")) S XMOPT("LP","?")=$$EZBLD^DIALOG(34018) ; You have no new priority messages.
 . D SET^XMXSEC1("P",34090,.XMOPT,.XMOX)  ; Print all new messages
 . D SET^XMXSEC1("S",34091,.XMOPT,.XMOX)  ; Scan all new messages
 . D SET^XMXSEC1("Q",34092,.XMOPT,.XMOX)  ; Quit
 . S XMDIR("B")=XMOX("O",XMV("NEW OPT"))_":"_XMOPT(XMV("NEW OPT"))
 . S XMDIR("??")="XM-U-R-READ NEW"
 . D XMDIR^XMJDIR(.XMDIR,.XMOPT,.XMOX,.XMY,.XMABORT) Q:XMABORT
 . K XMOPT,XMOX,XMDIR
 . D @XMY
 D:$D(^XTMP("XM","MAKENEW",XMDUZ)) NEWAGAIN^XMJBN1(XMDUZ)
 Q
LB ; List Baskets with new mail (Replaces NEW^XMA0A)
 N DIC,D,DZ
 S DIC="^XMB(3.7,"_XMDUZ_",2,"
 S DIC(0)="AEQ",D="B",DZ="??"
 S DIC("S")="I $P(^(0),U,2)"
 S DIC("W")="W ?31,$$EZBLD^DIALOG($S($P(^(0),U,2)'=1:34027.2,1:34027.4),$P(^(0),U,2))" ; (|1| New)
 D DQ^DICQ
 Q
LN ; List all new messages (Replaces LIST^XMA0A)
 D LISTALL^XMJMLN(XMDUZ,"N0")
 Q
LP ; List all priority messages (Replaces PRIO^XMA0A)
 D LISTALL^XMJMLN(XMDUZ,"N")
 Q
P ; Print all new messages
 ; Replaces PRINT^XMA0A
 N XMSAVE,I
 F I="XMV(","DUZ","XMDUZ","XMKMULT" S XMSAVE(I)=""
 D EN^XUTMDEVQ("PRTNEW^XMJBN",$$EZBLD^DIALOG(34501),.XMSAVE) ; MailMan: Print
 Q
PRTNEW ; Print all new messages
 N XMSCAN,XMNEWPRT,XMFIRST
 S (XMSCAN,XMNEWPRT,XMFIRST)=1
 D R
 I $D(ZTQUEUED),$D(^XTMP("XM","MAKENEW",XMDUZ)) D NEWAGAIN^XMJBN1(XMDUZ)
 Q
Q ; Quit
 S XMABORT=1
 Q
S ; Scan all new messages
 N XMSCAN
 S XMSCAN=1
 D R
 Q
R ; Read new mail by basket, priority first.
 N XMTYPE,XMK,XMKN,XMZ,XMIA,XMKPRI
 S XMABORT=0 ; (required when printing new messages)
 S XMIA='$D(ZTQUEUED)
 S XMKPRI=0,(XMKN,XMKPRI("XMKN"))="" K ^TMP("XM",$J,"APX")
 F  D  Q:'$D(^XMB(3.7,XMDUZ,"N0"))!XMABORT
 . S XMTYPE=$S($D(^XMB(3.7,XMDUZ,"N")):"N",$D(^XMB(3.7,XMDUZ,"N0")):"N0",1:"")
 . I XMTYPE="" S XMABORT=1 W:'$D(ZTQUEUED) !,$$EZBLD^DIALOG(34017) Q  ; You have no new messages.
 . I 'XMKMULT D
 . . S XMK=$O(^XMB(3.7,XMDUZ,XMTYPE,0))
 . . S XMKN=$P(^XMB(3.7,XMDUZ,2,XMK,0),U)
 . E  D  Q:XMABORT
 . . D NXTBSKT^XMJBN1(XMDUZ,XMTYPE,.XMKN,.XMK,.XMKPRI) I 'XMK S XMABORT=1 Q
 . . Q:$G(XMSCAN)
 . . D ASKBSKT(XMDUZ,1,.XMK,.XMKN,.XMABORT) Q:XMABORT
 . . I XMTYPE="N",'$D(^XMB(3.7,XMDUZ,XMTYPE,XMK)) S XMTYPE="N0"
 . S XMZ=""
 . F  S XMZ=$O(^XMB(3.7,XMDUZ,XMTYPE,XMK,XMZ),XMV("NEW ORDER")) Q:XMZ=""  D  Q:XMABORT
 . . I '$D(^XMB(3.7,XMDUZ,2,XMK,1,XMZ,0)) D ADDITN^XMUT4A(XMDUZ,XMTYPE,XMK,XMZ)
 . . I $G(XMNEWPRT) D  Q
 . . . D PRTMULT^XMJMP(XMDUZ,XMK,XMKN,XMZ,0,1,.XMFIRST,"",.XMABORT)
 . . . I XMDUZ'=DUZ,$$SURRCONF^XMXSEC(XMDUZ,XMZ) D  Q
 . . . . D NONEW^XMXUTIL(XMDUZ,XMK,XMZ,1)
 . . . . S ^XTMP("XM","MAKENEW",XMDUZ,XMZ)=""
 . . I XMDUZ'=DUZ,'$$SURRACC^XMXSEC(XMDUZ,"",XMZ,$G(XMB(3.9,XMZ,0))) D  Q
 . . . D ZSHOW^XMJERR
 . . . D WAIT^XMXUTIL
 . . . D NONEW^XMXUTIL(XMDUZ,XMK,XMZ,1)
 . . . S ^XTMP("XM","MAKENEW",XMDUZ,XMZ)=""
 . . D READNEW(XMDUZ,XMK,XMKN,XMZ,.XMABORT)
 . Q:XMABORT
 . S:$D(^XMB(3.7,XMDUZ,"N0")) XMKMULT=1
 . Q:$G(XMSCAN)!'XMKMULT
 . W !!,$$EZBLD^DIALOG($S(XMTYPE="N0":34098,1:34099),XMKN) ; Done with new/priority mail in your '|1|' Basket.
 . W:$D(^XMB(3.7,XMDUZ,"N0")) !!
 K ^TMP("XM",$J,"APX")
 Q
READNEW(XMDUZ,XMK,XMKN,XMZ,XMABORT) ;
 N XMSECURE,XMPAKMAN,XMSECBAD ; Important 'new' - part of scramble and packman handling
 I '$D(^XMB(3.9,XMZ,0)) D ZAPIT^XMXMSGS2(XMDUZ,XMK,XMZ) Q
 D DISPMSG^XMJMP(XMDUZ,XMK,XMKN,XMZ,.XMSECBAD) Q:$G(XMSECBAD)
 D READMSG^XMJMOI($G(XMNEWS),XMDUZ,XMK,XMKN,XMZ,.XMABORT)
 Q
ASKBSKT(XMDUZ,XMNEWMSG,XMK,XMKN,XMABORT) ;
 ; XMNEWMSG 1=Read new mail; 0=Read any mail
 N XMDIC,XMPROMPT
 S XMDIC("W")="N XMPARM S XMPARM(2)=$P(^(0),U,2),XMPARM(1)=+$P($G(^(1,0)),U,4) W ?31,$$EZBLD^DIALOG($S(XMPARM(1)'=1:$S('XMPARM(2):34026,XMPARM(2)>1:34027,1:34027.3),XMPARM(2):34027.1,1:34026.1),.XMPARM)" ; (|1| messages, |2| new)
 I XMNEWMSG D
 . S XMPROMPT=34029 ; Read NEW mail in MAIL BASKET:
 . S XMDIC("S")="I $P(^(0),U,2)"
 . S XMDIC("B")=$P(^XMB(3.7,XMDUZ,2,XMK,0),U)
 E  S XMPROMPT=34028 ; Read mail in MAIL BASKET:
 D SELBSKT^XMJBU(XMDUZ,XMPROMPT,"",.XMDIC,.XMK,.XMKN)
 I XMK=U S XMABORT=1
 Q
NPBSKT(XMDUZ) ; Return the first priority read basket that has new messages.
 ; If none has new messages, return the first priority basket.
 N XMDEFALT
 S XMDEFALT=$$BNMSGCT^XMXUTIL(XMDUZ,1)_U_1_U_$$EZBLD^DIALOG(37005) ; IN
 I '$D(^XMB(3.7,XMDUZ,2,"AP")) Q XMDEFALT
 N XMK,XMKN
 S XMKN=""
 D NXTBSKT^XMJBN1(XMDUZ,"N0",.XMKN,.XMK)
 I $D(^TMP("XM",$J,"APX")) K ^TMP("XM",$J,"APX") Q $$BNMSGCT^XMXUTIL(XMDUZ,XMK)_U_XMK_U_XMKN
 N XMI
 S (XMI,XMK)=0
 S XMI=+$O(^XMB(3.7,XMDUZ,2,"AP",XMI))
 I 'XMI Q XMDEFALT
 F  S XMK=$O(^XMB(3.7,XMDUZ,2,"AP",XMI,XMK)) Q:'XMK  D
 . S XMK($$BSKTNAME^XMXUTIL(XMDUZ,XMK))=XMK
 S XMKN=$O(XMK(""))
 I XMKN="" Q XMDEFALT
 S XMK=XMK(XMKN)
 Q "0^"_XMK_U_XMKN