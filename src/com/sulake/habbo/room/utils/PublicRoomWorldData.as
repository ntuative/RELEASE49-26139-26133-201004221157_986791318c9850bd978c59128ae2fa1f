package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1628:Number = 1;
      
      private var var_199:Number = 1;
      
      private var var_2090:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2090 = param1;
         var_199 = param2;
         var_1628 = param3;
      }
      
      public function get scale() : Number
      {
         return var_199;
      }
      
      public function get heightScale() : Number
      {
         return var_1628;
      }
   }
}
