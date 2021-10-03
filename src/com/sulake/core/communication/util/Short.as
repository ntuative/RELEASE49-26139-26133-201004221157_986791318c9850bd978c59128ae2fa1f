package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_684:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_684 = new ByteArray();
         var_684.writeShort(param1);
         var_684.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_684.position = 0;
         if(false)
         {
            _loc1_ = var_684.readShort();
            var_684.position = 0;
         }
         return _loc1_;
      }
   }
}
