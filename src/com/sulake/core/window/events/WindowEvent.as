package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_241:String = "WE_CHILD_RESIZED";
      
      public static const const_1294:String = "WE_CLOSE";
      
      public static const const_1366:String = "WE_DESTROY";
      
      public static const const_125:String = "WE_CHANGE";
      
      public static const const_1172:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1514:String = "WE_PARENT_RESIZE";
      
      public static const const_99:String = "WE_UPDATE";
      
      public static const const_1255:String = "WE_MAXIMIZE";
      
      public static const const_388:String = "WE_DESTROYED";
      
      public static const const_859:String = "WE_UNSELECT";
      
      public static const const_1211:String = "WE_MAXIMIZED";
      
      public static const const_1598:String = "WE_UNLOCKED";
      
      public static const const_455:String = "WE_CHILD_REMOVED";
      
      public static const const_154:String = "WE_OK";
      
      public static const const_48:String = "WE_RESIZED";
      
      public static const const_1154:String = "WE_ACTIVATE";
      
      public static const const_255:String = "WE_ENABLED";
      
      public static const const_375:String = "WE_CHILD_RELOCATED";
      
      public static const const_1295:String = "WE_CREATE";
      
      public static const const_686:String = "WE_SELECT";
      
      public static const const_158:String = "";
      
      public static const const_1539:String = "WE_LOCKED";
      
      public static const const_1533:String = "WE_PARENT_RELOCATE";
      
      public static const const_1442:String = "WE_CHILD_REMOVE";
      
      public static const const_1446:String = "WE_CHILD_RELOCATE";
      
      public static const const_1625:String = "WE_LOCK";
      
      public static const const_234:String = "WE_FOCUSED";
      
      public static const const_579:String = "WE_UNSELECTED";
      
      public static const const_835:String = "WE_DEACTIVATED";
      
      public static const const_1141:String = "WE_MINIMIZED";
      
      public static const const_1592:String = "WE_ARRANGED";
      
      public static const const_1557:String = "WE_UNLOCK";
      
      public static const const_1595:String = "WE_ATTACH";
      
      public static const const_1397:String = "WE_OPEN";
      
      public static const const_1204:String = "WE_RESTORE";
      
      public static const const_1619:String = "WE_PARENT_RELOCATED";
      
      public static const const_1337:String = "WE_RELOCATE";
      
      public static const const_1448:String = "WE_CHILD_RESIZE";
      
      public static const const_1528:String = "WE_ARRANGE";
      
      public static const const_1228:String = "WE_OPENED";
      
      public static const const_1333:String = "WE_CLOSED";
      
      public static const const_1630:String = "WE_DETACHED";
      
      public static const const_1544:String = "WE_UPDATED";
      
      public static const const_1233:String = "WE_UNFOCUSED";
      
      public static const const_437:String = "WE_RELOCATED";
      
      public static const const_1378:String = "WE_DEACTIVATE";
      
      public static const const_223:String = "WE_DISABLED";
      
      public static const const_715:String = "WE_CANCEL";
      
      public static const const_634:String = "WE_ENABLE";
      
      public static const const_1376:String = "WE_ACTIVATED";
      
      public static const const_1247:String = "WE_FOCUS";
      
      public static const const_1492:String = "WE_DETACH";
      
      public static const const_1306:String = "WE_RESTORED";
      
      public static const const_1192:String = "WE_UNFOCUS";
      
      public static const const_62:String = "WE_SELECTED";
      
      public static const const_1350:String = "WE_PARENT_RESIZED";
      
      public static const const_1363:String = "WE_CREATED";
      
      public static const const_1473:String = "WE_ATTACHED";
      
      public static const const_1209:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1612:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1384:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1612 = param3;
         var_1384 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1384;
      }
      
      public function get related() : IWindow
      {
         return var_1612;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1384 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
