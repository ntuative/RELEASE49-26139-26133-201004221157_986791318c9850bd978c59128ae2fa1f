package com.sulake.habbo.communication.messages.outgoing.room.session
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenConnectionMessageComposer implements IMessageComposer
   {
       
      
      private var _roomId:int;
      
      private var var_1797:int;
      
      private var var_1798:Boolean;
      
      public function OpenConnectionMessageComposer(param1:Boolean, param2:int, param3:int = 0)
      {
         super();
         _roomId = param2;
         var_1798 = param1;
         var_1797 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [int(var_1798),_roomId,var_1797];
      }
      
      public function dispose() : void
      {
      }
   }
}
