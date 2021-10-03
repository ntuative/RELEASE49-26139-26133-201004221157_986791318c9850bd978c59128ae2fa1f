package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1961:String;
      
      private var var_314:String;
      
      private var var_577:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         var_314 = param1;
         var_577 = param2;
         var_1961 = param3;
      }
      
      public function get race() : String
      {
         return var_1961;
      }
      
      public function get figure() : String
      {
         return var_314;
      }
      
      public function get gender() : String
      {
         return var_577;
      }
   }
}
