with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Puissance4 is

   procedure Initialiser(E : in out Etat) is
   begin
      for i in 0..hauteur*largeur-1 loop
         E(i) := Vide;
         end loop;
   end Initialiser;



  function Jouer(E : Etat; C : in Coup) return Etat is
      --nb_diags : integer;
      E_suivant : Etat:= E;
  begin
    for i in 0..(hauteur-1) loop
      if E_suivant(C.Col + largeur*i) = Vide then
        E_suivant(C.Col + largeur*i) := C.J;
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

  function Est_Nul(E: Etat) return Boolean is
   begin

      --pas besoin de v�rifier que le plateau est rempli de pions ?
    if not Est_Gagnant(E, Joueur1) then
      if not Est_Gagnant(E, Joueur2) then
        return true;
      end if;
    end if;
    return false;
  end Est_Nul;

  procedure Afficher(E : Etat) is
  begin
    for i in reverse 0..2 loop
      for j in 0..2 loop
        put("|");
        if E(j+3*i) = Joueur1 then
          put("X");
          elsif E(j+3*i) = Joueur2 then
            put("O");
          else
            put(" ");
          end if;
      end loop;
      put("|");
      New_Line;
    end loop;
  end Afficher;

  procedure Affiche_Coup(C : Coup) is
    begin
      put_line("Le joueur " & Joueur'Pos (C.J) + 1 & " a joué dans la colonne " & (C.Col +1));

    end Affiche_Coup;


  function Demande_Coup_Joueur1(E : Etat) return Coup is
    Col : integer;
    Cp : Coup;
  begin
    put_line("Insérez le numéro de colonne ou vous voulez jouer : ");
    get(Col);
    skip_line;
    if Joueur'Pos (E(Col+5)) /= 3 then
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
    if Joueur'Pos (E(Col+5)) /= 3 then
      put_line("La colonne est pleine");
      return Demande_Coup_Joueur2(E);
    end if;
    Cp.Col := Col-1;
    Cp.J := Joueur2;
    return Cp;
  end Demande_Coup_Joueur2;
end Puissance4;
