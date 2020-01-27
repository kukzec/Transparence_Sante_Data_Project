/*************************************************/
/**                                             **/
/**				BDD Transpoarence santé         **/
/**                                             **/
/*************************************************/


/* Chemins */

%let path = C:\Users\mikew\Documents\MASTER 2 ESA\S2\BDD\Project2;

libname bdd "&path"; 

/* Import Entreprise */

proc import datafile="&path\entreprise_2020_01_27_04_00.csv"
		            out=bdd.ent
					dbms=csv replace;
run;

/* Import Avantage */

proc import datafile="&path\declaration_avantage_2020_01_27_04_00.csv"
		            out=bdd.avantage
					dbms=csv replace;
					delimiter=';';
run;

proc contents data=bdd.avantage; run;
proc print data=bdd.avantage (obs=10);run;

proc import datafile="&path\declaration_convention_2020_01_27_04_00.csv"
		            out=bdd.convention
					dbms=csv replace;
run;

proc import datafile="&path\declaration_remuneration_2020_01_27_04_00.csv"
		            out=bdd.remuneration
					dbms=csv replace;
run;

