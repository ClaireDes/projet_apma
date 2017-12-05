package body Liste_Generique is

   type Iterateur_Interne is null record;

   type Cellule is null record;

   -------------------
   -- Affiche_Liste --
   -------------------

   procedure Affiche_Liste (L : in Liste) is
   begin
      Put("(");
      Put(Element_Courant(Iterateur_Interne).Cellule.Valeur);
      while (A_Suivant(Iterateur_Interne)) loop
         Put(",");
         Suivant(Iterateur_Interne);
         Put(Element_Courant(Iterateur_Interne).Cellule.Valeur);
      end loop;
      Put(")");
   end Affiche_Liste;

   -----------------
   -- Insere_Tete --
   -----------------

   procedure Insere_Tete (V : in Element; L : in out Liste) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Insere_Tete unimplemented");
      raise Program_Error with "Unimplemented procedure Insere_Tete";
   end Insere_Tete;

   ------------------
   -- Libere_Liste --
   ------------------

   procedure Libere_Liste (L : in out Liste) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Libere_Liste unimplemented");
      raise Program_Error with "Unimplemented procedure Libere_Liste";
   end Libere_Liste;

   -----------------
   -- Creer_Liste --
   -----------------

   function Creer_Liste return Liste is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Creer_Liste unimplemented");
      raise Program_Error with "Unimplemented function Creer_Liste";
      return Creer_Liste;
   end Creer_Liste;

   ---------------------
   -- Creer_Iterateur --
   ---------------------

   function Creer_Iterateur (L : Liste) return Iterateur is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Creer_Iterateur unimplemented");
      raise Program_Error with "Unimplemented function Creer_Iterateur";
      return Creer_Iterateur (L => L);
   end Creer_Iterateur;

   ----------------------
   -- Libere_Iterateur --
   ----------------------

   procedure Libere_Iterateur (It : in out Iterateur) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Libere_Iterateur unimplemented");
      raise Program_Error with "Unimplemented procedure Libere_Iterateur";
   end Libere_Iterateur;

   -------------
   -- Suivant --
   -------------

   procedure Suivant (It : in out Iterateur) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Suivant unimplemented");
      raise Program_Error with "Unimplemented procedure Suivant";
   end Suivant;

   ---------------------
   -- Element_Courant --
   ---------------------

   function Element_Courant (It : Iterateur) return Element is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "Element_Courant unimplemented");
      raise Program_Error with "Unimplemented function Element_Courant";
      return Element_Courant (It => It);
   end Element_Courant;

   ---------------
   -- A_Suivant --
   ---------------

   function A_Suivant (It : Iterateur) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "A_Suivant unimplemented");
      raise Program_Error with "Unimplemented function A_Suivant";
      return A_Suivant (It => It);
   end A_Suivant;

end Liste_Generique;
