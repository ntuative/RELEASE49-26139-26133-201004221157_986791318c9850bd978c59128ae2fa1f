package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_630:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_201:String;
      
      private var var_680:String;
      
      private var var_1441:String;
      
      private var var_158:int = -1;
      
      private var var_48:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_158 = param2;
         var_1441 = param3;
         var_201 = param4;
         var_680 = param5;
         var_48 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1441;
      }
      
      public function get colorHex() : String
      {
         return var_680;
      }
      
      public function get text() : String
      {
         return var_201;
      }
      
      public function get objectId() : int
      {
         return var_158;
      }
      
      public function get controller() : Boolean
      {
         return var_48;
      }
   }
}
