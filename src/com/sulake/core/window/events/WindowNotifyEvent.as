package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1175:String = "WN_CREATED";
      
      public static const const_931:String = "WN_DISABLE";
      
      public static const const_994:String = "WN_DEACTIVATED";
      
      public static const const_1014:String = "WN_OPENED";
      
      public static const const_855:String = "WN_CLOSED";
      
      public static const const_844:String = "WN_DESTROY";
      
      public static const const_1564:String = "WN_ARRANGED";
      
      public static const const_367:String = "WN_PARENT_RESIZED";
      
      public static const const_998:String = "WN_ENABLE";
      
      public static const const_805:String = "WN_RELOCATE";
      
      public static const const_870:String = "WN_FOCUS";
      
      public static const const_868:String = "WN_PARENT_RELOCATED";
      
      public static const const_426:String = "WN_PARAM_UPDATED";
      
      public static const const_677:String = "WN_PARENT_ACTIVATED";
      
      public static const const_167:String = "WN_RESIZED";
      
      public static const const_883:String = "WN_CLOSE";
      
      public static const const_995:String = "WN_PARENT_REMOVED";
      
      public static const const_245:String = "WN_CHILD_RELOCATED";
      
      public static const const_551:String = "WN_ENABLED";
      
      public static const const_259:String = "WN_CHILD_RESIZED";
      
      public static const const_854:String = "WN_MINIMIZED";
      
      public static const const_516:String = "WN_DISABLED";
      
      public static const const_222:String = "WN_CHILD_ACTIVATED";
      
      public static const const_369:String = "WN_STATE_UPDATED";
      
      public static const const_741:String = "WN_UNSELECTED";
      
      public static const const_487:String = "WN_STYLE_UPDATED";
      
      public static const const_1531:String = "WN_UPDATE";
      
      public static const const_462:String = "WN_PARENT_ADDED";
      
      public static const const_597:String = "WN_RESIZE";
      
      public static const const_734:String = "WN_CHILD_REMOVED";
      
      public static const const_1578:String = "";
      
      public static const const_810:String = "WN_RESTORED";
      
      public static const const_310:String = "WN_SELECTED";
      
      public static const const_1021:String = "WN_MINIMIZE";
      
      public static const const_890:String = "WN_FOCUSED";
      
      public static const const_1299:String = "WN_LOCK";
      
      public static const const_341:String = "WN_CHILD_ADDED";
      
      public static const const_847:String = "WN_UNFOCUSED";
      
      public static const const_382:String = "WN_RELOCATED";
      
      public static const const_866:String = "WN_DEACTIVATE";
      
      public static const const_1217:String = "WN_CRETAE";
      
      public static const const_909:String = "WN_RESTORE";
      
      public static const const_334:String = "WN_ACTVATED";
      
      public static const const_1257:String = "WN_LOCKED";
      
      public static const const_439:String = "WN_SELECT";
      
      public static const const_1004:String = "WN_MAXIMIZE";
      
      public static const const_802:String = "WN_OPEN";
      
      public static const const_728:String = "WN_UNSELECT";
      
      public static const const_1581:String = "WN_ARRANGE";
      
      public static const const_1315:String = "WN_UNLOCKED";
      
      public static const const_1566:String = "WN_UPDATED";
      
      public static const const_1008:String = "WN_ACTIVATE";
      
      public static const const_1236:String = "WN_UNLOCK";
      
      public static const const_921:String = "WN_MAXIMIZED";
      
      public static const const_876:String = "WN_DESTROYED";
      
      public static const const_894:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1612,cancelable);
      }
   }
}
