IBDEI08C ; ; 12-JAN-2012
 ;;3.0;IB ENCOUNTER FORM IMP/EXP;;JAN 12, 2012
 Q:'DIFQR(358.3)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,99) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,358.3,11166,1,5,0)
 ;;=5^Heart Failure, Systolic, Acute on Chronic
 ;;^UTILITY(U,$J,358.3,11166,2)
 ;;=Heart Failure, Systolic, Acute on Chronic^328496
 ;;^UTILITY(U,$J,358.3,11167,0)
 ;;=428.30^^88^691^44
 ;;^UTILITY(U,$J,358.3,11167,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11167,1,4,0)
 ;;=4^428.30
 ;;^UTILITY(U,$J,358.3,11167,1,5,0)
 ;;=5^Heart Failure, Diastolic
 ;;^UTILITY(U,$J,358.3,11167,2)
 ;;=Heart Failure, Diastolic^328595
 ;;^UTILITY(U,$J,358.3,11168,0)
 ;;=428.31^^88^691^40
 ;;^UTILITY(U,$J,358.3,11168,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11168,1,4,0)
 ;;=4^428.31
 ;;^UTILITY(U,$J,358.3,11168,1,5,0)
 ;;=5^Heart Failure, Acute Diastolic
 ;;^UTILITY(U,$J,358.3,11168,2)
 ;;=Heart Failure, Acute Diastolic^328497
 ;;^UTILITY(U,$J,358.3,11169,0)
 ;;=428.32^^88^691^42
 ;;^UTILITY(U,$J,358.3,11169,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11169,1,4,0)
 ;;=4^428.32
 ;;^UTILITY(U,$J,358.3,11169,1,5,0)
 ;;=5^Heart Failure, Chronic Diastolic
 ;;^UTILITY(U,$J,358.3,11169,2)
 ;;=Heart Failure, Chronic Diastolic^328498
 ;;^UTILITY(U,$J,358.3,11170,0)
 ;;=428.33^^88^691^46
 ;;^UTILITY(U,$J,358.3,11170,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11170,1,4,0)
 ;;=4^428.33
 ;;^UTILITY(U,$J,358.3,11170,1,5,0)
 ;;=5^Heart Failure, Diastolic, Acute on Chronic
 ;;^UTILITY(U,$J,358.3,11170,2)
 ;;=Heart Failure, Diastolic, Acute on Chronic^328499
 ;;^UTILITY(U,$J,358.3,11171,0)
 ;;=428.40^^88^691^45
 ;;^UTILITY(U,$J,358.3,11171,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11171,1,4,0)
 ;;=4^428.40
 ;;^UTILITY(U,$J,358.3,11171,1,5,0)
 ;;=5^Heart Failure, Diastolic& Systolic
 ;;^UTILITY(U,$J,358.3,11171,2)
 ;;=Heart Failure, Systolic and Diastolic^328596
 ;;^UTILITY(U,$J,358.3,11172,0)
 ;;=428.41^^88^691^47
 ;;^UTILITY(U,$J,358.3,11172,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11172,1,4,0)
 ;;=4^428.41
 ;;^UTILITY(U,$J,358.3,11172,1,5,0)
 ;;=5^Heart Failure, Systolic & Diastolic, Acute
 ;;^UTILITY(U,$J,358.3,11172,2)
 ;;=Heart Failure, Systolic & Diastolic, Acute^328500
 ;;^UTILITY(U,$J,358.3,11173,0)
 ;;=428.42^^88^691^51
 ;;^UTILITY(U,$J,358.3,11173,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11173,1,4,0)
 ;;=4^428.42
 ;;^UTILITY(U,$J,358.3,11173,1,5,0)
 ;;=5^Heart Failure,Systolic&Diastolic,Chronic
 ;;^UTILITY(U,$J,358.3,11173,2)
 ;;=^328501
 ;;^UTILITY(U,$J,358.3,11174,0)
 ;;=428.43^^88^691^50
 ;;^UTILITY(U,$J,358.3,11174,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11174,1,4,0)
 ;;=4^428.43
 ;;^UTILITY(U,$J,358.3,11174,1,5,0)
 ;;=5^Heart Failure,Systolic&Diastolic
 ;;^UTILITY(U,$J,358.3,11174,2)
 ;;=^328502
 ;;^UTILITY(U,$J,358.3,11175,0)
 ;;=396.3^^88^691^10
 ;;^UTILITY(U,$J,358.3,11175,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11175,1,4,0)
 ;;=4^396.3
 ;;^UTILITY(U,$J,358.3,11175,1,5,0)
 ;;=5^Aortic and Mitral Insufficiency
 ;;^UTILITY(U,$J,358.3,11175,2)
 ;;=Aortic and Mitral Insufficiency^269583
 ;;^UTILITY(U,$J,358.3,11176,0)
 ;;=429.9^^88^691^26
 ;;^UTILITY(U,$J,358.3,11176,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11176,1,4,0)
 ;;=4^429.9
 ;;^UTILITY(U,$J,358.3,11176,1,5,0)
 ;;=5^Diastolic Dysfunction
 ;;^UTILITY(U,$J,358.3,11176,2)
 ;;=^54741
 ;;^UTILITY(U,$J,358.3,11177,0)
 ;;=453.79^^88^691^25
 ;;^UTILITY(U,$J,358.3,11177,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11177,1,4,0)
 ;;=4^453.79
 ;;^UTILITY(U,$J,358.3,11177,1,5,0)
 ;;=5^Chr Venous Emblsm Oth Spec Veins
 ;;^UTILITY(U,$J,358.3,11177,2)
 ;;=^338251
 ;;^UTILITY(U,$J,358.3,11178,0)
 ;;=453.89^^88^691^1
 ;;^UTILITY(U,$J,358.3,11178,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11178,1,4,0)
 ;;=4^453.89
 ;;^UTILITY(U,$J,358.3,11178,1,5,0)
 ;;=5^AC Venous Emblsm Oth Spec Veins
 ;;^UTILITY(U,$J,358.3,11178,2)
 ;;=^338259
 ;;^UTILITY(U,$J,358.3,11179,0)
 ;;=454.0^^88^691^78
 ;;^UTILITY(U,$J,358.3,11179,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11179,1,4,0)
 ;;=4^454.0
 ;;^UTILITY(U,$J,358.3,11179,1,5,0)
 ;;=5^Varicose Veins
 ;;^UTILITY(U,$J,358.3,11179,2)
 ;;=^125410
 ;;^UTILITY(U,$J,358.3,11180,0)
 ;;=454.2^^88^691^79
 ;;^UTILITY(U,$J,358.3,11180,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11180,1,4,0)
 ;;=4^454.2
 ;;^UTILITY(U,$J,358.3,11180,1,5,0)
 ;;=5^Varicose Veins w/Ulcer&Inflam
 ;;^UTILITY(U,$J,358.3,11180,2)
 ;;=^269821
 ;;^UTILITY(U,$J,358.3,11181,0)
 ;;=271.3^^88^692^10
 ;;^UTILITY(U,$J,358.3,11181,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11181,1,4,0)
 ;;=4^271.3
 ;;^UTILITY(U,$J,358.3,11181,1,5,0)
 ;;=5^Glucose Intolerance
 ;;^UTILITY(U,$J,358.3,11181,2)
 ;;=^64790
 ;;^UTILITY(U,$J,358.3,11182,0)
 ;;=611.1^^88^692^15
 ;;^UTILITY(U,$J,358.3,11182,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11182,1,4,0)
 ;;=4^611.1
 ;;^UTILITY(U,$J,358.3,11182,1,5,0)
 ;;=5^Gynecomastia
 ;;^UTILITY(U,$J,358.3,11182,2)
 ;;=^60454
 ;;^UTILITY(U,$J,358.3,11183,0)
 ;;=704.1^^88^692^16
 ;;^UTILITY(U,$J,358.3,11183,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11183,1,4,0)
 ;;=4^704.1
 ;;^UTILITY(U,$J,358.3,11183,1,5,0)
 ;;=5^Hirsutism
 ;;^UTILITY(U,$J,358.3,11183,2)
 ;;=^57407
 ;;^UTILITY(U,$J,358.3,11184,0)
 ;;=251.2^^88^692^27
 ;;^UTILITY(U,$J,358.3,11184,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11184,1,4,0)
 ;;=4^251.2
 ;;^UTILITY(U,$J,358.3,11184,1,5,0)
 ;;=5^Hypoglycemia Nos
 ;;^UTILITY(U,$J,358.3,11184,2)
 ;;=^60580
 ;;^UTILITY(U,$J,358.3,11185,0)
 ;;=257.2^^88^692^28
 ;;^UTILITY(U,$J,358.3,11185,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11185,1,4,0)
 ;;=4^257.2
 ;;^UTILITY(U,$J,358.3,11185,1,5,0)
 ;;=5^Hypogonadism,Male
 ;;^UTILITY(U,$J,358.3,11185,2)
 ;;=^88213
 ;;^UTILITY(U,$J,358.3,11186,0)
 ;;=253.2^^88^692^31
 ;;^UTILITY(U,$J,358.3,11186,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11186,1,4,0)
 ;;=4^253.2
 ;;^UTILITY(U,$J,358.3,11186,1,5,0)
 ;;=5^Hypopituitarism
 ;;^UTILITY(U,$J,358.3,11186,2)
 ;;=^60686
 ;;^UTILITY(U,$J,358.3,11187,0)
 ;;=733.00^^88^692^40
 ;;^UTILITY(U,$J,358.3,11187,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11187,1,4,0)
 ;;=4^733.00
 ;;^UTILITY(U,$J,358.3,11187,1,5,0)
 ;;=5^Osteoporosis Nos
 ;;^UTILITY(U,$J,358.3,11187,2)
 ;;=^87159
 ;;^UTILITY(U,$J,358.3,11188,0)
 ;;=278.00^^88^692^37
 ;;^UTILITY(U,$J,358.3,11188,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11188,1,4,0)
 ;;=4^278.00
 ;;^UTILITY(U,$J,358.3,11188,1,5,0)
 ;;=5^Obesity
 ;;^UTILITY(U,$J,358.3,11188,2)
 ;;=^84823
 ;;^UTILITY(U,$J,358.3,11189,0)
 ;;=278.01^^88^692^36
 ;;^UTILITY(U,$J,358.3,11189,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11189,1,4,0)
 ;;=4^278.01
 ;;^UTILITY(U,$J,358.3,11189,1,5,0)
 ;;=5^Morbid Obesity
 ;;^UTILITY(U,$J,358.3,11189,2)
 ;;=^84844
 ;;^UTILITY(U,$J,358.3,11190,0)
 ;;=250.80^^88^692^9
 ;;^UTILITY(U,$J,358.3,11190,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11190,1,4,0)
 ;;=4^250.80
 ;;^UTILITY(U,$J,358.3,11190,1,5,0)
 ;;=5^DM Type II with LE Ulcer
 ;;^UTILITY(U,$J,358.3,11190,2)
 ;;=DM Type II with LE Ulcer^267846^707.10
 ;;^UTILITY(U,$J,358.3,11191,0)
 ;;=250.00^^88^692^4
 ;;^UTILITY(U,$J,358.3,11191,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11191,1,4,0)
 ;;=4^250.00
 ;;^UTILITY(U,$J,358.3,11191,1,5,0)
 ;;=5^DM Type II Dm W/O Complications
 ;;^UTILITY(U,$J,358.3,11191,2)
 ;;=^33605
 ;;^UTILITY(U,$J,358.3,11192,0)
 ;;=250.40^^88^692^5
 ;;^UTILITY(U,$J,358.3,11192,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11192,1,4,0)
 ;;=4^250.40
 ;;^UTILITY(U,$J,358.3,11192,1,5,0)
 ;;=5^DM Type II Dm with Nephropathy
 ;;^UTILITY(U,$J,358.3,11192,2)
 ;;=^267837^583.81
 ;;^UTILITY(U,$J,358.3,11193,0)
 ;;=250.50^^88^692^8
 ;;^UTILITY(U,$J,358.3,11193,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11193,1,4,0)
 ;;=4^250.50
 ;;^UTILITY(U,$J,358.3,11193,1,5,0)
 ;;=5^DM Type II w/ PDR
 ;;^UTILITY(U,$J,358.3,11193,2)
 ;;=DM Type II w/ PDR^267839^362.02
 ;;^UTILITY(U,$J,358.3,11194,0)
 ;;=250.60^^88^692^6
 ;;^UTILITY(U,$J,358.3,11194,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11194,1,4,0)
 ;;=4^250.60
 ;;^UTILITY(U,$J,358.3,11194,1,5,0)
 ;;=5^DM Type II Dm with Neuropathy
 ;;^UTILITY(U,$J,358.3,11194,2)
 ;;=^267841^357.2
 ;;^UTILITY(U,$J,358.3,11195,0)
 ;;=250.70^^88^692^7
 ;;^UTILITY(U,$J,358.3,11195,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11195,1,4,0)
 ;;=4^250.70
 ;;^UTILITY(U,$J,358.3,11195,1,5,0)
 ;;=5^DM Type II Dm with Peripheral Vasc Dis
 ;;^UTILITY(U,$J,358.3,11195,2)
 ;;=^267843^443.81
 ;;^UTILITY(U,$J,358.3,11196,0)
 ;;=250.01^^88^692^3
 ;;^UTILITY(U,$J,358.3,11196,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11196,1,4,0)
 ;;=4^250.01
 ;;^UTILITY(U,$J,358.3,11196,1,5,0)
 ;;=5^DM Type I DM W/O Complications
 ;;^UTILITY(U,$J,358.3,11196,2)
 ;;=^33586
 ;;^UTILITY(U,$J,358.3,11197,0)
 ;;=272.0^^88^692^20
 ;;^UTILITY(U,$J,358.3,11197,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11197,1,4,0)
 ;;=4^272.0
 ;;^UTILITY(U,$J,358.3,11197,1,5,0)
 ;;=5^Hypercholesterolemia, Pure
 ;;^UTILITY(U,$J,358.3,11197,2)
 ;;=Hypercholesterolemia, Pure^59973
 ;;^UTILITY(U,$J,358.3,11198,0)
 ;;=272.1^^88^692^25
 ;;^UTILITY(U,$J,358.3,11198,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11198,1,4,0)
 ;;=4^272.1
 ;;^UTILITY(U,$J,358.3,11198,1,5,0)
 ;;=5^Hypertriglyceridemia, Pure
 ;;^UTILITY(U,$J,358.3,11198,2)
 ;;=Hypertriglyceridemia, Pure^101303
 ;;^UTILITY(U,$J,358.3,11199,0)
 ;;=272.2^^88^692^22
 ;;^UTILITY(U,$J,358.3,11199,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11199,1,4,0)
 ;;=4^272.2
 ;;^UTILITY(U,$J,358.3,11199,1,5,0)
 ;;=5^Hyperlipidemia, Mixed
 ;;^UTILITY(U,$J,358.3,11199,2)
 ;;=^78424
 ;;^UTILITY(U,$J,358.3,11200,0)
 ;;=275.42^^88^692^19
 ;;^UTILITY(U,$J,358.3,11200,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11200,1,4,0)
 ;;=4^275.42
 ;;^UTILITY(U,$J,358.3,11200,1,5,0)
 ;;=5^Hypercalcemia
 ;;^UTILITY(U,$J,358.3,11200,2)
 ;;=^59932
 ;;^UTILITY(U,$J,358.3,11201,0)
 ;;=275.41^^88^692^26
 ;;^UTILITY(U,$J,358.3,11201,1,0)
 ;;=^358.31IA^5^2
 ;;^UTILITY(U,$J,358.3,11201,1,4,0)
 ;;=4^275.41
 ;;^UTILITY(U,$J,358.3,11201,1,5,0)
 ;;=5^Hypocalcemia
 ;;^UTILITY(U,$J,358.3,11201,2)
 ;;=^60542