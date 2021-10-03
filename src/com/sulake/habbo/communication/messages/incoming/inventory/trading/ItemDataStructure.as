package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1029:String;
      
      private var var_1883:int;
      
      private var var_1927:int;
      
      private var var_1471:int;
      
      private var var_1929:int;
      
      private var _category:int;
      
      private var var_2385:int;
      
      private var var_1925:int;
      
      private var var_1928:int;
      
      private var var_1924:int;
      
      private var var_1923:int;
      
      private var var_1926:Boolean;
      
      private var var_1391:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1883 = param1;
         var_1029 = param2;
         var_1927 = param3;
         var_1924 = param4;
         _category = param5;
         var_1391 = param6;
         var_1471 = param7;
         var_1928 = param8;
         var_1925 = param9;
         var_1923 = param10;
         var_1929 = param11;
         var_1926 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1924;
      }
      
      public function get extra() : int
      {
         return var_1471;
      }
      
      public function get stuffData() : String
      {
         return var_1391;
      }
      
      public function get groupable() : Boolean
      {
         return var_1926;
      }
      
      public function get creationMonth() : int
      {
         return var_1923;
      }
      
      public function get roomItemID() : int
      {
         return var_1927;
      }
      
      public function get itemType() : String
      {
         return var_1029;
      }
      
      public function get itemID() : int
      {
         return var_1883;
      }
      
      public function get songID() : int
      {
         return var_1471;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1928;
      }
      
      public function get creationYear() : int
      {
         return var_1929;
      }
      
      public function get creationDay() : int
      {
         return var_1925;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
