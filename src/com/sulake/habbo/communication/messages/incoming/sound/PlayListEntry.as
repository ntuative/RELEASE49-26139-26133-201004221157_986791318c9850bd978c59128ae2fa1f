package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_2136:int;
      
      private var var_2134:int = 0;
      
      private var var_2135:String;
      
      private var var_2132:int;
      
      private var var_2133:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_2136 = param1;
         var_2132 = param2;
         var_2133 = param3;
         var_2135 = param4;
      }
      
      public function get length() : int
      {
         return var_2132;
      }
      
      public function get name() : String
      {
         return var_2133;
      }
      
      public function get creator() : String
      {
         return var_2135;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_2134;
      }
      
      public function get id() : int
      {
         return var_2136;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_2134 = param1;
      }
   }
}
