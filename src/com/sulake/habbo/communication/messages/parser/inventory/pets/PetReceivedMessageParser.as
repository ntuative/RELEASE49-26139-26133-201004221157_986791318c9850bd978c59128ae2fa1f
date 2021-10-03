package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1011:PetData;
      
      private var var_1467:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1467 = param1.readBoolean();
         var_1011 = new PetData(param1);
         Logger.log("Got PetReceived: " + var_1467 + ", " + var_1011.id + ", " + var_1011.name + ", " + pet.figure + ", " + var_1011.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return var_1467;
      }
      
      public function get pet() : PetData
      {
         return var_1011;
      }
   }
}
