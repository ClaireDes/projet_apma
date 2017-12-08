

package body moteur_jeu_puissance4  is

   
   
   -- Retourne la liste des coups possibles pour J a partir de l'etat 
   function Coups_Possibles(E : Etat; J : Joueur) return Liste_Coups.Liste is
      C : new Coup'(0,J);
      L : Liste_Coups.Liste;
   begin
      for i in 0..(hauteur-1) loop
         for C in 0...(largeur-1) loop
            if E(C.Col + largeur*i) = Vide then
               Insere_Tete(C,L);
            end if;
            C.Col = C.Col + 1;
         end loop;
      end loop;
      return L;
   end Coups_Possibles;
   
   -- Evaluation statique du jeu du point de vue de l'ordinateur
   function Eval(E : Etat) return Integer is
   begin
      
   end Eval;
   
   

end moteur_jeu_puissance4;
