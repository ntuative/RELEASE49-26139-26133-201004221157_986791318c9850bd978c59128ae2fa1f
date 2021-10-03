package com.sulake.habbo.help.enum
{
   import flash.events.Event;
   
   public class HabboHelpTutorialEvent extends Event
   {
      
      public static const const_451:String = "HHTPNUFWE_DONE_GUIDEBOT";
      
      public static const const_468:String = "HHTE_DONE_AVATAR_EDITOR_CLOSING";
      
      public static const const_106:String = "HHTPNUFWE_AVATAR_TUTORIAL_START";
      
      public static const const_473:String = "HHTPNUFWE_LIGHT_CLOTHES_ICON";
      
      public static const const_467:String = "HHTE_DONE_AVATAR_EDITOR_OPENING";
       
      
      public function HabboHelpTutorialEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
