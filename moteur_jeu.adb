

package body moteur_jeu  is

   function Choix_Coup(E                    : Etat) return Coup  is
      Coups                                 : Liste_Coups.Liste;
      Gain_max,Gain_Courant, Indice_Max :=0 : Integer;
      Meilleur_Coup                         : Coup;
   begin
      Coups := Coups_Possibles(E,JoueurMoteur);
      for(i=Coups'First;i<Coups'Length;i++) loop
         Gain_Courant := Eval_Min_Max(E,2,Coups[i],JoueurMoteur);
         if Gain_Courant > Gain_max then
            Indice_Max := i;
         end if;
      end loop;
      return Coups[Indice_Max];
   end Choix_Coup;

   --parametres                             : etat, profondeur max de recherche
   --retourn gain attendu pour cet etat
   function Eval_Min_Max(E : Etat; P : Natural; C : Coup; J : Joueur) return Integer is
      P_courant := P                        : Natural
      begin

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

                  return Eval_Min_Max(E,P_Courant-1, Min(Coups_Possibles(E,Adversaire(J)),J);
                                      else


                                         return Eval_Min_Max(E,P_Courant-1,Max(Coups_Possibles(E,J)),J);
                                      end if;
                                      end if;

                                      P_Courant := P_Courant -1;
                                      end loop;
                                      return Eval(E);


                                      end Eval_Min_Max;



                                      end moteur_jeu;

