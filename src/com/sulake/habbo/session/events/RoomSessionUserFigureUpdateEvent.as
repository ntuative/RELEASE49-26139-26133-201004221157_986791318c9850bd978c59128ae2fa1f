package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_149:String = "RSUBE_FIGURE";
       
      
      private var var_577:String = "";
      
      private var var_314:String = "";
      
      private var _userId:int = 0;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_149,param1,param5,param6);
         _userId = param2;
         var_314 = param3;
         var_577 = param4;
      }
      
      public function get gender() : String
      {
         return var_577;
      }
      
      public function get figure() : String
      {
         return var_314;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
