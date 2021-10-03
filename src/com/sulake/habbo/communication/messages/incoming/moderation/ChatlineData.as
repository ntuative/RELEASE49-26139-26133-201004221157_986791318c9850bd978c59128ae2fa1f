package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1473:String;
      
      private var var_1759:int;
      
      private var var_1758:int;
      
      private var var_1761:int;
      
      private var var_1760:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_1759 = param1.readInteger();
         var_1761 = param1.readInteger();
         var_1758 = param1.readInteger();
         var_1760 = param1.readString();
         var_1473 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1473;
      }
      
      public function get hour() : int
      {
         return var_1759;
      }
      
      public function get minute() : int
      {
         return var_1761;
      }
      
      public function get chatterName() : String
      {
         return var_1760;
      }
      
      public function get chatterId() : int
      {
         return var_1758;
      }
   }
}
