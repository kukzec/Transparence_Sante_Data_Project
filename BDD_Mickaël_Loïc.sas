
proc sql outobs=100;
    select t1.denomination_sociale,
           t2.secteur,
           sum(t1.remu_montant_ttc) as somme
    from bdd.remuneration as t1 full join bdd.ent as t2 on t2.identifiant=t1.entreprise_identifiant

    ;
quit;
/*************************************************/
/**                                             **/
/**				BDD Transparence santé         **/
/**                                             **/
/*************************************************/

/* Options */

ods html close;

/* Chemins */

*%let path = F:\Projet\GBD\Partie2_27012020;
%let path = C:\Users\mikew\Documents\MASTER 2 ESA\S2\BDD\Project2;

libname bdd "&path"; 


/* Import BDD */

/* BDD ENT */
"
filename source "&path\entreprise_2020_01_27_04_00.csv" encoding="utf-8" lrecl=32767;

data BDD.ENT    ;
       %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
       infile SOURCE delimiter = ',' MISSOVER DSD lrecl=13106 firstobs=2 ;
          informat identifiant $8. ;
          informat pays_code $4. ;
          informat pays $100. ;
          informat secteur_activite_code $7. ;
          informat secteur $50. ;
          informat denomination_sociale $50.; 
          informat adresse_1 $49. ;
          informat adresse_2 $34. ;
          informat adresse_3 $26. ;
          informat adresse_4 $19. ;
          informat code_postal $20. ;
          informat ville $30. ;
          format identifiant $8. ;
          format pays_code $4. ;
          format pays $100. ;
          format secteur_activite_code $7. ;
          format secteur $50. ;
          format denomination_sociale $50. ;
          format adresse_1 $49. ;
          format adresse_2 $34. ;
          format adresse_3 $26. ;
          format adresse_4 $19. ;
          format code_postal $20. ;
          format ville $30. ;
       input
                   identifiant  $
                   pays_code  $
                   pays  $
                   secteur_activite_code  $
                  secteur  $
                   denomination_sociale  $
                   adresse_1  $
                   adresse_2  $
                   adresse_3  $
                   adresse_4  $
                   code_postal  $
                   ville  $
       ;
       if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
       run;


/* BDD AVANTAGE */

filename source2 "&path\declaration_avantage_2020_01_27_04_00.csv" encoding="utf-8" lrecl=32767;

data BDD.AVANTAGE    ;
      %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
      infile SOURCE2 delimiter = ';' MISSOVER DSD lrecl=13106 firstobs=2 ;
         informat entreprise_identifiant $294. ;
         informat denomination_sociale $157. ;
         informat ligne_identifiant $127. ;
         informat ligne_rectification $5. ;
         informat benef_categorie_code $5. ;
         informat categorie $88. ;
         informat benef_nom $140. ;
         informat benef_prenom $112. ;
         informat benef_qualite_code $5. ;
         informat qualite $71. ;
         informat benef_adresse1 $215. ;
         informat benef_adresse2 $197. ;
         informat benef_adresse3 $224. ;
         informat benef_adresse4 $98. ;
         informat benef_codepostal $10. ;
         informat benef_ville $104. ;
         informat benef_pays_code $17. ;
         informat pays $37. ;
         informat benef_titre_code $7. ;
         informat benef_titre_libelle $18. ;
         informat benef_specialite_code $7. ;
         informat benef_speicalite_libelle $51. ;
         informat benef_identifiant_type_code $8. ;
         informat identifiant_type $6. ;
         informat benef_identifiant_valeur $139. ;
         informat benef_etablissement $208. ;
         informat benef_etablissement_codepostal $10. ;
         informat benef_etablissement_ville $40. ;
         informat benef_denomination_sociale $216. ;
         informat benef_objet_social $260. ;
         informat ligne_type $3. ;
         informat avant_date_signature $10. ;
         informat avant_montant_ttc best32. ;
         informat avant_nature $254. ;
         informat avant_convention_lie $249. ;
         informat semestre $2. ;
         format entreprise_identifiant $294. ;
         format denomination_sociale $157. ;
         format ligne_identifiant $127. ;
         format ligne_rectification $5. ;
         format benef_categorie_code $5. ;
         format categorie $88. ;
         format benef_nom $140. ;
         format benef_prenom $112. ;
         format benef_qualite_code $5. ;
         format qualite $71. ;
         format benef_adresse1 $215. ;
         format benef_adresse2 $197. ;
         format benef_adresse3 $224. ;
         format benef_adresse4 $98. ;
         format benef_codepostal $10. ;
         format benef_ville $104. ;
         format benef_pays_code $17. ;
         format pays $37. ;
         format benef_titre_code $7. ;
         format benef_titre_libelle $18. ;
         format benef_specialite_code $7. ;
         format benef_speicalite_libelle $51. ;
         format benef_identifiant_type_code $8. ;
         format identifiant_type $6. ;
         format benef_identifiant_valeur $139. ;
         format benef_etablissement $208. ;
         format benef_etablissement_codepostal $10. ;
         format benef_etablissement_ville $40. ;
         format benef_denomination_sociale $216. ;
         format benef_objet_social $260. ;
         format ligne_type $3. ;
         format avant_date_signature $10. ;
         format avant_montant_ttc best12. ;
         format avant_nature $254. ;
         format avant_convention_lie $249. ;
         format semestre $2. ;
      input
                  entreprise_identifiant  $
                  denomination_sociale  $
                  ligne_identifiant  $
                  ligne_rectification  $
                  benef_categorie_code  $
                  categorie  $
                  benef_nom  $
                  benef_prenom  $
                  benef_qualite_code  $
                  qualite  $
                  benef_adresse1  $
                  benef_adresse2  $
                  benef_adresse3  $
                  benef_adresse4  $
                  benef_codepostal  $
                  benef_ville  $
                  benef_pays_code  $
                  pays  $
                  benef_titre_code  $
                  benef_titre_libelle  $
                  benef_specialite_code  $
                  benef_speicalite_libelle  $
                  benef_identifiant_type_code  $
                  identifiant_type  $
                  benef_identifiant_valeur  $
                  benef_etablissement  $
                  benef_etablissement_codepostal  $
                  benef_etablissement_ville  $
                  benef_denomination_sociale  $
                  benef_objet_social  $
                  ligne_type  $
                  avant_date_signature  $
                  avant_montant_ttc
                  avant_nature  $
                  avant_convention_lie  $
                  semestre  $
      ;
      if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
      run;

