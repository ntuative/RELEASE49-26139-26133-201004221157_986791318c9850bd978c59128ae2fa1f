package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1718:int;
      
      private var var_1185:int;
      
      private var var_1714:int;
      
      private var _offerId:int;
      
      private var var_1713:int;
      
      private var var_1719:int;
      
      private var var_1712:Boolean;
      
      private var var_1717:int;
      
      private var var_1716:Boolean;
      
      private var var_1211:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1211 = param1.readString();
         var_1185 = param1.readInteger();
         var_1716 = param1.readBoolean();
         var_1712 = param1.readBoolean();
         var_1714 = param1.readInteger();
         var_1717 = param1.readInteger();
         var_1713 = param1.readInteger();
         var_1718 = param1.readInteger();
         var_1719 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1713;
      }
      
      public function get month() : int
      {
         return var_1718;
      }
      
      public function get price() : int
      {
         return var_1185;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1714;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1717;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1716;
      }
      
      public function get day() : int
      {
         return var_1719;
      }
      
      public function get vip() : Boolean
      {
         return var_1712;
      }
      
      public function get productCode() : String
      {
         return var_1211;
      }
   }
}
