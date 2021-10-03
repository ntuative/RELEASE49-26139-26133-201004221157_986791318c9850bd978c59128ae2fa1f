package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_64:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_1108:int;
      
      private var _color:uint;
      
      private var var_1107:int;
      
      private var var_1877:int;
      
      private var var_32:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_64,param6,param7);
         var_32 = param1;
         var_1877 = param2;
         var_1108 = param3;
         _color = param4;
         var_1107 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_1107;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_1108;
      }
      
      public function get state() : int
      {
         return var_32;
      }
      
      public function get presetId() : int
      {
         return var_1877;
      }
   }
}
