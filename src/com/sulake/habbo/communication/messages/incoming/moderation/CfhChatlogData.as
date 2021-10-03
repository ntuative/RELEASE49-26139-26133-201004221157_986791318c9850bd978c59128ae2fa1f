package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1860:int;
      
      private var var_989:int;
      
      private var var_1859:int;
      
      private var var_1454:int;
      
      private var var_107:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1454 = param1.readInteger();
         var_1859 = param1.readInteger();
         var_989 = param1.readInteger();
         var_1860 = param1.readInteger();
         var_107 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1454);
      }
      
      public function get chatRecordId() : int
      {
         return var_1860;
      }
      
      public function get reportedUserId() : int
      {
         return var_989;
      }
      
      public function get callerUserId() : int
      {
         return var_1859;
      }
      
      public function get callId() : int
      {
         return var_1454;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_107;
      }
   }
}
