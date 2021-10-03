package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_2073:int;
      
      private var var_2074:Boolean;
      
      private var _offerId:int;
      
      private var var_1786:Boolean;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_2074 = param1.readBoolean();
         var_2073 = param1.readInteger();
         var_1786 = param1.readBoolean();
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1786;
      }
      
      public function get monthsRequired() : int
      {
         return var_2073;
      }
      
      public function get isVip() : Boolean
      {
         return var_2074;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
   }
}
