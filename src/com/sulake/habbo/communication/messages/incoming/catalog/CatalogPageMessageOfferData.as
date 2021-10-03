package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_810:Array;
      
      private var var_890:int;
      
      private var var_1315:String;
      
      private var _offerId:int;
      
      private var var_891:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1315 = param1.readString();
         var_890 = param1.readInteger();
         var_891 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var_810 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_810.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return var_810;
      }
      
      public function get priceInCredits() : int
      {
         return var_890;
      }
      
      public function get localizationId() : String
      {
         return var_1315;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_891;
      }
   }
}
