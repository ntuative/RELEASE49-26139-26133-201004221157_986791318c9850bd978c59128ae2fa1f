package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1785:Boolean;
      
      private var var_1786:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1785 = Boolean(parseInt(param1.@club));
         var_1786 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1785;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1786;
      }
   }
}
