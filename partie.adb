with Ada.Text_IO; use Ada.Text_IO;

package body partie is

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


end partie;
