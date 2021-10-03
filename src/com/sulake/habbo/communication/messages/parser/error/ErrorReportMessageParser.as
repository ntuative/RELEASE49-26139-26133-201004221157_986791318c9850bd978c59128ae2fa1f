package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1196:int;
      
      private var var_1197:int;
      
      private var var_1195:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return var_1196;
      }
      
      public function flush() : Boolean
      {
         var_1197 = 0;
         var_1196 = 0;
         var_1195 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1197;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1196 = param1.readInteger();
         var_1197 = param1.readInteger();
         var_1195 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return var_1195;
      }
   }
}
