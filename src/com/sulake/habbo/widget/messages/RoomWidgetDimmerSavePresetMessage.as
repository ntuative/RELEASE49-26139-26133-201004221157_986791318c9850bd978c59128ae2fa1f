package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_613:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1757:int;
      
      private var var_1756:int;
      
      private var var_1755:Boolean;
      
      private var var_1107:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_613);
         var_1756 = param1;
         var_1757 = param2;
         _color = param3;
         var_1107 = param4;
         var_1755 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1757;
      }
      
      public function get presetNumber() : int
      {
         return var_1756;
      }
      
      public function get brightness() : int
      {
         return var_1107;
      }
      
      public function get apply() : Boolean
      {
         return var_1755;
      }
   }
}