/* BDD CONVENTION */

filename source3 "&path\declaration_convention_2020_01_27_04_00.csv" encoding="utf-8" lrecl=32767;


data BDD.CONVENTION    ;
      %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
      infile SOURCE3 delimiter = ';' MISSOVER DSD lrecl=13106 firstobs=2 ;
         informat entreprise_identifiant $341. ;
         informat denomination_sociale $157. ;
         informat ligne_identifiant $128. ;
         informat ligne_rectification $67. ;
         informat benef_categorie_code $30. ;
         informat categorie $88. ;
         informat benef_nom $230. ;
         informat benef_prenom $116. ;
         informat benef_qualite_code $18. ;
         informat qualite $71. ;
         informat benef_adresse1 $262. ;
         informat benef_adresse2 $176. ;
         informat benef_adresse3 $200. ;
         informat benef_adresse4 $127. ;
         informat benef_codepostal $10. ;
         informat benef_ville $49. ;
         informat benef_pays_code $6. ;
         informat pays $40. ;
         informat benef_titre_code $7. ;
         informat benef_titre_libelle $22. ;
         informat benef_specialite_code $22. ;
         informat benef_speicalite_libelle $51. ;
         informat benef_identifiant_type_code $8. ;
         informat identifiant_type $8. ;
         informat benef_identifiant_valeur $143. ;
         informat benef_etablissement $208. ;
         informat benef_etablissement_codepostal $10. ;
         informat benef_etablissement_ville $88. ;
         informat benef_denomination_sociale $255. ;
         informat benef_objet_social $260. ;
         informat ligne_type $10. ;
         informat conv_date_signature $21. ;
         informat conv_objet $91. ;
         informat conv_objet_autre $259. ;
         informat conv_date_debut $10. ;
         informat conv_date_fin $11. ;
         informat conv_montant_ttc $8. ;
         informat conv_manifestation_date $11. ;
         informat conv_manifestation_nom $256. ;
         informat conv_manifestation_lieu $199. ;
         informat conv_manifestation_organisateur $255. ;
         format entreprise_identifiant $341. ;
         format denomination_sociale $157. ;
         format ligne_identifiant $128. ;
         format ligne_rectification $67. ;
         format benef_categorie_code $30. ;
         format categorie $88. ;
         format benef_nom $230. ;
         format benef_prenom $116. ;
         format benef_qualite_code $18. ;
         format qualite $71. ;
         format benef_adresse1 $262. ;
         format benef_adresse2 $176. ;
         format benef_adresse3 $200. ;
         format benef_adresse4 $127. ;
         format benef_codepostal $10. ;
         format benef_ville $49. ;
         format benef_pays_code $6. ;
         format pays $40. ;
         format benef_titre_code $7. ;
         format benef_titre_libelle $22. ;
         format benef_specialite_code $22. ;
         format benef_speicalite_libelle $51. ;
         format benef_identifiant_type_code $8. ;
         format identifiant_type $8. ;
         format benef_identifiant_valeur $143. ;
         format benef_etablissement $208. ;
         format benef_etablissement_codepostal $10. ;
         format benef_etablissement_ville $88. ;
         format benef_denomination_sociale $255. ;
         format benef_objet_social $260. ;
         format ligne_type $10. ;
         format conv_date_signature $21. ;
         format conv_objet $91. ;
         format conv_objet_autre $259. ;
         format conv_date_debut $10. ;
         format conv_date_fin $11. ;
         format conv_montant_ttc $8. ;
         format conv_manifestation_date $11. ;
         format conv_manifestation_nom $256. ;
         format conv_manifestation_lieu $199. ;
         format conv_manifestation_organisateur $255. ;
      input
                  entreprise_identifiant  $
                  denomination_sociale  $
                  ligne_identifiant  $
                  ligne_rectification  $
                  benef_categorie_code  $
                  categorie  $
                  benef_nom  $
                  benef_prenom  $
                  benef_qualite_code  $
                  qualite  $
                  benef_adresse1  $
                  benef_adresse2  $
                  benef_adresse3  $
                  benef_adresse4  $
                  benef_codepostal  $
                  benef_ville  $
                  benef_pays_code  $
                  pays  $
                  benef_titre_code  $
                  benef_titre_libelle  $
                  benef_specialite_code  $
                  benef_speicalite_libelle  $
                  benef_identifiant_type_code  $
                  identifiant_type  $
                  benef_identifiant_valeur  $
                  benef_etablissement  $
                  benef_etablissement_codepostal  $
                  benef_etablissement_ville  $
                  benef_denomination_sociale  $
                  benef_objet_social  $
                  ligne_type  $
                  conv_date_signature  $
                  conv_objet  $
                  conv_objet_autre  $
                  conv_date_debut  $
                  conv_date_fin  $
                  conv_montant_ttc  $
                  conv_manifestation_date  $
                  conv_manifestation_nom  $
                  conv_manifestation_lieu  $
                  conv_manifestation_organisateur  $
      ;
      if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
