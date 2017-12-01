with Participant; use Participant; 
with Liste_Generique;
with Ada.Text_IO;

package moteur_jeu_puissance4 is

   type Etat is array(0..8) of Integer;
   type Coup is record
      Col : integer range 0..2;
      J : Joueur;
   end record;
   
   function Etat_Suivant(E : Etat; C : Coup) return Etat;
   
   function Est_Gagnant(E : Etat; J : Joueur) return Boolean; 
   function Est_Nul(E : Etat) return Boolean; 
   procedure Affiche_Coup(C : in Coup);
   package Liste_Coups is new Liste_Generique(Coup, Affiche_Coup); 
   function Coups_Possibles(E : Etat; J : Joueur)
                            return Liste_Coups.Liste; 
   function Eval(E : Etat) return Integer;  
   

end moteur_jeu_puissance4;
