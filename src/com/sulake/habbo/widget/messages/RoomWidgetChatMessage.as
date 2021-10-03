package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_131:int = 0;
      
      public static const const_109:int = 1;
      
      public static const const_108:int = 2;
      
      public static const const_523:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1350:int = 0;
      
      private var var_1987:String = "";
      
      private var var_201:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         var_201 = param2;
         var_1350 = param3;
         var_1987 = param4;
      }
      
      public function get recipientName() : String
      {
         return var_1987;
      }
      
      public function get chatType() : int
      {
         return var_1350;
      }
      
      public function get text() : String
      {
         return var_201;
      }
   }
}
