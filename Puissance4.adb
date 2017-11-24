with Ada.Text_IO; use Ada.Text_IO;

package body Puissance4 is

  type Etat is array(0..8) of integer;
  type Coup is record
    Col : integer range 0..2;
    J : Joueur;
  end record;

  function Etat_Suivant(E : Etat; C : Coup) return Etat is
  begin
    for i in 0..2 loop
      if E(C.Col +3*i) = 3 then
        E(C.Col+ 3*i) := C.J;
        return E;
      end if;
    end loop;
    return E;
  end Etat_Suivant;

  function Est_Gagnant(E: Etat; J: Joueur) return Boolean is
    Compteur : Integer;
  begin
    -- on commence par regarder les lignes
    for i in 0..2 loop
      Compteur := 0;
      for j in 0..2 loop
        if E(j+3*i) = J then
          Compteur := Compteur +1;
        end if;
        if Compteur = 3 then
          return true;
        end if;
      end loop;
    end loop;

    -- on fait les colonnes
    for i in 0..2 loop
      Compteur := 0;
      for j in 0..2 loop
        if E(i+3*j) = J then
          Compteur := Compteur +1;
        end if;
        if Compteur = 3 then
          return true;
        end if;
      end loop;
    end loop;

    -- on fait les diagonales
    if E(0) = E(4) and E(4) = E(8) and E(8) = J then
      return true;
    end if;

    if E(2) = E(4) and E(4) = E(6) and E(6) = J then
      return true;
    end if;

    return false;
  end Est_Gagnant;

  function Est_Nul(E: Etat) return Boolean is
  begin
    if not Est_Gagnant(E, Joueur1) then
      if not Est_Gagnant(E, Joueur2) then
        return true;
      end if;
    end if;
    return false;
  end Est_Nul;

  procedure Affiche_Jeu(E : Etat) is
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
  end Affiche_Jeu;

  procedure Affiche_Coup(C : Coup) is
    begin
      put_line("Le joueur " & (C.J +1) & " a joué dans la colonne " & (C.Col +1));

    end Affiche_Coup;


  function Coup_Joueur1(E : Etat) return Coup is
    Col : integer;
    Cp : Coup;
  begin
    put_line("Insérez le numéro de colonne ou vous voulez jouer : 1,2 ou 3");
    get(Col);
    if E(Col+5) /= 3 then
      put_line("La colonne est pleine");
      return Coup_Joueur1(E);
    end if;
    Cp.Col := Col-1;
    Cp.J := 0;
    return Cp;
  end Coup_Joueur1;

  function Coup_Joueur2(E : Etat) return Coup is
    Col : integer;
    Cp : Coup;
  begin
    put_line("Insérez le numéro de colonne ou vous voulez jouer : 1,2 ou 3");
    get(Col);
    if E(Col+5) /= 3 then
      put_line("La colonne est pleine");
      return Coup_Joueur2(E);
    end if;
    Cp.Col := Col-1;
    Cp.J := 1;
    return Cp;
  end Coup_Joueur2;
end Puissance4;
