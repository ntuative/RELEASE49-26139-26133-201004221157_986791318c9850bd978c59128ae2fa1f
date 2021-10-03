package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1151:int = 2;
      
      public static const const_1575:int = 1;
       
      
      private var var_2002:int;
      
      private var var_2003:int;
      
      private var var_1621:Boolean;
      
      private var var_2000:int;
      
      private var var_1188:String;
      
      private var var_2001:Boolean;
      
      private var var_1999:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2003;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1621;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1999;
      }
      
      public function get memberPeriods() : int
      {
         return var_2000;
      }
      
      public function get productName() : String
      {
         return var_1188;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2001;
      }
      
      public function get responseType() : int
      {
         return var_2002;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1188 = param1.readString();
         var_2003 = param1.readInteger();
         var_2000 = param1.readInteger();
         var_1999 = param1.readInteger();
         var_2002 = param1.readInteger();
         var_2001 = param1.readBoolean();
         var_1621 = param1.readBoolean();
         return true;
      }
   }
}
