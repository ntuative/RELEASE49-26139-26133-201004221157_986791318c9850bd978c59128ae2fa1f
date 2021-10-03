package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1676:Class;
      
      private var var_1674:Class;
      
      private var var_1675:String;
      
      private var var_1145:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1675 = param1;
         var_1674 = param2;
         var_1676 = param3;
         if(rest == null)
         {
            var_1145 = new Array();
         }
         else
         {
            var_1145 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1676;
      }
      
      public function get assetClass() : Class
      {
         return var_1674;
      }
      
      public function get mimeType() : String
      {
         return var_1675;
      }
      
      public function get fileTypes() : Array
      {
         return var_1145;
      }
   }
}
