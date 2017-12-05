with Ada.Text_IO;
with Ada.Integer_Text_IO;
use Ada.Text_IO;
use Ada.Integer_Text_IO;

package body Liste_Generique is

   type Cellule is record
      elem    : Element;
      suivant : Liste;
   end record;

   type Iterateur_Interne is record
      L       : Liste;
   end record;
   -------------------
   -- Affiche_Liste --
   -------------------

   procedure Affiche_Liste (L : in Liste) is
      It : Iterateur;
   begin
      It := Creer_Iterateur(L);
      Put("(");
      Put(Element_Courant(It));
      while (A_Suivant(It)) loop
         Put(",");
         Suivant(It);
         Put(Element_Courant(It));
      end loop;
      Put(")");
   end Affiche_Liste;

   -----------------
   -- Insere_Tete --
   -----------------

   procedure Insere_Tete (V : in Element; L : in out Liste) is
      L0: Liste;
   begin
      L0 := new Cellule'(V,L);
      L:=L0;
   end Insere_Tete;

   ------------------
   -- Libere_Liste --
   ------------------

   procedure Libere_Liste (L : in out Liste) is
      It : Iterateur;
   begin
      It := Creer_Iterateur(L);
      while A_Suivant(It) loop
       Suivant(It);
      end loop;

   end Libere_Liste;

   -----------------
   -- Creer_Liste --
   -----------------

   function Creer_Liste return Liste is
      L : Liste;
   begin
      L := new Cellule'(new Element,null);
      return L;
   end Creer_Liste;

   ---------------------
   -- Creer_Iterateur --
   ---------------------

   function Creer_Iterateur (L : Liste) return Iterateur is
      It : Iterateur;
   begin
      It :=  new Iterateur_Interne'(L);
      return It;
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
      It.L := It.L.suivant
   end Suivant;

   ---------------------
   -- Element_Courant --
   ---------------------

   function Element_Courant (It : Iterateur) return Element is
   begin
      return It.L.elem;
   end Element_Courant;

   ---------------
   -- A_Suivant --
   ---------------

   function A_Suivant (It : Iterateur) return Boolean is
   begin
      if It.L.suivant /= null then
         return true;
      else
         return false;
      end if;

   end A_Suivant;

end Liste_Generique;
