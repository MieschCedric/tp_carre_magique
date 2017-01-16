//ALGO: carre magique
//BUT:	utiliser tableau a 2 dimensions.
//	1er entier : "1" se trouve au nord du milieu de la table
//	On place les chiffres de facon croissante en allant au Nord Est de la position courante.
//	Si place deja prise, on se deplace au Nord Ouest jusqu'a trouver une place libre.
//	Tableau considere comme spherique, si on arrive au-delà de la dernière colonne, on arrive au dela de la premiere colonne de meme pour les lignes.
//	Decouper programme en procedures et fonctions.
//ENTREE: Confirmation pour lancer le prochain affichage a chaque nombre ajoute
//SORTIEE: Affichage matrice du carre magique
//
//CONST
//	MAX=5
//	
//TYPE
//	Tableau2dim:tableau[1..MAX,1..MAX] DE ENTIER
//
//Procedure affichage(tab4:Tableau2dim)			
//	VAR
//		i,j:ENTIER
//			
//	DEBUT
//		POUR j <- 1 A MAX FAIRE
//			DEBUT
//				POUR i <- 1 A MAX FAIRE
//					DEBUT
//						SI tab4[i,j]<=9 ALORS  
//							ECRIRE("  "& tab4[i,j]) 
//						SINON
//							ECRIRE(" "& tab4[i,j])	
//						FINSI
//					FIN
//				ECRIRE 
//				FINPOUR
//			FIN
//		FINPOUR
//	FIN	
//
//Procedure testbordureroite(var tbdx:ENTIER; var tbdy:ENTIER)
//
//	DEBUT
//		SI tbdx>MAX ALORS 
//			DEBUT
//				tbdx <- 1  		
//			FIN
//		FINSI
//		SI tbdy<1 ALORS 
//			DEBUT
//				tbdy <- MAX  
//			FIN
//		FINSI
//	FIN
//
//Procedure testborduregauche(var tbgx:ENTIER; var tbgy:ENTIER) 
//
//	DEBUT
//		SI tbgx-1<1 ALORS
//			tbgx <- MAX  
//		SINON
//			tbgx <- x2-1  
//		FINSI
//		SI tbgy-1<1 ALORS
//			tbgy <- MAX  
//		SINON
//			tbgy <- tbgy-1  
//		FINSI
//	FIN
//
//Fonction test (tab2:Tableau2dim; tx:ENTIER ; tx:ENTIER) 
//	
//	DEBUT
//		SI tab2[tx,ty]=0 ALORS
//			Test <- VRAI 
//		SINON
//			Test <- FAUX  
//		FINSI
//	FIN	
//
//Procedure initialisation(VAR mtrc1:Tableau2dim; VAR abs:ENTIER; VAR ord:ENTIER)
//	
//	VAR
//		i,j:ENTIER
//			
//	DEBUT
//		POUR j <- 1 A MAX FAIRE
//			DEBUT
//				POUR i <- 1 A MAX FAIRE
//					DEBUT
//						mtrc1[i,j] <- 0
//					FIN
//				ECRIRE
//				FINPOUR
//			FIN
//		mtrc1[(MAX/2)+1,(MAX/2) <- 1]
//		abs <- ((MAC/2)+1)
//		ord <- (MAX/2)
//		FINPOUR
//	FIN	
//
//Procedure remplissage(VAR tab:Tableau2dim; VAR x:ENTIER; VAR y:ENTIER)  
//	
//	VAR
//		i,j:ENTIER
//			
//	DEBUT
//		POUR i <- 2 A (MAX*MAX) FAIRE 
//			x <- x+1
//			y <- y-1 
//			TestBordureDroite(x,y) //Lancement procédure TestBordureDroite, verification coodonnées dépassent bordure droite ET/OU sommet
//			SI (Test(tab,x,y)=FAUX) ALORS //Test(tab,x,y)=VRAI
//				DEBUT
//					REPETER
//						TestBordureGauche(x,y)  
//					JUSQU'A (Test(tab,x,y)=VRAI)
//					FINREPETER 
//				FIN
//			tab[x,y] <- i  
//			LIRE Affichage(tab)
//			FINSI  
//		FINPOUR
//	FIN
//
//
//VAR
//	mtrc:Tableau2dim
//	abscisse,ordonnee:ENTIER
//	
//DEBUT
//	mtrc <- initialisation 
//	abscisse <- initialisation
//	ordonnee <- initialisation
//	Remplissage(matrice,abscisse,ordonnee)
//	LIRE
//FIN


Program Carre_magique;

Uses crt, math;

CONST
	MAX=5;

TYPE
	Tableau2dim=array[1..MAX,1..MAX] OF INTEGER;

Procedure affichage(tab4:Tableau2dim);	

VAR	
i,j:INTEGER;
			
BEGIN
	FOR j:= 1 TO MAX DO
		BEGIN
			FOR i:=1 TO MAX DO
				BEGIN
					IF (tab4[i,j]<=9) THEN  
						write('  ',tab4[i,j]) 
					ELSE
						write(' ',tab4[i,j])	
				END;
			writeln;
				
		END;
		
END;

Procedure testborduredroite(var tbdx:INTEGER; var tbdy:INTEGER);

BEGIN
	IF tbdx>MAX THEN 
		BEGIN
			tbdx:=1;  		
		END;
		IF (tbdy<1) THEN
		BEGIN
			tbdy:=MAX;  
		END;
	
END;

Procedure testborduregauche(var tbgx:INTEGER; var tbgy:INTEGER);

BEGIN
	IF tbgx-1<1 THEN
		BEGIN
			tbgx:=MAX;
		END
	ELSE
		BEGIN
			tbgx:=(tbgx-1);
		END;
	IF (tbgy-1<1) THEN
		BEGIN
			tbgy:=MAX;
		END
	ELSE
		tbgy:=tbgy-1
	
END;

Function test (tab2:Tableau2dim; tx:INTEGER; ty:INTEGER):BOOLEAN;
	
BEGIN
	IF tab2[tx,ty]=0 THEN
		Test:=TRUE
	ELSE
		Test:=FALSE 
END;

Procedure initialisation(VAR mtrc1:Tableau2dim; VAR abs:INTEGER; VAR ord:INTEGER);
	
VAR
	i,j:INTEGER;
			
BEGIN
	FOR j:=1 TO MAX DO
		BEGIN
			FOR i:=1 TO MAX DO
				BEGIN
					mtrc1[i,j]:=0;
				END;
			writeln
		END;
	mtrc1[(MAX DIV 2)+1,(MAX DIV 2)]:=1;
	abs:=((MAX DIV 2)+1);
	ord:=(MAX DIV 2);
END;		

Procedure remplissage(VAR tab:Tableau2dim; VAR x:INTEGER; VAR y:INTEGER);  
	
VAR
	i,j:INTEGER;
			
BEGIN
	FOR i:=2 TO (MAX*MAX) DO
		BEGIN
		x:=x+1;
		y:=y-1; 
		TestBordureDroite(x,y);
		IF (Test(tab,x,y)=FALSE) THEN
			BEGIN
				REPEAT
					TestBordureGauche(x,y); 
				UNTIL (Test(tab,x,y)=TRUE);
			END;
		tab[x,y]:=i;
		clrscr; 
		Affichage(tab); 
		END;
END;


VAR
	mtrc:Tableau2dim;
	abscisse,ordonnee:INTEGER;
	
BEGIN 
	Initialisation(mtrc, abscisse,ordonnee);
	Remplissage(mtrc,abscisse,ordonnee);
	readln;
END.
