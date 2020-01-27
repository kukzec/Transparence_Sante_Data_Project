/*************************************************/
/**                                             **/
/**				BDD Transpoarence santé         **/
/**                                             **/
/*************************************************/


/* Chemins */

%let path = C:\Users\mikew\Documents\MASTER 2 ESA\S2\BDD\Project2;

libname bdd "&path"; 

/* Import BDD */

filename source "&path\entreprise_2020_01_27_04_00.csv" encoding="utf-8" lrecl=32767;

proc import datafile=source
		    out=bdd.ent
		    dbms=csv replace;
run;

filename source2 "&path\declaration_avantage_2020_01_27_04_00.csv" encoding="utf-8" lrecl=32767;

proc import datafile=source2
		    out=bdd.avantage
		    dbms=csv replace;
			delimiter=";";
run;

filename source3 "&path\declaration_convention_2020_01_27_04_00.csv" encoding="utf-8" lrecl=32767;

proc import datafile=source3
		    out=bdd.convention
		    dbms=csv replace;
			delimiter=";";
run;


filename source4 "&path\declaration_remuneration_2020_01_27_04_00.csv" encoding="utf-8" lrecl=32767;

proc import datafile=source4
		    out=bdd.remuneration
		    dbms=csv replace;
			delimiter=";";
run;




