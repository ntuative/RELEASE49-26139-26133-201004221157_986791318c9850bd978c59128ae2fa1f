package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityTimeMessageParser implements IMessageParser
   {
       
      
      private var var_1072:Boolean;
      
      private var var_1374:int;
      
      public function AvailabilityTimeMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1072 = param1.readInteger() > 0;
         var_1374 = param1.readInteger();
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return var_1072;
      }
      
      public function flush() : Boolean
      {
         var_1072 = false;
         var_1374 = 0;
         return true;
      }
      
      public function get minutesUntilChange() : int
      {
         return var_1374;
      }
   }
}
