package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2036:String;
      
      private var var_1354:String;
      
      private var var_2037:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_2037 = param1;
         var_1354 = param2;
         var_2036 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2037,var_1354,var_2036];
      }
      
      public function dispose() : void
      {
      }
   }
}
