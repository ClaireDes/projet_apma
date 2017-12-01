

package body moteur_jeu_puissance4  is

   -- Calcule l'etat suivant en appliquant le coup
   function Etat_Suivant(E : Etat; C : Coup) return Etat is 
   begin
      
   end Etat_Suivant;
   
    -- Indique si l'etat courant est gagnant pour J
   function Est_Gagnant(E : Etat; J : Joueur) return Boolean is 
   begin
      
   end Est_Gagnant;
   
    -- Indique si l'etat courant est un status quo (match nul)
   function Est_Nul(E : Etat) return Boolean is 
   begin
      
   end Est_Nul;
   

    -- Affiche a l'ecran le coup passe en parametre
   procedure Affiche_Coup(C : in Coup) is 
   begin
      
   end Affiche_Coup;
   
   
   -- Retourne la liste des coups possibles pour J a partir de l'etat 
   function Coups_Possibles(E : Etat; J : Joueur) return Liste_Coups.Liste is
   begin
      
   end Coups_Possibles;
   
   -- Evaluation statique du jeu du point de vue de l'ordinateur
   function Eval(E : Etat) return Integer is
   begin
      
   end Eval;
   
   

end moteur_jeu_puissance4;