run;

/*BDD REMUNERATION */

filename source4 "&path\declaration_remuneration_2020_01_27_04_00.csv" encoding="utf-8" lrecl=32767;

data BDD.REMUNERATION;    
      %let _EFIERR_ = 0; /* set the ERROR detection macro variable */
      infile SOURCE4 delimiter = ';' MISSOVER DSD lrecl=13106 firstobs=2 ;
         informat entreprise_identifiant $181. ;
         informat denomination_sociale $157. ;
         informat ligne_identifiant $128. ;
         informat ligne_rectification $1. ;
         informat benef_categorie_code $5. ;
         informat categorie $88. ;
         informat benef_nom $149. ;
         informat benef_prenom $60. ;
         informat benef_qualite_code $5. ;
         informat qualite $71. ;
         informat benef_adresse1 $188. ;
         informat benef_adresse2 $155. ;
         informat benef_adresse3 $164. ;
         informat benef_adresse4 $71. ;
         informat benef_codepostal $10. ;
         informat benef_ville $39. ;
         informat benef_pays_code $4. ;
         informat pays $40. ;
         informat benef_titre_code $7. ;
         informat benef_titre_libelle $18. ;
         informat benef_specialite_code $7. ;
         informat benef_speicalite_libelle $51. ;
         informat benef_identifiant_type_code $8. ;
         informat identifiant_type $6. ;
         informat benef_identifiant_valeur $143. ;
         informat benef_etablissement $130. ;
         informat benef_etablissement_codepostal $7. ;
         informat benef_etablissement_ville $30. ;
         informat benef_denomination_sociale $228. ;
         informat benef_objet_social $259. ;
         informat ligne_type $3. ;
         informat remu_date $10. ;
         informat remu_montant_ttc best32. ;
         informat remu_convention_liee $77. ;
         format entreprise_identifiant $181. ;
         format denomination_sociale $157. ;
         format ligne_identifiant $128. ;
         format ligne_rectification $1. ;
         format benef_categorie_code $5. ;
         format categorie $88. ;
         format benef_nom $149. ;
         format benef_prenom $60. ;
         format benef_qualite_code $5. ;
         format qualite $71. ;
         format benef_adresse1 $188. ;
         format benef_adresse2 $155. ;
         format benef_adresse3 $164. ;
         format benef_adresse4 $71. ;
         format benef_codepostal $10. ;
         format benef_ville $39. ;
         format benef_pays_code $4. ;
        format pays $40. ;
         format benef_titre_code $7. ;
         format benef_titre_libelle $18. ;
         format benef_specialite_code $7. ;
         format benef_speicalite_libelle $51. ;
         format benef_identifiant_type_code $8. ;
         format identifiant_type $6. ;
         format benef_identifiant_valeur $143. ;
         format benef_etablissement $130. ;
         format benef_etablissement_codepostal $7. ;
         format benef_etablissement_ville $30. ;
         format benef_denomination_sociale $228. ;
         format benef_objet_social $259. ;
         format ligne_type $3. ;
         format remu_date $10. ;
         format remu_montant_ttc best12. ;
         format remu_convention_liee $77. ;
      input
                  entreprise_identifiant  $
                  denomination_sociale  $
                  ligne_identifiant  $
                  ligne_rectification  $
                  benef_categorie_code  $
                  categorie  $
                  benef_nom  $
                  benef_prenom  $
                  benef_qualite_code  $
                  qualite  $
                  benef_adresse1  $
                  benef_adresse2  $
                  benef_adresse3  $
                  benef_adresse4  $
                  benef_codepostal  $
                  benef_ville  $
                  benef_pays_code  $
                  pays  $
                  benef_titre_code  $
                  benef_titre_libelle  $
                  benef_specialite_code  $
                  benef_speicalite_libelle  $
                  benef_identifiant_type_code  $
                  identifiant_type  $
                  benef_identifiant_valeur  $
                  benef_etablissement  $
                  benef_etablissement_codepostal  $
                  benef_etablissement_ville  $
                  benef_denomination_sociale  $
                  benef_objet_social  $
                  ligne_type  $
                  remu_date  $
                  remu_montant_ttc
                  remu_convention_liee  $
      ;
      if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
      run; 


