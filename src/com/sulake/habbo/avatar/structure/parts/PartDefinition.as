package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1600:int = -1;
      
      private var var_1366:Boolean;
      
      private var var_1367:String;
      
      private var var_2238:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_2238 = String(param1["set-type"]);
         var_1367 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1366 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1600 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1367;
      }
      
      public function get staticId() : int
      {
         return var_1600;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1600 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1366;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1366 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1367 = param1;
      }
      
      public function get setType() : String
      {
         return var_2238;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
