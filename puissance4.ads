with Liste_Generique, Participant;
with Ada.Text_IO;
use Participant;

generic

   --param�tres de g�n�ricit�
   largeur:Positive ;
   hauteur:Positive ;
   nb_pions_victoire:Positive;

package Puissance4 is

   --Le plateau est un ensemble de colonnes
   --Donc on doit cr�er un tableau quelque part non ?

   type Etat is array(0..8) of Integer;
   type Coup is record
      Col : integer range 0..2;
      J : Joueur;
   end record;


   procedure Initialiser(E : Etat);

   --deposer le pion dans la case vide la plus basse
   function Jouer(E : in out Etat; C : Coup) return Etat;

   --le nombre de pions  fix� est align� (horizontal, vertical
   --ou diagonal
   function Est_Gagnant(E : Etat; J : Joueur) return Boolean;
   --toutes les cases sont pleines sans alignement
   function Est_Nul(E : Etat) return Boolean;
   procedure Afficher(E : Etat);
   procedure Affiche_Coup(C : in Coup);

   --A chaque tour le joueur choisit la colonne dans laquelle
   --mettre son pion
   --si la colonne est plein : erreur
   function Demande_Coup_Joueur1(E : Etat) return Coup;
   function Demande_Coup_Joueur2(E : Etat) return Coup;


end Puissance4;
