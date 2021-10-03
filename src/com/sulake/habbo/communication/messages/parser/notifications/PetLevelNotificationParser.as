package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_314:String;
      
      private var var_1641:int;
      
      private var var_2150:String;
      
      private var var_1060:int;
      
      private var var_1192:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1192;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1192 = param1.readInteger();
         var_2150 = param1.readString();
         var_1641 = param1.readInteger();
         var_314 = param1.readString();
         var_1060 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2150;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_314;
      }
      
      public function get petType() : int
      {
         return var_1060;
      }
      
      public function get level() : int
      {
         return var_1641;
      }
   }
}
