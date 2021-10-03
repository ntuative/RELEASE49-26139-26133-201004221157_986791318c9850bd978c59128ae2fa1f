package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_521:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_571:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_263:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1494:Point;
      
      private var var_1495:Rectangle;
      
      private var var_199:Number = 0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         var_1495 = param2;
         var_1494 = param3;
         var_199 = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(var_1495 != null)
         {
            return var_1495.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return var_199;
      }
      
      public function get positionDelta() : Point
      {
         if(var_1494 != null)
         {
            return var_1494.clone();
         }
         return null;
      }
   }
}
