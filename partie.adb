with Liste_Generique, Participant;
with Ada.Text_IO;
use Ada.Text_IO;
use Participant;

package body partie is

procedure Joue_Partie(E: in out Etat; J: in Joueur) is
  C : Coup;
begin
  put_line("C'est au " & Joueur'Image (J) & " de jouer.");
  if Joueur'Pos (J) = 0 then
    c := Coup_Joueur1(E);
    Affiche_Coup(C);
    Affiche_Jeu(E);
    if Est_Gagnant(E,J) then
        put_line("Bravo joueur 1 tu as gagné !");
    elsif Est_Nul(E) then
        put_line("Dommage vous avez fait match nul..");
    end if;
  end if;

  if Joueur'Pos (J) = 1 then
    c := Coup_Joueur2(E);
    Affiche_Coup(C);
    Affiche_Jeu(E);
    if Est_Gagnant(E,J) then
        put_line("Bravo joueur 2 tu as gagné !");
    elsif Est_Nul(E) then
        put_line("Dommage vous avez fait match nul..");
    end if;
  end if;
end Joue_Partie;

end partie;