/* Suppression des bugs saut à la ligne */

data bdd.avantage;
	set bdd.avantage;
	where ligne_type = "[A]";
	date_signature = input(avant_date_signature,ddmmyy10.);
	if date_signature = . then delete;
run;

data bdd.convention;
	set bdd.convention;
	where ligne_type = "[C]";
	date_signature = input(conv_date_signature,ddmmyy10.);
	if date_signature = . then delete;
run;

data bdd.remuneration;
	set bdd.remuneration;
	where ligne_type = "[R]";
	date_signature = input(remu_date,ddmmyy10.);
	if date_signature = . then delete;
run;


/* Re-traitement majuscules/minuscules */
/* Création d'une dummy qui prend la valeur 1 si présence d'un montant et 0 sinon */

data bdd.ent;
	set bdd.ent;
	denomination_sociale = upcase(denomination_sociale);
	adresse_1            = upcase(adresse_1);
	adresse_2            = upcase(adresse_2);
	adresse_3            = upcase(adresse_3);
	adresse_4            = upcase(adresse_4);
	ville                = upcase(ville);

run;

data bdd.convention;
	set bdd.convention;
	denomination_sociale            = upcase(denomination_sociale);
	categorie                       = upcase(categorie);
	benef_nom                       = upcase(benef_nom);
	benef_prenom                    = upcase(benef_prenom);
	benef_adresse1                  = upcase(benef_adresse1);
	benef_adresse2                  = upcase(benef_adresse2);
	benef_adresse3                  = upcase(benef_adresse3);
	benef_adresse4                  = upcase(benef_adresse4);
	benef_ville                     = upcase(benef_ville);
	conv_manifestation_nom          = upcase(conv_manifestation_nom);
	conv_manifestation_lieu         = upcase(conv_manifestation_lieu);
	avant_convention_lie            = upcase(avant_convention_lie);
	avant_nature                    = upcase(avant_nature);
	conv_manifestation_organisateur = upcase(conv_manifestation_organisateur);

	conv_objet_autre                = upcase(conv_objet_autre);

	if conv_montant_ttc             = . then dummy_montant = 0;
	else dummy_montant              = 1;
