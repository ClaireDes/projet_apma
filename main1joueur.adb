with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Puissance4;
with Participant;
with Partie;
with Liste_Generique;

use Ada.Text_IO;
use Ada.Integer_Text_IO;
use Participant;

procedure main1joueur is

   
      package MyPuissance4 is new Puissance4(6,6,4);

   package MyMoteurPuissance4 is new moteur_jeu_puissance4();
   
    package MyPartie is new Partie(MyMoteurPuissance4.Etat,
				  MyMoteurPuissance4.Coup,
				  "Pierre",
				  "Paul",
				  MyPuissance4.Jouer,
				  MyMoteurPuissance4.Est_Gagnant,
				  MyMoteurPuissance4.Est_Nul,
				  MyPuissance4.Afficher,
				  MyMoteurPuissance4.Affiche_Coup,
				  MyPuissance4.Demande_Coup_Joueur1,
				  MyMoteurPuissance4.Choix_Coup);
   use MyPartie;

   P: MyPuissance4.Etat;

begin
   Put_Line("Puissance 4");
   Put_Line("");
   Put_Line("Joueur 1 : X");
   Put_Line("Joueur 2 : O");

   MyPuissance4.Initialiser(P);

   Joue_Partie(P, Joueur2);
   
end main1joueur;
