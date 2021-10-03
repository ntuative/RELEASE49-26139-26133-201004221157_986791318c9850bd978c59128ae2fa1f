package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1096:Boolean;
      
      private var _name:String;
      
      private var var_1787:String;
      
      private var var_1095:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1787 = String(param1.@link);
         var_1095 = Boolean(parseInt(param1.@fliph));
         var_1096 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_1095;
      }
      
      public function get flipV() : Boolean
      {
         return var_1096;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1787;
      }
   }
}
