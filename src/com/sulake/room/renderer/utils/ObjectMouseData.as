package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_2009:String = "";
      
      private var var_158:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_2009 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_158 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_2009;
      }
      
      public function get objectId() : String
      {
         return var_158;
      }
   }
}
