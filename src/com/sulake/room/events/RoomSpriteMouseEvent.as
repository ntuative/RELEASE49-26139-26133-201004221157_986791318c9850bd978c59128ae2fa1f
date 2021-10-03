package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1661:Boolean = false;
      
      private var var_1658:Boolean = false;
      
      private var var_2009:String = "";
      
      private var _type:String = "";
      
      private var var_1660:Boolean = false;
      
      private var var_1882:Number = 0;
      
      private var var_2107:Number = 0;
      
      private var var_2109:Number = 0;
      
      private var var_2108:String = "";
      
      private var var_1881:Number = 0;
      
      private var var_1659:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_2108 = param2;
         var_2009 = param3;
         var_2107 = param4;
         var_2109 = param5;
         var_1882 = param6;
         var_1881 = param7;
         var_1659 = param8;
         var_1658 = param9;
         var_1660 = param10;
         var_1661 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1659;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1661;
      }
      
      public function get localX() : Number
      {
         return var_1882;
      }
      
      public function get localY() : Number
      {
         return var_1881;
      }
      
      public function get canvasId() : String
      {
         return var_2108;
      }
      
      public function get altKey() : Boolean
      {
         return var_1658;
      }
      
      public function get spriteTag() : String
      {
         return var_2009;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_2107;
      }
      
      public function get screenY() : Number
      {
         return var_2109;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1660;
      }
   }
}
