package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1487:String;
      
      private var var_639:String;
      
      private var var_1485:String;
      
      private var var_1486:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1486 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1487 = _loc5_[0];
         var_1485 = _loc5_[1];
         _name = param2;
         var_639 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1487;
      }
      
      public function get languageCode() : String
      {
         return var_1486;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_639;
      }
      
      public function get encoding() : String
      {
         return var_1485;
      }
      
      public function get id() : String
      {
         return var_1486 + "_" + var_1487 + "." + var_1485;
      }
   }
}
