package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_427:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_318:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_864:int;
      
      private var var_252:Boolean;
      
      private var var_1796:Boolean;
      
      private var var_1448:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_864 = param2;
         var_1796 = param3;
         var_252 = param4;
         var_1448 = param5;
      }
      
      public function get position() : int
      {
         return var_864;
      }
      
      public function get isActive() : Boolean
      {
         return var_252;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1448;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_1796;
      }
   }
}
