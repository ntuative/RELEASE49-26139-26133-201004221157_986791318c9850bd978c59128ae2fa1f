package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2020:Number = 0;
      
      private var var_2018:Number = 0;
      
      private var var_2019:Number = 0;
      
      private var var_2017:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_2018 = param1;
         var_2019 = param2;
         var_2020 = param3;
         var_2017 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_2018;
      }
      
      public function get leftSideLength() : Number
      {
         return var_2020;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_2019;
      }
      
      public function get rightSideLength() : Number
      {
         return var_2017;
      }
   }
}
