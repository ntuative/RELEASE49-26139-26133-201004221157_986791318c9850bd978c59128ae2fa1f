package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1327:int;
      
      private var var_1582:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1327 = param1;
         var_1582 = param2;
         Logger.log("READ NODE: " + var_1327 + ", " + var_1582);
      }
      
      public function get nodeName() : String
      {
         return var_1582;
      }
      
      public function get nodeId() : int
      {
         return var_1327;
      }
   }
}
