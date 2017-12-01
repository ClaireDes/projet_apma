

package body moteur_jeu_puissance4  is

   -- Calcule l'etat suivant en appliquant le coup
   function Etat_Suivant(E : Etat; C : Coup) return Etat is 
      E_suivant : Etat := E;
      for i in 0..(hauteur-1) loop
      if E_suivant(C.Col + largeur*i) = Vide then
        E_suivant(C.Col + largeur*i) := C.J;
        return E_suivant;
      end if;
    end loop;
    return E;
   end Etat_Suivant;
   
   -- Indique si l'etat courant est gagnant pour J
   function Est_Gagnant(E : Etat; J : Joueur) return Boolean is 
   
      Compteur            : Integer;
      nb_diags            : Integer;
      c_diags             : Integer;
   begin
      -- on commence par regarder les lignes
      for i in 0..(hauteur-1) loop
         Compteur := 0;
         for k in 0..(largeur-1) loop
            if E(k+largeur*i) = J then
               Compteur := Compteur +1;
            end if;
            if Compteur = nb_pions_victoire then
               return true;
            end if;
         end loop;
      end loop;

      -- on fait les colonnes
      for i in 0..(largeur-1) loop
         Compteur := 0;
         for k in 0..(hauteur-1) loop
            if E(i+largeur*k) = J then
               Compteur := Compteur +1;
            end if;
            if Compteur = nb_pions_victoire then
               return true;
            end if;
         end loop;
      end loop;

      -- on fait les diagonales
      nb_diags := 2*(hauteur - nb_pions_victoire)+1;
      c_diags := nb_diags/2;
      -- il faudrait faire le min de hauteur et largeur
      if nb_diags > 0 then
         for i in (-c_diags)..c_diags loop
            Compteur := 0;
            for k in 0..(hauteur-ABS(c_diags)) loop
               if E(k+i+largeur*k) = J then
                  Compteur := Compteur +1;
               end if;
               if Compteur = nb_pions_victoire then
                  return true;
               end if;
            end loop;

            Compteur := 0;
            for k in 0..(hauteur-ABS(c_diags)) loop
               if E(k+i+largeur*k) = J then
                  Compteur := Compteur +1;
               end if;
               if Compteur = nb_pions_victoire then
                  return true;
               end if;
            end loop;
         end loop;
      end if;

      return false;
   end Est_Gagnant;
   
   -- Indique si l'etat courant est un status quo (match nul)
   function Est_Nul(E     : Etat) return Boolean is 
   begin

      --pas besoin de v�rifier que le plateau est rempli de pions ?
    if not Est_Gagnant(E, Joueur1) then
      if not Est_Gagnant(E, Joueur2) then
        return true;
      end if;
    end if;
    return false;
   end Est_Nul;
   
   
    -- Affiche a l'ecran le coup passe en parametre
   procedure Affiche_Coup(C : in Coup) is 
   begin
      put_line("Le " & Joueur'Image (C.J) & " a joué dans la colonne " & Integer'Image(C.Col +1));

   end Affiche_Coup;
   
   
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
