package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarCarryObjectUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1029:int;
      
      private var var_1254:String;
      
      public function RoomObjectAvatarCarryObjectUpdateMessage(param1:int, param2:String)
      {
         super();
         var_1029 = param1;
         var_1254 = param2;
      }
      
      public function get itemType() : int
      {
         return var_1029;
      }
      
      public function get itemName() : String
      {
         return var_1254;
      }
   }
}
