package body Participant is

   ----------------
   -- Adversaire --
   ----------------

   function Adversaire (J : Joueur) return Joueur is
   begin

      if J = Joueur1 then
         return Joueur2;
      elsif J = Joueur2 then
         return Joueur1;
      else
         return Vide;
      end if;
   end Adversaire;

end Participant;
