package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1801:int;
      
      private var var_2146:Boolean;
      
      private var var_2136:int;
      
      private var var_1391:String;
      
      private var var_2194:Boolean = false;
      
      private var var_1644:int;
      
      private var var_456:int;
      
      private var var_1029:String;
      
      private var var_1474:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1193:int;
      
      private var var_2149:Boolean;
      
      private var var_2193:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1801 = param1;
         var_1029 = param2;
         _objId = param3;
         var_1193 = param4;
         var_1391 = param5;
         var_2146 = param6;
         var_2149 = param7;
         var_1644 = param8;
         var_1474 = param9;
         var_2136 = param10;
         var_456 = -1;
      }
      
      public function get songId() : int
      {
         return var_2136;
      }
      
      public function get iconCallbackId() : int
      {
         return var_456;
      }
      
      public function get expiryTime() : int
      {
         return var_1644;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2193 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2194 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_456 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_2149;
      }
      
      public function get slotId() : String
      {
         return var_1474;
      }
      
      public function get classId() : int
      {
         return var_1193;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_2146;
      }
      
      public function get stuffData() : String
      {
         return var_1391;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1801;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2194;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2193;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1029;
      }
   }
}
