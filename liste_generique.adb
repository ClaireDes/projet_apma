with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Unchecked_Deallocation ;

use Ada.Text_IO;
use Ada.Integer_Text_IO;

package body Liste_Generique is

   type Cellule is record
      elem    : Element;
      suivant : Liste;
   end record;

   type Iterateur_Interne is record
      L_it       : Liste;
   end record;

   procedure free_Liste is new Ada.Unchecked_Deallocation(Cellule,Liste) ;
   procedure free_Iterateur is new Ada.Unchecked_Deallocation(Iterateur_Interne,Iterateur);

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
      L_suiv, L_cour : Liste;
   begin
      L_cour := L;
      L_suiv := L.suivant;
      while L_suiv /= null loop
         free_Liste(L_cour);
         L_cour := L_suiv;
         L_suiv := L_suiv.suivant;
      end loop;
      free_Liste(L_cour);
      free_Liste(L_suiv);


   end Libere_Liste;

   -----------------
   -- Creer_Liste --
   -----------------

   function Creer_Liste return Liste is
      L : Liste := null;
   begin
      return L;
   end Creer_Liste;

   ---------------------
   -- Creer_Iterateur --
   ---------------------

   function Creer_Iterateur (L : Liste) return Iterateur is
      It : Iterateur;
   begin
      It :=  new Iterateur_Interne'(L_it => L);
      return It;
   end Creer_Iterateur;

   ----------------------
   -- Libere_Iterateur --
   ----------------------

   procedure Libere_Iterateur (It : in out Iterateur) is
   begin
      free_Iterateur(It);
   end Libere_Iterateur;

   -------------
   -- Suivant --
   -------------

   procedure Suivant (It : in out Iterateur) is
   begin
      It.L_it := It.L_it.suivant;
   end Suivant;

   ---------------------
   -- Element_Courant --
   ---------------------

   function Element_Courant (It : Iterateur) return Element is
   begin
      return It.L_it.elem;
   end Element_Courant;

   ---------------
   -- A_Suivant --
   ---------------

   function A_Suivant (It : Iterateur) return Boolean is
   begin
      if It.L_it.suivant /= null then
         return true;
      else
         return false;
      end if;

   end A_Suivant;

end Liste_Generique;
