with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Puissance4 is

   procedure Initialiser(E : in out Etat) is
   begin
      for i in 0..largeur-1 loop
        for k in 0..hauteur-1 loop
           E(i,k) := Vide;
        end loop;
      end loop;
   end Initialiser;



  function Jouer(E : Etat; C : in Coup) return Etat is
      --nb_diags : integer;
      E_suivant : Etat:= E;
  begin
    for k in 0..(hauteur-1) loop
      if E_suivant(C.Col,k) = Vide then
        E_suivant(C.Col,k) := C.J;
        return E_suivant;
      end if;
    end loop;
    return E;
  end Jouer;

  function Est_Gagnant(E: Etat; J: Joueur) return Boolean is
    Compteur : Integer;
    nb_diags : Integer;
    c_diags : Integer;
  begin
    -- on commence par regarder les lignes
    for k in 0..(hauteur-1) loop
      Compteur := 0;
      for i in 0..(largeur-1) loop
        if E(i,k) = J then
          Compteur := Compteur +1;
        else
          Compteur := 0;
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
        if E(i,k) = J then
          Compteur := Compteur +1;
        else
          Compteur := 0;
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
      for d in (-c_diags)..c_diags loop
        Compteur := 0;
          for k in ABS(Integer'Min(0,d))..hauteur-Integer'Max(0,d)-1 loop
            if E(k,k+d) = J then
              Compteur := Compteur +1;
            else
              Compteur := 0;
            end if;
            if Compteur = nb_pions_victoire then
              return true;
            end if;
          end loop;

        Compteur := 0;
        for k in ABS(Integer'Min(0,d))..hauteur-Integer'Max(0,d)-1 loop
          if E(k,hauteur-1-k-d) = J then
            Compteur := Compteur +1;
          else
            Compteur := 0;
          end if;
          if Compteur = nb_pions_victoire then
            return true;
          end if;
        end loop;
      end loop;
    end if;

    return false;
  end Est_Gagnant;

  function Est_Nul(E: Etat) return Boolean is
   begin

      --pas besoin de v�rifier que le plateau est rempli de pions ?
      -- si ;)
    if Est_Plein(E) then
      if not Est_Gagnant(E, Joueur1) then
        if not Est_Gagnant(E, Joueur2) then
          return true;
        end if;
      end if;
    end if;
    return false;
  end Est_Nul;

  procedure Afficher(E : Etat) is
  begin
    for k in 1..largeur loop
      put(Integer'Image(k));
    end loop;
    New_Line;
    for k in reverse 0..(hauteur-1) loop
      for i in 0..(largeur-1) loop
        put("|");
        if E(i,k) = Joueur1 then
          put("X");
          elsif E(i,k) = Joueur2 then
            put("O");
          else
            put(" ");
          end if;
      end loop;
      put("|");
      New_Line;
    end loop;
    for k in 1..largeur loop
      put(Integer'Image(k));
    end loop;
    New_Line;
  end Afficher;

  procedure Affiche_Coup(C : Coup) is
    begin
      put_line("Le " & Joueur'Image (C.J) & " a joué dans la colonne " & Integer'Image(C.Col +1));

    end Affiche_Coup;


  function Demande_Coup_Joueur1(E : Etat) return Coup is
    Col : integer;
    Cp : Coup;
  begin
    put_line("Insérez le numéro de colonne ou vous voulez jouer : ");
    get(Col);
    skip_line;
    if Joueur'Pos (E(Col-1,hauteur-1)) /= 2 then
      put_line("La colonne est pleine");
      return Demande_Coup_Joueur1(E);
    end if;
    Cp.Col := Col-1;
    Cp.J := Joueur1;
    return Cp;
  end Demande_Coup_Joueur1;

  function Demande_Coup_Joueur2(E : Etat) return Coup is
    Col : integer;
    Cp : Coup;
  begin
    put_line("Insérez le numéro de colonne ou vous voulez jouer : ");
    get(Col);
    if Joueur'Pos (E(Col-1, hauteur-1)) /= 2 then
      put_line("La colonne est pleine");
      return Demande_Coup_Joueur2(E);
    end if;
    Cp.Col := Col-1;
    Cp.J := Joueur2;
    return Cp;
  end Demande_Coup_Joueur2;

function Est_Plein (E : Etat) return Boolean  is
begin
  for i in 0..largeur-1 loop
    for k in 0..hauteur-1 loop
      if E(i,k) = Vide then
        return false;
      end if;
    end loop;
  end loop;
  return true;
end Est_Plein;

   -- Retourne la liste des coups possibles pour J a partir de l'etat
   function Coups_Possibles(E : Etat; J : Joueur) return Liste_Coups.Liste is
      C : Integer;
      Cp : Coup;
      L : Liste_Coups.Liste;
   begin
      for i in 0..(hauteur-1) loop
         for C in 0..(largeur-1) loop
<<<<<<< HEAD
            if E(C,i) = Vide then
=======
            if E(i,C + largeur*i) = Vide then
>>>>>>> 8ac421e6567dc62fb97bf383d363a6a0fcb15e61
               Cp.Col := C;
               Cp.J:=J;
               Liste_Coups.Insere_Tete(Cp,L);
            end if;
         end loop;
      end loop;
      return L;
   end Coups_Possibles;

   function Aligned(E : Etat; J : Joueur) return Positive is
      Nb_Aligned : Positive;
   begin
       for i in 1..(hauteur-1) loop
         for k in 1..(largeur-1) loop

            if E(i,k) = J then
              if E(i,k-1) = J then
               Nb_Aligned := Nb_Aligned+1;

            elsif E(i-1,k) = J then
               Nb_Aligned := Nb_Aligned+1;

               elsif E(i-1,k-1) = J then
               Nb_Aligned := Nb_Aligned+1;

            elsif E(i,k+1) = J then
               Nb_Aligned := Nb_Aligned+1;

               elsif E(i+1,k) = J then
               Nb_Aligned := Nb_Aligned+1;

               elsif E(i+1,k+1) = J then
               Nb_Aligned := Nb_Aligned+1;
               end if;
               end if;

         end loop;
      end loop;

      return Nb_Aligned;
      end Aligned;

   -- Evaluation statique du jeu du point de vue de l'ordinateur
   function Eval(E : Etat) return Integer is
      Nb_Aligned, Nb_Aligned_Op : Positive;
      Opponent : Joueur := Adversaire(JoueurMoteur);
   begin
      return (Aligned(E,JoueurMoteur) - Aligned(E,Adversaire(JoueurMoteur)));

   end Eval;

end Puissance4;
