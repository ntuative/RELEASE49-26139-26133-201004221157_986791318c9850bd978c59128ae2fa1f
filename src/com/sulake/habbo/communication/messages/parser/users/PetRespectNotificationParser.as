package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1852:int;
      
      private var var_1152:PetData;
      
      private var var_2092:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1852;
      }
      
      public function get petData() : PetData
      {
         return var_1152;
      }
      
      public function flush() : Boolean
      {
         var_1152 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_2092;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1852 = param1.readInteger();
         var_2092 = param1.readInteger();
         var_1152 = new PetData(param1);
         return true;
      }
   }
}
