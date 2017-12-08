with Participant; use Participant; 
with Liste_Generique;
with Ada.Text_IO;
with Puissance4;
with Participant;

package moteur_jeu_puissance4 is

   
   package MyPuissance4 is new Puissance4(6,6,4);
   use MyPuissance4;
   

   package Liste_Coups is new Liste_Generique(Coup,Affiche_Coup); 
   function Coups_Possibles(E : Etat; J : Joueur)
                            return Liste_Coups.Liste; 
   function Eval(E : Etat) return Integer;  
   

end moteur_jeu_puissance4;
