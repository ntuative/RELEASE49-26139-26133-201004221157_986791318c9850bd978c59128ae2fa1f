package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_770:String;
      
      private var var_2152:int;
      
      private var var_1583:Boolean;
      
      private var _roomId:int;
      
      private var var_2153:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1583 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_770 = param1.readString();
         var_2153 = param1.readInteger();
         var_2152 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1583;
      }
      
      public function get roomName() : String
      {
         return var_770;
      }
      
      public function get enterMinute() : int
      {
         return var_2152;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2153;
      }
   }
}
