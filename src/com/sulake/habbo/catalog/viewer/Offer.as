package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_934:String = "price_type_none";
      
      public static const const_423:String = "pricing_model_multi";
      
      public static const const_327:String = "price_type_credits";
      
      public static const const_406:String = "price_type_credits_and_pixels";
      
      public static const const_385:String = "pricing_model_bundle";
      
      public static const const_391:String = "pricing_model_single";
      
      public static const const_720:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1358:String = "pricing_model_unknown";
      
      public static const const_442:String = "price_type_pixels";
       
      
      private var var_2128:int;
      
      private var var_890:int;
      
      private var _offerId:int;
      
      private var var_891:int;
      
      private var var_438:String;
      
      private var var_617:String;
      
      private var var_396:ICatalogPage;
      
      private var var_439:IProductContainer;
      
      private var var_1315:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1315 = param1.localizationId;
         var_890 = param1.priceInCredits;
         var_891 = param1.priceInPixels;
         var_396 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_438;
      }
      
      public function get page() : ICatalogPage
      {
         return var_396;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_2128 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_439;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_891;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1315 = "";
         var_890 = 0;
         var_891 = 0;
         var_396 = null;
         if(var_439 != null)
         {
            var_439.dispose();
            var_439 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_2128;
      }
      
      public function get priceInCredits() : int
      {
         return var_890;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_438 = const_391;
            }
            else
            {
               var_438 = const_423;
            }
         }
         else if(param1.length > 1)
         {
            var_438 = const_385;
         }
         else
         {
            var_438 = const_1358;
         }
      }
      
      public function get priceType() : String
      {
         return var_617;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_438)
         {
            case const_391:
               var_439 = new SingleProductContainer(this,param1);
               break;
            case const_423:
               var_439 = new MultiProductContainer(this,param1);
               break;
            case const_385:
               var_439 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_438);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1315;
      }
      
      private function analyzePriceType() : void
      {
         if(var_890 > 0 && var_891 > 0)
         {
            var_617 = const_406;
         }
         else if(var_890 > 0)
         {
            var_617 = const_327;
         }
         else if(var_891 > 0)
         {
            var_617 = const_442;
         }
         else
         {
            var_617 = const_934;
         }
      }
   }
}
