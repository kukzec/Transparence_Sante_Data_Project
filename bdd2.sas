/*************************************************/
/**                                             **/
/**				BDD Transpoarence santé         **/
/**                                             **/
/*************************************************/


/* Chemins */

%let path = C:\Users\theloloboss\Desktop\GBD\Partie2_27012020;

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

/* Suppression des bugs saut à la ligne */

data bdd.avantage;
	set bdd.avantage;
	where ligne_type = "[A]";
run;

data bdd.convention;
	set bdd.convention;
	where ligne_type = "[C]";
run;

data bdd.remuneration;
	set bdd.remuneration;
	where ligne_type = "[R]";
run;

/* Re-traitement majuscules/minuscules */
/* Création d'une dummy qui prend la valeur 1 si présence d'un montant et 0 sinon */

data bdd.ent;
	set bdd.ent;
	denomination_sociale = upcase(denomination_sociale);
	adresse_1 = upcase(adresse_1);
	adresse_2 = upcase(adresse_2);
	adresse_3 = upcase(adresse_3);
	adresse_4 = upcase(adresse_4);
	ville = upcase(ville);

run;

data bdd.convention;
	set bdd.convention;
	denomination_sociale    = upcase(denomination_sociale);
	categorie               = upcase(categorie);
	benef_nom               = upcase(benef_nom);
	benef_prenom            = upcase(benef_prenom);
	benef_adresse1          = upcase(benef_adresse1);
	benef_adresse2          = upcase(benef_adresse2);
	benef_adresse3          = upcase(benef_adresse3);
	benef_adresse4          = upcase(benef_adresse4);
	benef_ville             = upcase(benef_ville);
	conv_manifestation_nom  = upcase(conv_manifestation_nom);
	conv_manifestation_lieu = upcase(conv_manifestation_lieu);
	avant_convention_lie    = upcase(avant_convention_lie);
	avant_nature            = upcase(avant_nature);

	if conv_montant_ttc     = . then dummy_montant = 0;
	else dummy_montant      = 1;
run;

data bdd.avantage;
	set bdd.avantage;
	benef_nom               = upcase(benef_nom);
	benef_prenom            = upcase(benef_prenom);
	avant_nature            = upcase(avant_nature);
	benef_adresse1          = upcase(benef_adresse1);
	benef_adresse2          = upcase(benef_adresse2);
	benef_adresse3          = upcase(benef_adresse3);
	benef_adresse4          = upcase(benef_adresse4);
	benef_ville             = upcase(benef_ville);	

	if avant_montant_ttc     = . then dummy_montant = 0;
	else dummy_montant      = 1;
run;

data bdd.remuneration;
	set bdd.remuneration;
	benef_nom               = upcase(benef_nom);
	benef_prenom            = upcase(benef_prenom);
	avant_nature            = upcase(avant_nature);
	benef_adresse1          = upcase(benef_adresse1);
	benef_adresse2          = upcase(benef_adresse2);
	benef_adresse3          = upcase(benef_adresse3);
	benef_adresse4          = upcase(benef_adresse4);
	benef_ville             = upcase(benef_ville);	

	if remu_montant_ttc     = . then dummy_montant = 0;
	else dummy_montant      = 1;

run;

proc freq data=bdd.convention;
table dummy_montant;
run;
proc freq data=bdd.avantage;
table dummy_montant;
run;
proc freq data=bdd.remuneration;
table dummy_montant;
run;