run;

data bdd.avantage;
	set bdd.avantage;
	denomination_sociale       = upcase(denomination_sociale);
	benef_nom                  = upcase(benef_nom);
	benef_prenom               = upcase(benef_prenom);
	avant_nature               = upcase(avant_nature);
	benef_adresse1             = upcase(benef_adresse1);
	benef_adresse2             = upcase(benef_adresse2);
	benef_adresse3             = upcase(benef_adresse3);
	benef_adresse4             = upcase(benef_adresse4);
	benef_ville                = upcase(benef_ville);
    benef_objet_social         = upcase(benef_objet_social);	
	benef_denomination_sociale = upcase(benef_denomination_sociale);

	if avant_montant_ttc       = . then dummy_montant = 0;
	else dummy_montant         = 1;
run;

data bdd.remuneration;
	set bdd.remuneration;
	denomination_sociale       = upcase(denomination_sociale);
	benef_nom                  = upcase(benef_nom);
	benef_prenom               = upcase(benef_prenom);
	avant_nature               = upcase(avant_nature);
	benef_adresse1             = upcase(benef_adresse1);
	benef_adresse2             = upcase(benef_adresse2);
	benef_adresse3             = upcase(benef_adresse3);
	benef_adresse4             = upcase(benef_adresse4);
	benef_ville                = upcase(benef_ville);	
	benef_denomination_sociale = upcase(benef_denomination_sociale);
	benef_objet_social         = upcase(benef_objet_social);

	if remu_montant_ttc        = . then dummy_montant = 0;
	else dummy_montant         = 1;

run; 

";

/***********************************************************/
/* Etude sur les entreprises                               */

proc freq data=bdd.ent nlevels order=freq;
	table pays ;
run;

proc freq data=bdd.ent nlevels order=freq;
	table secteur /  ;
run;

/***********************************************************/
/* Etude sur les avantages                              */

proc freq data=bdd.avantage nlevels;
	table avant_nature ;
run;

proc freq data=bdd.avantage nlevels;
	table denomination_sociale ;
run;

proc freq data=bdd.avantage nlevels;
	table entreprise_identifiant ;
run;

%macro ranking(table);
proc freq data = bdd.&table. ;
table denomination_sociale / out = &table._ranking ;
run;

proc sort data= &table._ranking;
	by descending COUNT;
run;

proc print data=&table._ranking(obs=10);
run;

%mend;

%ranking(convention);

%macro freq_date(table);
ods excel file="C:\Users\theloloboss\Desktop\GBD\Partie2_27012020\Excel\freq_date\&table..xlsx";
proc freq data=bdd.&table.;
format date_signature YEAR4.;
table date_signature  ;
run;
ods excel close;
%mend;

%freq_date(remuneration);



/* On change les tables de la lib BDD pour ne garder que les observations après 2012 */
/*
%macro data_after_2012(table);
data bdd.&table.;
	set bdd.&table.;
	where date_signature > "31dec2011"d;
run;
%mend;

%data_after_2012(remuneration);
%data_after_2012(avantage);
%data_after_2012(convention);*/

/*
%macro sort_date(table);
proc sort data=bdd.&table.;
	by date_signature;
run;
%mend;

%sort_date(remuneration);
%sort_date(avantage);
%sort_date(convention)*/

%macro freq_date_after_2012(table);
ods excel file="F:\Projet\GBD\Partie2_27012020\Excel\freq_date\after_2012\&table..xlsx";
proc freq data=bdd.&table. order=freq;
format date_signature year4.;
table denomination_sociale*date_signature / nocol norow nopercent;
run;
ods excel close;
%mend;

%freq_date_after_2012(remuneration);
%freq_date_after_2012(convention);
%freq_date_after_2012(avantage);



/* Etude sur la table rémunération */

proc freq data= bdd.remuneration order=freq nlevels;
	table categorie;
run;

ods listing;



%macro mix();
%do i= 2012 %to 2019;

proc sql outobs=15 ;
	create table remu_&i. as
	select denomination_sociale,
		   sum(remu_montant_ttc) as somme format eurox20.2
	from bdd.remuneration
	where year(date_signature) = &i.
	group by denomination_sociale
	order by somme desc
; 
quit;

data remu_&i.;
	set remu_&i.;
	label denomination_sociale = "Nom de l'entreprise"
	      somme = "Somme investie";
run;

%end;

%mend;

%mix;


%macro mix2();
%do i= 2012 %to 2019;

