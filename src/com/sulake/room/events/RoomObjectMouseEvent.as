package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1571:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1586:String = "ROE_MOUSE_ENTER";
      
      public static const const_422:String = "ROE_MOUSE_MOVE";
      
      public static const const_1538:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_231:String = "ROE_MOUSE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1660:Boolean;
      
      private var var_1661:Boolean;
      
      private var var_1658:Boolean;
      
      private var var_1659:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1658 = param4;
         var_1659 = param5;
         var_1660 = param6;
         var_1661 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1661;
      }
      
      public function get altKey() : Boolean
      {
         return var_1658;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1659;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1660;
      }
   }
}
