package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1058:int = 31;
      
      private static const const_1057:int = 32;
      
      private static const const_495:int = 30;
      
      private static const const_771:int = 20;
      
      private static const const_494:int = 10;
       
      
      private var var_582:Boolean = false;
      
      private var var_224:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_224 = new Array();
         super();
         super.setAnimation(const_495);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_582 = true;
            var_224 = new Array();
            var_224.push(const_1058);
            var_224.push(const_1057);
            return;
         }
         if(param1 > 0 && param1 <= const_494)
         {
            if(var_582)
            {
               var_582 = false;
               var_224 = new Array();
               if(_direction == 2)
               {
                  var_224.push(const_771 + 5 - param1);
                  var_224.push(const_494 + 5 - param1);
               }
               else
               {
                  var_224.push(const_771 + param1);
                  var_224.push(const_494 + param1);
               }
               var_224.push(const_495);
               return;
            }
            super.setAnimation(const_495);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
