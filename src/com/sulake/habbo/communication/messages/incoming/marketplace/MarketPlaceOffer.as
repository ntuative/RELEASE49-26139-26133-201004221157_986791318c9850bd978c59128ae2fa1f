package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1185:int;
      
      private var var_1823:int = -1;
      
      private var var_214:int;
      
      private var var_1770:int;
      
      private var var_1672:int;
      
      private var _offerId:int;
      
      private var var_1186:int;
      
      private var var_1673:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         _offerId = param1;
         var_1673 = param2;
         var_1672 = param3;
         var_1185 = param4;
         var_214 = param5;
         var_1823 = param6;
         var_1770 = param7;
         var_1186 = param8;
      }
      
      public function get status() : int
      {
         return var_214;
      }
      
      public function get price() : int
      {
         return var_1185;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1823;
      }
      
      public function get offerCount() : int
      {
         return var_1186;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1672;
      }
      
      public function get averagePrice() : int
      {
         return var_1770;
      }
      
      public function get furniId() : int
      {
         return var_1673;
      }
   }
}
