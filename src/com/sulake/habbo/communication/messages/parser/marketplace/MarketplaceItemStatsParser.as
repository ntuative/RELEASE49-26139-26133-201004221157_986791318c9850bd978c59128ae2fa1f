package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1434:Array;
      
      private var var_1770:int;
      
      private var var_1771:int;
      
      private var var_1774:int;
      
      private var var_1772:int;
      
      private var _dayOffsets:Array;
      
      private var var_1773:int;
      
      private var var_1435:Array;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1434;
      }
      
      public function get furniTypeId() : int
      {
         return var_1771;
      }
      
      public function get historyLength() : int
      {
         return var_1772;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_1774;
      }
      
      public function get offerCount() : int
      {
         return var_1773;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1435;
      }
      
      public function get averagePrice() : int
      {
         return var_1770;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1770 = param1.readInteger();
         var_1773 = param1.readInteger();
         var_1772 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1434 = [];
         var_1435 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1434.push(param1.readInteger());
            var_1435.push(param1.readInteger());
            _loc3_++;
         }
         var_1774 = param1.readInteger();
         var_1771 = param1.readInteger();
         return true;
      }
   }
}
