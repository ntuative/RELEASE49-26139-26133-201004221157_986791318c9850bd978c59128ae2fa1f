package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_1618:Boolean = false;
      
      private var var_1620:int = 0;
      
      private var var_1468:int = 0;
      
      private var var_1619:int = 0;
      
      private var var_1621:Boolean = false;
      
      private var var_1413:int = 0;
      
      private var var_1469:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1413 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_1620;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_1618;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_1618 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1621;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_1620 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1468 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1413;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1621 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_1619 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1468;
      }
      
      public function get pixelBalance() : int
      {
         return var_1619;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1469 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1469;
      }
   }
}
