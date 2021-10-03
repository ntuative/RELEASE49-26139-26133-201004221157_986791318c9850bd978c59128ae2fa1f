package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_80:Number = 0;
      
      private var var_228:int = 0;
      
      private var var_1908:int = 0;
      
      private var var_1907:Number = 0;
      
      private var var_1909:Number = 0;
      
      private var var_1912:Number = 0;
      
      private var var_1910:Number = 0;
      
      private var var_1911:Boolean = false;
      
      private var var_81:Number = 0;
      
      private var _id:int = 0;
      
      private var var_200:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_200 = [];
         super();
         _id = param1;
         var_81 = param2;
         _y = param3;
         var_80 = param4;
         var_1910 = param5;
         var_228 = param6;
         var_1908 = param7;
         var_1907 = param8;
         var_1909 = param9;
         var_1912 = param10;
         var_1911 = param11;
         var_200 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_80;
      }
      
      public function get dir() : int
      {
         return var_228;
      }
      
      public function get localZ() : Number
      {
         return var_1910;
      }
      
      public function get isMoving() : Boolean
      {
         return var_1911;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1908;
      }
      
      public function get targetX() : Number
      {
         return var_1907;
      }
      
      public function get targetY() : Number
      {
         return var_1909;
      }
      
      public function get targetZ() : Number
      {
         return var_1912;
      }
      
      public function get x() : Number
      {
         return var_81;
      }
      
      public function get actions() : Array
      {
         return var_200.slice();
      }
   }
}
