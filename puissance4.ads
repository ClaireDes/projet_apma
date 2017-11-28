

generic
  Nb_Lignes : Integer;
  Nb_Colonnes : Integer;
  Aligne : Integer;

package Puissance4 is

  function Etat_Suivant(E : Etat; C : Coup) return Etat;

  function Est_Gagnant(E: Etat; J: Joueur) return Boolean;

  function Est_Nul(E: Etat) return Boolean;

  procedure Affiche_Jeu(E : Etat);

  procedure Affiche_Coup(C : Coup);

  function Coup_Joueur1(E : Etat) return Coup;

  function Coup_Joueur2(E : Etat) return Coup;
  
end Puissance4;
