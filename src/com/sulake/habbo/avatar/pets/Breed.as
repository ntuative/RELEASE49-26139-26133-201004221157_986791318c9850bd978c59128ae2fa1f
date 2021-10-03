package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_577:String;
      
      private var _id:int;
      
      private var var_2242:String = "";
      
      private var var_2244:int;
      
      private var var_2243:String;
      
      private var var_1888:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2244 = parseInt(param1.@pattern);
         var_577 = String(param1.@gender);
         var_1888 = Boolean(parseInt(param1.@colorable));
         var_2242 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2242;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1888;
      }
      
      public function get gender() : String
      {
         return var_577;
      }
      
      public function get patternId() : int
      {
         return var_2244;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2243;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2243 = param1;
      }
   }
}
