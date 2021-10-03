package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_476:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_390:int = 0;
      
      public static const const_877:int = 2;
      
      public static const const_801:int = 1;
      
      public static const const_664:Boolean = false;
      
      public static const const_610:String = "";
      
      public static const const_392:int = 0;
      
      public static const const_368:int = 0;
      
      public static const const_443:int = 0;
       
      
      private var var_1836:int = 0;
      
      private var var_1744:String = "";
      
      private var var_1445:int = 0;
      
      private var var_1834:int = 0;
      
      private var var_1833:Number = 0;
      
      private var var_1746:int = 255;
      
      private var var_1835:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1836;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1445 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1833;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1834 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1836 = param1;
      }
      
      public function get tag() : String
      {
         return var_1744;
      }
      
      public function get alpha() : int
      {
         return var_1746;
      }
      
      public function get ink() : int
      {
         return var_1445;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1833 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1834;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1835 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1835;
      }
      
      public function set tag(param1:String) : void
      {
         var_1744 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1746 = param1;
      }
   }
}
