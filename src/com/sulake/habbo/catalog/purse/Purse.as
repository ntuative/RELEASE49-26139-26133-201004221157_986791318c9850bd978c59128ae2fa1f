package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1468:int = 0;
      
      private var var_1915:int = 0;
      
      private var var_1621:Boolean = false;
      
      private var var_1914:int = 0;
      
      private var var_1469:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubPeriods() : int
      {
         return var_1469;
      }
      
      public function get clubDays() : int
      {
         return var_1468;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1915 = param1;
      }
      
      public function get pixels() : int
      {
         return var_1915;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1468 > 0 || var_1469 > 0;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1468 = param1;
      }
      
      public function get credits() : int
      {
         return var_1914;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1621;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1621 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1914 = param1;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1469 = param1;
      }
   }
}
