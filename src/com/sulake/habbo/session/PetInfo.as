package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1641:int;
      
      private var var_1852:int;
      
      private var var_1857:int;
      
      private var var_1960:int;
      
      private var _nutrition:int;
      
      private var var_1192:int;
      
      private var var_1964:int;
      
      private var var_1963:int;
      
      private var _energy:int;
      
      private var var_1856:int;
      
      private var var_1959:int;
      
      private var _ownerName:String;
      
      private var var_1817:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1641;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1852 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1641 = param1;
      }
      
      public function get petId() : int
      {
         return var_1192;
      }
      
      public function get experienceMax() : int
      {
         return var_1963;
      }
      
      public function get nutritionMax() : int
      {
         return var_1960;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1964 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1817;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1192 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1959;
      }
      
      public function get respect() : int
      {
         return var_1852;
      }
      
      public function get levelMax() : int
      {
         return var_1964;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1963 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1857 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1960 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1817 = param1;
      }
      
      public function get experience() : int
      {
         return var_1857;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1959 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1856 = param1;
      }
      
      public function get age() : int
      {
         return var_1856;
      }
   }
}
