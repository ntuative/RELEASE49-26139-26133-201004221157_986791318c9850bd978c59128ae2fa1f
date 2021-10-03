package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1041:int = 1;
      
      private static const const_1057:int = 3;
      
      private static const const_1040:int = 2;
      
      private static const const_1042:int = 15;
       
      
      private var var_790:int;
      
      private var var_224:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_224 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1040)
         {
            var_224 = new Array();
            var_224.push(const_1041);
            var_790 = const_1042;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_790 > 0)
         {
            --var_790;
         }
         if(var_790 == 0)
         {
            if(false)
            {
               super.setAnimation(var_224.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
