package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1780:Array;
      
      private var var_1779:String;
      
      private var var_1782:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1779 = param1;
         var_1780 = param2;
         var_1782 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1779;
      }
      
      public function get yieldList() : Array
      {
         return var_1780;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1782;
      }
   }
}
