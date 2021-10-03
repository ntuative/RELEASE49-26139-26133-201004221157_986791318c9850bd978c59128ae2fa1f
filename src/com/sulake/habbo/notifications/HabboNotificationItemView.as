package com.sulake.habbo.notifications
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.session.events.BadgeImageReadyEvent;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class HabboNotificationItemView implements IUpdateReceiver
   {
      
      private static const const_350:int = 0;
      
      private static const const_351:Number = 50;
      
      public static const const_644:int = 70;
      
      private static const const_782:int = 2;
      
      public static const const_372:int = 4;
      
      private static const const_781:int = 3;
      
      private static const const_401:int = 1;
       
      
      private var var_1263:Boolean = false;
      
      private var var_588:int;
      
      private var _window:IWindow;
      
      private var var_1506:int;
      
      private var var_419:Number;
      
      private var var_1968:Map;
      
      private var var_32:int;
      
      private var var_1038:uint;
      
      private var var_1262:int;
      
      private var var_854:uint;
      
      private var var_420:Map;
      
      private var var_853:uint;
      
      private var var_220:HabboNotificationItem;
      
      private var var_194:IHabboToolbar;
      
      public function HabboNotificationItemView(param1:IAsset, param2:IHabboWindowManager, param3:Map, param4:Map, param5:IHabboToolbar)
      {
         super();
         var_1968 = param3;
         var_420 = param4;
         var _loc6_:XmlAsset = param1 as XmlAsset;
         if(_loc6_ == null)
         {
            return;
         }
         _window = ICoreWindowManager(param2).buildFromXML(_loc6_.content as XML,1);
         _window.tags.push("notificationview");
         _window.context.getDesktopWindow().addEventListener(WindowEvent.const_48,onRoomViewResized);
         _window.procedure = onWindowEvent;
         _window.blend = 0;
         _window.visible = false;
         var _loc7_:ITextWindow = IWindowContainer(_window).findChildByTag("notification_text") as ITextWindow;
         if(_loc7_ != null)
         {
            var_1262 = 0 - _loc7_.rectangle.bottom;
         }
         else
         {
            var_1262 = 15;
         }
         var_1506 = _window.height;
         var_588 = 4;
         var_419 = 0;
         var_32 = const_350;
         var_194 = param5;
      }
      
      private function startDisplay() : void
      {
         var_1038 = 0;
         var_32 = const_782;
      }
      
      private function setNotificationText(param1:String) : void
      {
         var _loc2_:ITextWindow = IWindowContainer(_window).findChildByTag("notification_text") as ITextWindow;
         if(_loc2_ == null || param1 == null)
         {
            return;
         }
         _window.height = 0;
         _loc2_.text = param1;
         _loc2_.height = _loc2_.textHeight + var_1262;
         if(_window.height < var_1506)
         {
            _window.height = var_1506;
         }
      }
      
      private function startFadeIn() : void
      {
         var_854 = 0;
         var_32 = const_401;
         _window.visible = true;
      }
      
      private function setNotificationIcon(param1:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:IBitmapWrapperWindow = IWindowContainer(_window).findChildByTag("notification_icon") as IBitmapWrapperWindow;
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            _loc2_.bitmap = null;
            return;
         }
         if(param1.width < _loc2_.width && param1.height < _loc2_.height)
         {
            _loc3_ = new BitmapData(_loc2_.width,_loc2_.height,true,0);
            _loc5_ = (_loc2_.width - param1.width) / 2;
            _loc6_ = (_loc2_.height - param1.height) / 2;
            _loc3_.copyPixels(param1,param1.rect,new Point(_loc5_,_loc6_));
         }
         else if(param1.width < param1.height)
         {
            _loc3_ = new BitmapData(param1.height,param1.height,true,0);
            _loc4_ = (param1.height * _loc2_.width - param1.width * _loc2_.width) / 2 / _loc2_.width;
            _loc3_.copyPixels(param1,param1.rect,new Point(_loc4_,0));
         }
         else if(param1.width > param1.height)
         {
            _loc3_ = new BitmapData(param1.width,param1.width,true,0);
            _loc4_ = (param1.width * _loc2_.height - param1.height * _loc2_.height) / 2 / _loc2_.height;
            _loc3_.copyPixels(param1,param1.rect,new Point(0,_loc4_));
         }
         else
         {
            _loc3_ = new BitmapData(param1.width,param1.height);
            _loc3_.copyPixels(param1,param1.rect,new Point(0,0));
         }
         _loc2_.bitmap = _loc3_;
      }
      
      private function startFadeOut() : void
      {
         var_853 = 0;
         var_32 = const_781;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         switch(var_32)
         {
            case const_350:
               break;
            case const_401:
               var_854 += param1;
               _loc2_ = Number(var_854) / Number(var_420["time_fade_in"]);
               if(var_854 > int(var_420["time_fade_in"]))
               {
                  startDisplay();
               }
               adjustBlend(_loc2_);
               break;
            case const_782:
               var_1038 += param1;
               if(var_1038 > int(var_420["time_display"]) && !var_1263)
               {
                  startFadeOut();
               }
               break;
            case const_781:
               var_853 += param1;
               _loc3_ = 1 - Number(var_853) / Number(var_420["time_fade_out"]);
               adjustBlend(_loc3_);
               if(var_853 > int(var_420["time_fade_in"]))
               {
                  startIdling();
               }
         }
      }
      
      private function startIdling() : void
      {
         var_32 = const_350;
         _window.visible = false;
      }
      
      public function reposition(param1:int = -1) : void
      {
         if(_window == null)
         {
            return;
         }
         if(var_194 == null)
         {
            return;
         }
         var _loc2_:IDesktopWindow = _window.context.getDesktopWindow();
         if(_loc2_ == null)
         {
            return;
         }
         if(param1 != -1)
         {
            var_588 = param1;
         }
         var _loc3_:int = var_194.orientation == "TOP" ? int(const_351) : 0;
         var _loc4_:int = var_194.orientation == "BOTTOM" ? int(_loc2_.height - const_351) : int(_loc2_.height);
         var _loc5_:int = var_194.orientation == "LEFT" ? int(const_351) : 0;
         var _loc6_:int = var_194.orientation == "RIGHT" ? int(_loc2_.width - const_351) : int(_loc2_.width);
         if(false)
         {
            if(false)
            {
               _window.x = _loc5_ + const_372;
            }
            else
            {
               _window.x = _loc6_ - 0 - const_372;
            }
         }
         else if(false)
         {
            _window.x = _loc5_ + const_372;
         }
         else
         {
            _window.x = _loc6_ - 0 - const_372;
         }
         if(false)
         {
            if(false)
            {
               _window.y = _loc3_ + var_588;
            }
            else
            {
               _window.y = _loc4_ - 0 - var_588;
            }
         }
         else if(false)
         {
            _window.y = _loc3_ + var_588;
         }
         else
         {
            _window.y = _loc4_ - 0 - var_588;
         }
      }
      
      public function onWindowEvent(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            var_1263 = true;
            Logger.log("notifications - hover on");
         }
         else if(param1.type == WindowMouseEvent.const_33)
         {
            var_1263 = false;
            Logger.log("notifications - hover off");
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            if(var_220 != null)
            {
               var_220.ExecuteUiLinks();
            }
         }
      }
      
      public function replaceIcon(param1:BadgeImageReadyEvent) : void
      {
         if(param1.badgeId != var_220.style.iconSrc)
         {
            return;
         }
         if(param1.badgeImage != null)
         {
            setNotificationIcon(param1.badgeImage);
         }
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         reposition();
      }
      
      public function get ready() : Boolean
      {
         return var_32 == const_350;
      }
      
      public function get disposed() : Boolean
      {
         return _window == null;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function showItem(param1:HabboNotificationItem) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = param1.content;
         setNotificationText(_loc2_);
         var _loc3_:BitmapData = param1.style.icon;
         setNotificationIcon(_loc3_);
         var_220 = param1;
         reposition();
         startFadeIn();
      }
      
      private function adjustBlend(param1:Number) : void
      {
         var_419 = param1;
         if(var_419 > 1)
         {
            var_419 = 1;
         }
         if(var_419 < 0)
         {
            var_419 = 0;
         }
         _window.blend = var_419;
      }
      
      public function get verticalPosition() : int
      {
         return var_588;
      }
   }
}
