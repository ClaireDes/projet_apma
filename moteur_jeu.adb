

package body moteur_jeu  is

   function Choix_Coup(E                    : Etat) return Coup  is
      Coups                                 : Liste_Coups.Liste;
      Gain_max,Gain_Courant : Integer;
      Meilleur_Coup                         : Coup;
      It : Iterateur;
   begin
      Coups := Coups_Possibles(E,JoueurMoteur);
      It := Creer_Iterateur(Coups);
      while (Element_Courant(It) /= null) loop
         Gain_Courant := Eval_Min_Max(E,2,Element_Courant(It),JoueurMoteur);
         if Gain_Courant > Gain_max then
            Meilleur_Coup := Element_Courant(It);
             end if;
         Suivant(It);
      end loop;
      return Meilleur_Coup;
   end Choix_Coup;

   --parametres                             : etat, profondeur max de recherche
   --retourn gain attendu pour cet etat
   function Eval_Min_Max(E : Etat; P : Natural; C : Coup; J : Joueur) return Integer is
      P_Courant                      : Natural;
        Coups : Liste_Coups;
      Gain_Courant, Gain_Min , Gain_Max : Integer;
      Coup_Choisi : Coup;
      It : Iterateur;
   begin
      Gain_Max := -largeur*hauteur;
      Gain_Min := - Gain_Max;
         P_Courant := P;
         while P_Courant > 0 loop


            --on a atteint un etat terminal
            if Est_Gagnant(E,J) then
               return largeur*hauteur;
            elsif Est_Gagnant(E,Adversaire(J)) then
               return -largeur*hauteur;
            elsif Est_Nul(E) then
               return 0;

            else
               --si c'est a l'adversaire de jouer on prend le min
               if ((P/2)=1) then

               Coups := Coups_Possibles(E,Adversaire(J));
               It := Creer_Iterateur(Coups);
               while (Element_Courant(It) /= null) loop
                  Gain_Courant := Eval_Min_Max(E, P_Courant-1, Element_Courant(It), J);
                  if Gain_Courant < Gain_Min then
                     Gain_Min := Gain_Courant;
                     Coup_Choisi := Element_Courant(It);
                  end if;
                    Suivant(It);
               end loop;


               else

               Coups := Coups_Possibles(E,Adversaire(J));
               It := Creer_Iterateur(Coups);
               while (Element_Courant(It) /= null) loop
                  Gain_Courant := Eval_Min_Max(E, P_Courant-1, Element_Courant(It), J);
                  if Gain_Courant >= Gain_Max then
                     Gain_Max := Gain_Courant;
                     Coup_Choisi := Element_Courant(It);
                  end if;
                    Suivant(It);
               end loop;

                  return Coup_Choisi;

               end if;
            end if;

         P_Courant := P_Courant -1;
      end loop;
      return Eval(E, JoueurMoteur);


   end Eval_Min_Max;



end moteur_jeu;
