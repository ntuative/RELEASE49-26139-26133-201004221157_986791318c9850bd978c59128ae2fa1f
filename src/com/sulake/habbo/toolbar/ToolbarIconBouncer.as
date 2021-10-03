package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2100:Number;
      
      private var var_609:Number = 0;
      
      private var var_2101:Number;
      
      private var var_608:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2100 = param1;
         var_2101 = param2;
      }
      
      public function update() : void
      {
         var_608 += var_2101;
         var_609 += var_608;
         if(var_609 > 0)
         {
            var_609 = 0;
            var_608 = var_2100 * -1 * var_608;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_608 = param1;
         var_609 = 0;
      }
      
      public function get location() : Number
      {
         return var_609;
      }
   }
}
