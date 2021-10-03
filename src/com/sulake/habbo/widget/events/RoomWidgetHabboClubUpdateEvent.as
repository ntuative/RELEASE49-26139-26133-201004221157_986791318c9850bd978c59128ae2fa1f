package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_229:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2063:Boolean = false;
      
      private var var_2064:int = 0;
      
      private var var_2062:int = 0;
      
      private var var_2057:int;
      
      private var var_2065:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_229,param6,param7);
         var_2065 = param1;
         var_2062 = param2;
         var_2064 = param3;
         var_2063 = param4;
         var_2057 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_2057;
      }
      
      public function get pastPeriods() : int
      {
         return var_2064;
      }
      
      public function get periodsLeft() : int
      {
         return var_2062;
      }
      
      public function get daysLeft() : int
      {
         return var_2065;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2063;
      }
   }
}
