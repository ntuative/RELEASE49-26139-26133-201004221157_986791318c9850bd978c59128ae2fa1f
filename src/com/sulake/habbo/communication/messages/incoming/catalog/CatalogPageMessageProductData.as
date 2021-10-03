package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_203:String = "e";
      
      public static const const_82:String = "i";
      
      public static const const_81:String = "s";
       
      
      private var var_1006:String;
      
      private var var_1203:String;
      
      private var var_1202:int;
      
      private var var_1740:int;
      
      private var var_1005:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1203 = param1.readString();
         var_1740 = param1.readInteger();
         var_1006 = param1.readString();
         var_1005 = param1.readInteger();
         var_1202 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_1005;
      }
      
      public function get productType() : String
      {
         return var_1203;
      }
      
      public function get expiration() : int
      {
         return var_1202;
      }
      
      public function get furniClassId() : int
      {
         return var_1740;
      }
      
      public function get extraParam() : String
      {
         return var_1006;
      }
   }
}
