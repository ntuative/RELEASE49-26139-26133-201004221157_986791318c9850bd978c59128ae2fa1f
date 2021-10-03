package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1728:int;
      
      private var var_1419:int;
      
      private var var_1724:int;
      
      private var var_1725:int;
      
      private var var_1729:int;
      
      private var var_1420:int;
      
      private var var_1726:int;
      
      private var var_1220:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1728;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1419;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1726;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1725;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1729;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1420;
      }
      
      public function get commission() : int
      {
         return var_1724;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1220 = param1.readBoolean();
         var_1724 = param1.readInteger();
         var_1419 = param1.readInteger();
         var_1420 = param1.readInteger();
         var_1725 = param1.readInteger();
         var_1728 = param1.readInteger();
         var_1729 = param1.readInteger();
         var_1726 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1220;
      }
   }
}
