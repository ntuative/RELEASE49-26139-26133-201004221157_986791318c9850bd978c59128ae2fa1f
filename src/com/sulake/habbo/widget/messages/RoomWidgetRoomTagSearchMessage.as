package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_651:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1744:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_651);
         var_1744 = param1;
      }
      
      public function get tag() : String
      {
         return var_1744;
      }
   }
}
