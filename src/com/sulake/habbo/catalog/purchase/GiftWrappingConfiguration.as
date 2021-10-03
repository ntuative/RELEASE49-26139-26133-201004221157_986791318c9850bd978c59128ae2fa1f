package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_576:Array;
      
      private var var_1185:int;
      
      private var var_1442:Array;
      
      private var var_575:Array;
      
      private var var_1220:Boolean = false;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var_1220 = _loc2_.isWrappingEnabled;
         var_1185 = _loc2_.wrappingPrice;
         var_1442 = _loc2_.stuffTypes;
         var_575 = _loc2_.boxTypes;
         var_576 = _loc2_.ribbonTypes;
      }
      
      public function get ribbonTypes() : Array
      {
         return var_576;
      }
      
      public function get stuffTypes() : Array
      {
         return var_1442;
      }
      
      public function get price() : int
      {
         return var_1185;
      }
      
      public function get boxTypes() : Array
      {
         return var_575;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1220;
      }
   }
}
