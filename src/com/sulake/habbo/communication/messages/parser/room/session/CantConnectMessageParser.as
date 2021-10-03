package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1555:int = 2;
      
      public static const const_1327:int = 4;
      
      public static const const_1304:int = 1;
      
      public static const const_1189:int = 3;
       
      
      private var var_1071:int = 0;
      
      private var var_904:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1071;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1071 = param1.readInteger();
         if(var_1071 == 3)
         {
            var_904 = param1.readString();
         }
         else
         {
            var_904 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1071 = 0;
         var_904 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_904;
      }
   }
}
