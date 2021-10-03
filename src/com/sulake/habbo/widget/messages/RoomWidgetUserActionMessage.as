package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_633:String = "RWUAM_RESPECT_USER";
      
      public static const const_608:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_693:String = "RWUAM_START_TRADING";
      
      public static const const_570:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_680:String = "RWUAM_WHISPER_USER";
      
      public static const const_722:String = "RWUAM_IGNORE_USER";
      
      public static const const_378:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_663:String = "RWUAM_BAN_USER";
      
      public static const const_653:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_441:String = "RWUAM_KICK_USER";
      
      public static const const_676:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_706:String = " RWUAM_RESPECT_PET";
      
      public static const const_429:String = "RWUAM_KICK_BOT";
      
      public static const const_1212:String = "RWUAM_TRAIN_PET";
      
      public static const const_721:String = "RWUAM_PICKUP_PET";
      
      public static const const_637:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_605:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         _userId = param2;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
