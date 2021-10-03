package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1718:int;
      
      private var var_1715:Boolean = false;
      
      private var var_1714:int;
      
      private var var_1713:int;
      
      private var var_1717:int;
      
      private var var_1211:String;
      
      private var var_1185:int;
      
      private var _offerId:int;
      
      private var var_1719:int;
      
      private var var_1712:Boolean;
      
      private var var_1716:Boolean;
      
      private var var_396:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         _offerId = param1;
         var_1211 = param2;
         var_1185 = param3;
         var_1716 = param4;
         var_1712 = param5;
         var_1714 = param6;
         var_1717 = param7;
         var_1713 = param8;
         var_1718 = param9;
         var_1719 = param10;
      }
      
      public function get month() : int
      {
         return var_1718;
      }
      
      public function get page() : ICatalogPage
      {
         return var_396;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get vip() : Boolean
      {
         return var_1712;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         var_396 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_327;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1716;
      }
      
      public function get localizationId() : String
      {
         return var_1211;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1717;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return var_1715;
      }
      
      public function get day() : int
      {
         return var_1719;
      }
      
      public function get year() : int
      {
         return var_1713;
      }
      
      public function get price() : int
      {
         return var_1185;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         var_1715 = param1;
      }
      
      public function get periods() : int
      {
         return var_1714;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return var_1185;
      }
      
      public function get productCode() : String
      {
         return var_1211;
      }
   }
}
