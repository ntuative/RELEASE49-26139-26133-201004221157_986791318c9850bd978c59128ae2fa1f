package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1391:String;
      
      private var var_1029:String;
      
      private var var_2148:Boolean;
      
      private var var_1471:int;
      
      private var var_1801:int;
      
      private var var_2147:Boolean;
      
      private var var_1474:String = "";
      
      private var var_2146:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1193:int;
      
      private var var_2149:Boolean;
      
      private var var_2136:int = -1;
      
      private var var_1644:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1801 = param1;
         var_1029 = param2;
         _objId = param3;
         var_1193 = param4;
         _category = param5;
         var_1391 = param6;
         var_2148 = param7;
         var_2146 = param8;
         var_2149 = param9;
         var_2147 = param10;
         var_1644 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1474;
      }
      
      public function get extra() : int
      {
         return var_1471;
      }
      
      public function get classId() : int
      {
         return var_1193;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_2147;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_2148;
      }
      
      public function get stripId() : int
      {
         return var_1801;
      }
      
      public function get stuffData() : String
      {
         return var_1391;
      }
      
      public function get songId() : int
      {
         return var_2136;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1474 = param1;
         var_1471 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1029;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1644;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2149;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2146;
      }
   }
}
