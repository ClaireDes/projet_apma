with Liste_Generique, Participant;
with Ada.Text_IO;
use Participant;

generic
   
   --paramètres de généricité
   largeur:Positive ;
   hauteur:Positive ;
   nb_pions_victoire:Positive;
   
package Puissance4 is

   --Le plateau est un ensemble de colonnes
   --Donc on doit créer un tableau quelque part non ?
   
   --ensemble des pions déjà placés
   type Etat is 
      record
         plateau:
      end record;
            
   
   type Coup is 
      record
         colonne:Positive;
      end record;
      
      
   
   procedure Initialiser(E : Etat);
   
   --deposer le pion dans la case vide la plus basse
   function Jouer(E : Etat; C : Coup) return Etat;
   
   --le nombre de pions  fixé est aligné (horizontal, vertical
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
