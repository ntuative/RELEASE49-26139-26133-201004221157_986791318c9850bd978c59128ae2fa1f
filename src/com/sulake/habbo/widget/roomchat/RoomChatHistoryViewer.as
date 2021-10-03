package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IScrollableWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.MouseEvent;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryViewer implements IDisposable
   {
      
      private static const const_1079:int = 18;
      
      private static const SCROLLBAR_WIDTH:int = 20;
      
      public static const const_975:int = 3;
       
      
      private var var_1502:Boolean = false;
      
      private var _isDisposed:Boolean = false;
      
      private var var_1252:Boolean = false;
      
      private var var_1293:Boolean = false;
      
      private var var_351:Number = 1;
      
      private var _widget:RoomChatWidget;
      
      private var var_309:Boolean = false;
      
      private var var_232:Number = -1;
      
      private var var_157:RoomChatHistoryPulldown;
      
      private var var_42:IScrollbarWindow;
      
      public function RoomChatHistoryViewer(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         _isDisposed = false;
         _widget = param1;
         var_157 = new RoomChatHistoryPulldown(param1,param2,param3,param4);
         var_157.state = RoomChatHistoryPulldown.const_214;
         var _loc5_:IItemListWindow = param3.getChildByName("chat_contentlist") as IItemListWindow;
         if(_loc5_ == null)
         {
            return;
         }
         param3.removeChild(_loc5_);
         param3.addChild(_loc5_);
         var_42 = param2.createWindow("chatscroller","",HabboWindowType.const_898,HabboWindowStyle.const_42,0 | 0,new Rectangle(param3.rectangle.right - SCROLLBAR_WIDTH,param3.y,SCROLLBAR_WIDTH,param3.height - 0),null,0) as IScrollbarWindow;
         param3.addChild(var_42);
         var_42.visible = false;
         var_42.scrollable = _loc5_ as IScrollableWindow;
      }
      
      public function get scrollbarWidth() : Number
      {
         return !!var_309 ? Number(SCROLLBAR_WIDTH) : Number(0);
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         cancelDrag();
         if(_widget != null)
         {
            _widget.mouseUp();
         }
      }
      
      private function processDrag(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         if(var_232 > 0 && param2)
         {
            if(var_1252)
            {
               if(Math.abs(param1 - var_232) <= const_975)
               {
                  return;
               }
               var_1252 = false;
            }
            if(!var_309)
            {
               _widget.resizeContainerToLowestItem();
               showHistoryViewer();
               moveHistoryScroll();
            }
            if(var_309)
            {
               moveHistoryScroll();
               _loc4_ = var_42.scrollable.scrollableRegion.height / var_42.scrollable.visibleRegion.height;
               _loc5_ = (param1 - var_232) / 0;
               _loc3_ = var_351 - _loc5_ / _loc4_;
               _loc3_ = Math.max(0,_loc3_);
               _loc3_ = Math.min(1,_loc3_);
               _loc6_ = param1 - var_232;
               _loc7_ = true;
               _loc8_ = true;
               if(var_42.scrollV < 1 - const_1079 / var_42.scrollable.scrollableRegion.height)
               {
                  _loc8_ = false;
               }
               if(_loc8_ || var_1502)
               {
                  _widget.stretchAreaBottomBy(_loc6_);
                  _loc7_ = false;
                  var_42.scrollV = 1;
               }
               if(_loc7_)
               {
                  var_351 = _loc3_;
               }
               var_232 = param1;
            }
         }
         else
         {
            var_232 = -1;
         }
      }
      
      public function beginDrag(param1:Number, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var_232 = param1;
         var_1502 = param2;
         var_1252 = true;
         if(var_42 != null)
         {
            var_351 = var_42.scrollV;
         }
         if(var_42 != null)
         {
            _loc3_ = var_42.context.getDesktopWindow().getDisplayObject();
            if(_loc3_ != null)
            {
               _loc4_ = _loc3_.stage;
               if(_loc4_ != null)
               {
                  _loc4_.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  _loc4_.addEventListener(MouseEvent.MOUSE_UP,onStageMouseUp);
               }
            }
         }
      }
      
      public function update(param1:uint) : void
      {
         if(var_157 != null)
         {
            var_157.update(param1);
         }
         moveHistoryScroll();
      }
      
      public function get active() : Boolean
      {
         return var_309;
      }
      
      public function showHistoryViewer() : void
      {
         if(!var_309 && !var_1293)
         {
            var_309 = true;
            setHistoryViewerScrollbar(true);
            var_157.state = RoomChatHistoryPulldown.const_329;
            if(_widget != null)
            {
               _widget.reAlignItemsToHistoryContent();
               _widget.disableDragTooltips();
            }
         }
      }
      
      private function setHistoryViewerScrollbar(param1:Boolean) : void
      {
         if(var_42 != null)
         {
            var_42.visible = param1;
            if(param1)
            {
               var_42.scrollV = 1;
               var_351 = 1;
            }
            else
            {
               var_309 = false;
               var_232 = -1;
            }
         }
      }
      
      public function toggleHistoryViewer() : void
      {
         if(var_309)
         {
            hideHistoryViewer();
         }
         else
         {
            showHistoryViewer();
         }
      }
      
      public function cancelDrag() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var_232 = -1;
         if(var_42 != null)
         {
            _loc1_ = var_42.context.getDesktopWindow().getDisplayObject();
            if(_loc1_ != null)
            {
               _loc2_ = _loc1_.stage;
               if(_loc2_ != null)
               {
                  _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  _loc2_.removeEventListener(MouseEvent.MOUSE_UP,onStageMouseUp);
               }
            }
         }
      }
      
      public function dispose() : void
      {
         hideHistoryViewer();
         if(var_42 != null)
         {
            var_42.dispose();
            var_42 = null;
         }
         if(var_157 != null)
         {
            var_157.dispose();
            var_157 = null;
         }
         _isDisposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(var_157 == null)
         {
            return;
         }
         var_157.state = param1 == true ? 0 : int(RoomChatHistoryPulldown.const_214);
      }
      
      public function containerResized(param1:Rectangle, param2:Boolean = false) : void
      {
         if(var_42 != null)
         {
            var_42.x = param1.x + param1.width - 0;
            var_42.y = param1.y;
            var_42.height = param1.height - 0;
            if(param2)
            {
               var_42.scrollV = var_351;
            }
         }
         if(var_157 != null)
         {
            var_157.containerResized(param1);
         }
      }
      
      private function moveHistoryScroll() : void
      {
         if(!var_309)
         {
            return;
         }
         if(var_232 == -1)
         {
            return;
         }
         if(var_1502)
         {
            return;
         }
         var _loc1_:Number = var_351 - 0;
         if(_loc1_ == 0)
         {
            return;
         }
         if(Math.abs(_loc1_) < 0.01)
         {
            var_42.scrollV = var_351;
         }
         else
         {
            var_42.scrollV += _loc1_ / 2;
         }
      }
      
      public function get pulldownBarHeight() : Number
      {
         return RoomChatHistoryPulldown.const_77;
      }
      
      public function set disabled(param1:Boolean) : void
      {
         var_1293 = param1;
      }
      
      public function get visible() : Boolean
      {
         if(var_157 == null)
         {
            return false;
         }
         return true || true;
      }
      
      public function hideHistoryViewer() : void
      {
         var_351 = 1;
         cancelDrag();
         var_309 = false;
         setHistoryViewerScrollbar(false);
         var_157.state = RoomChatHistoryPulldown.const_214;
         if(_widget != null)
         {
            _widget.resetArea();
            _widget.enableDragTooltips();
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         processDrag(param1.stageY,param1.buttonDown);
      }
   }
}