proc sql outobs=10 ;
	create table avant_&i. as
	select denomination_sociale,
		   sum(remu_montant_ttc) as somme format eurox20.2
	from bdd.avantage
	where year(date_signature) = &i.
	group by denomination_sociale
	order by somme desc
; 
quit;

data avant_&i.;
	set avant_&i.;
	label denomination_sociale = "Nom de l'entreprise"
	      somme = "Somme investie";
run;


%end;

%mend;

%mix2;


ods html;

%macro medecin(table,prenom,nom,code_postal);
%put &table;
%put &prenom;
%put &nom;
%put &code_postal;

 

data _null_;
table="&table.";
call symputx("nom_prenom",compress(upcase(catx(",","&prenom.","&nom."))));
if table="remuneration" then call symputx("table2","remu");
else call symputx("table2","avant");
run;

%put &table;
%put &prenom;
%put &nom;
%put &code_postal;

 

%put &nom_prenom;
%let scan1 = %scan("&nom_prenom.",2,",");
%let scan2 = %scan("&nom_prenom.",1,",");

%put &scan1.;
%put &scan2.;

proc sql;
    select denomination_sociale,
			COUNT(denomination_sociale) as NB_&table2.,
           SUM(&table2._montant_ttc) as TOT_&table2._PERCU
    from bdd.&table
	where (benef_nom = "&scan1." or benef_nom = "&scan2.") and (benef_prenom = "&scan1." or benef_prenom = "&scan2.") and benef_codepostal = "&code_postal"
	group by denomination_sociale;
quit;

%mend;

%medecin(remuneration,vogt,valerie,67590);
%medecin(remuneration,bordet,regis,59045);
%medecin(remuneration,AOUNI,ABADIE,36160);

/* Test de Listing de tous les médecins sur rémunerations */

proc sql outobs=500;
select distinct benef_identifiant_valeur,
                benef_nom,
				benef_prenom
from bdd.remuneration
where benef_categorie_code= "[PRS]"
;  
quit;

%put &n;

/* Etude sur les pays*/

proc freq data=bdd.ent order=freq;
	*table pays_code;
table pays;
run;

data ent;
	set bdd.ent;
	length Region $50.;
	select;
		when (pays_code in ("[AE]","[AR]","[IL]","[TR]","[LB]")) Region="Moyen-Orient";
		when (pays_code in ("[MA]","[TN]","[DZ]","[ZA]","[CI]")) Region="Afrique";
		when (pays_code in ("[CN]","[KP]","[KR]","[HK]","[IN]","[JP]","[KZ]","[MY]","[SG]","[TH]","[TW]","[AU]","[NZ]")) Region = "Asie / Océanie";
		when (pays_code in ("[AR]","[BR]","[CO]","[CA]","[MX]","[GY]"))Region = "Amérique";
		when (pays_code in ("[FR]","[GP]","[GF]","[MQ]","[RE]")) Region = "France";
		when (pays_code = "[UK]") Region = "Royaume-Uni";
		when (pays_code = "[US]") Region = "Etats-Unis";
		when (pays_code = "[DE]") Region = "Allemagne";
		when (pays_code = "[CH]") Region = "Suisse";
		when (pays_code = "[BE]") Region = "Belgique";
		otherwise Region = "Autres pays d'Europe";
	end;
run;

proc freq data=ent order=freq;
table region;
run;

proc freq data=ent order=freq;
table secteur;
run;

proc tabulate data=ent order=freq;
	class  region secteur ;
	table (region all),(secteur = "Type de produits vendus")*(N = "") / PRINTMISS MISSTEXT="0" INDENT=0;
run;

/* Secteur qui paye le plus*/

proc sql outobs=100;
	select t2.secteur, 
           sum(t1.remu_montant_ttc) as somme format eurox20.2
	from bdd.remuneration as t1 full join bdd.ent as t2 on t2.identifiant=t1.entreprise_identifiant
	group by t2.secteur
	order by somme desc

	;
quit;

proc sql outobs=100;
	select sum(remu_montant_ttc) as somme format eurox20.2
	from bdd.remuneration
	;
quit;

proc sql outobs=100;
	select t1.denomination_sociale, 
           sum(t1.remu_montant_ttc) as somme format eurox20.2
	from bdd.remuneration as t1 full join bdd.ent as t2 on t2.identifiant=t1.entreprise_identifiant
	where secteur = "Dispositifs médicaux"
	group by t1.denomination_sociale
	order by somme desc;
quit;


