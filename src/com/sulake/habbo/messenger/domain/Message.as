package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_578:int = 2;
      
      public static const const_911:int = 6;
      
      public static const const_614:int = 1;
      
      public static const const_697:int = 3;
      
      public static const const_951:int = 4;
      
      public static const const_714:int = 5;
       
      
      private var var_2131:String;
      
      private var var_1091:int;
      
      private var var_2075:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1091 = param2;
         var_2075 = param3;
         var_2131 = param4;
      }
      
      public function get time() : String
      {
         return var_2131;
      }
      
      public function get senderId() : int
      {
         return var_1091;
      }
      
      public function get messageText() : String
      {
         return var_2075;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
