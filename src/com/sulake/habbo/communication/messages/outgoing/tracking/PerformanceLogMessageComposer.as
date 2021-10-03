package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1081:int = 0;
      
      private var var_1280:int = 0;
      
      private var var_2044:String = "";
      
      private var var_1082:int = 0;
      
      private var var_2050:String = "";
      
      private var var_2048:int = 0;
      
      private var var_1580:String = "";
      
      private var var_2045:int = 0;
      
      private var var_2047:int = 0;
      
      private var var_2049:String = "";
      
      private var var_2046:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_2045 = param1;
         var_2049 = param2;
         var_1580 = param3;
         var_2044 = param4;
         var_2050 = param5;
         if(param6)
         {
            var_1280 = 1;
         }
         else
         {
            var_1280 = 0;
         }
         var_2048 = param7;
         var_2047 = param8;
         var_1082 = param9;
         var_2046 = param10;
         var_1081 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_2045,var_2049,var_1580,var_2044,var_2050,var_1280,var_2048,var_2047,var_1082,var_2046,var_1081];
      }
      
      public function dispose() : void
      {
      }
   }
}
