package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1822:String;
      
      private var var_577:String;
      
      private var var_1474:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1474 = param1.readInteger();
         var_1822 = param1.readString();
         var_577 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_577;
      }
      
      public function get figureString() : String
      {
         return var_1822;
      }
      
      public function get slotId() : int
      {
         return var_1474;
      }
   }
}
