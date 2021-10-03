package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_754:int = 10;
      
      private static const const_491:int = 25;
      
      private static const const_1048:int = 6000;
      
      private static const const_1047:int = 9;
      
      private static const const_755:int = 4000;
      
      private static const const_1045:int = 3;
      
      private static const const_102:int = 18;
      
      private static const const_1044:int = 25;
      
      private static const const_1046:int = 1;
      
      private static const const_280:int = 9;
      
      private static const const_490:int = 8;
      
      private static const const_346:int = 0;
      
      private static const const_492:int = (const_490 + const_346) * const_102 + const_102;
       
      
      private var var_796:Number = 1;
      
      private var _disposed:Boolean = false;
      
      private var var_559:int = 18;
      
      private var var_334:IItemListWindow;
      
      private var var_661:int = 0;
      
      private var var_36:IWindowContainer;
      
      private var var_434:Boolean = false;
      
      private var var_148:int;
      
      private var var_1655:int = 0;
      
      private var var_1142:Boolean = false;
      
      private var var_123:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_26:RoomChatHistoryViewer;
      
      private var var_1656:int = 150;
      
      private var var_471:Number = 1;
      
      private var var_64:Array;
      
      private var var_218:Array;
      
      private var var_662:int = 0;
      
      private var var_1657:int;
      
      private var var_660:Point;
      
      private var var_1407:Number = 0;
      
      private var var_22:Component = null;
      
      public function RoomChatWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:int, param6:Component)
      {
         _itemList = new Array();
         var_64 = new Array();
         var_218 = new Array();
         var_660 = new Point();
         var_148 = const_492 + const_280;
         super(param1,param2,param3);
         var_1657 = param5;
         var_36 = param1.createWindow("chat_container","",HabboWindowType.const_60,HabboWindowStyle.const_43,HabboWindowParam.const_42,new Rectangle(0,0,200,var_148 + RoomChatHistoryPulldown.const_77),null,0) as IWindowContainer;
         var_36.background = true;
         var_36.color = 33554431;
         var_36.tags.push("room_widget_chat");
         var_334 = param1.createWindow("chat_contentlist","",HabboWindowType.const_887,HabboWindowStyle.const_42,0 | 0,new Rectangle(0,0,200,var_148),null,0) as IItemListWindow;
         var_36.addChild(var_334);
         var_123 = param1.createWindow("chat_active_content","",HabboWindowType.const_60,HabboWindowStyle.const_42,HabboWindowParam.const_72,new Rectangle(0,0,200,var_148),null,0) as IWindowContainer;
         var_334.addListItem(var_123);
         var_26 = new RoomChatHistoryViewer(this,param1,var_36,param2);
         var_1656 = int(param4.getKey("chat.history.item.max.count","150"));
         var _loc7_:Boolean = int(param4.getKey("chat.history.disabled","0")) == 1 ? true : false;
         if(var_26 != null)
         {
            var_26.disabled = _loc7_;
         }
         if(param6 != null)
         {
            var_22 = param6;
            var_22.registerUpdateReceiver(this,1);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(var_26 != null)
         {
            var_26.hideHistoryViewer();
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_519,onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_263,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_521,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_571,onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return var_36;
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function resetArea() : void
      {
         if(var_26 == null)
         {
            return;
         }
         animationStop();
         var_148 = const_492 + const_280;
         var_36.height = var_148 + var_26.pulldownBarHeight;
         var_334.width = 0 - 0;
         var_334.height = var_148;
         var_123.width = 0 - 0;
         if(method_2())
         {
            var_123.height = getTotalContentHeight() + const_280;
         }
         else
         {
            var_123.height = var_148;
         }
         var_334.scrollV = 1;
         if(!method_2())
         {
            var_26.containerResized(var_36.rectangle);
         }
         purgeItems();
         alignItems();
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_64.length)
         {
            _loc4_ = var_64[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_491;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = var_36.rectangle.bottom;
         stretchAreaBottomTo(var_36.rectangle.top + _loc1_);
         _loc3_ -= var_36.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_975)
         {
            resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_64.length)
         {
            _loc4_ = var_64[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         var_1142 = true;
      }
      
      private function processBuffer() : void
      {
         if(var_434)
         {
            return;
         }
         if(false)
         {
            return;
         }
         while(var_64.length > const_1046 || method_2() && false)
         {
            activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(false)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = checkLastItemAllowsAdding(var_64[0]);
         }
         if(_loc1_)
         {
            activateItemFromBuffer();
            var_661 = getTimer() + const_755;
         }
         else
         {
            if(false && false)
            {
               var_559 = getItemSpacing(_itemList["-1"],var_64[0]);
            }
            else
            {
               var_559 = const_102;
            }
            animationStart();
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || var_26 == null)
         {
            return;
         }
         var _loc2_:Number = (param1.senderX + var_660.x) * var_796;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = 0 - const_754;
         var _loc6_:Number = 0 + const_754 - 0;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + 0 + var_36.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(false)
         {
            return true;
         }
         var _loc2_:RoomChatItem = _itemList["-1"];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(var_123.rectangle.bottom - (var_123.y + _loc2_.y + _loc2_.height) <= getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = var_36.rectangle.bottom - 0;
         if(_loc1_ < const_492)
         {
            if(_loc1_ <= var_148 + var_36.y)
            {
               if(method_2())
               {
                  hideHistoryViewer();
               }
               resetArea();
               return;
            }
         }
         if(var_1142 && !method_2())
         {
            resetArea();
            var_1142 = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + var_1657.toString() + "_item_" + (var_1655++).toString();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         while(false)
         {
            _loc1_ = var_218.shift();
         }
         var_26.dispose();
         var_26 = null;
         while(false)
         {
            _loc1_ = _itemList.shift();
            _loc1_.dispose();
         }
         while(false)
         {
            _loc1_ = var_64.shift();
            _loc1_.dispose();
         }
         var_36.dispose();
         if(var_22 != null)
         {
            var_22.removeUpdateReceiver(this);
            var_22 = null;
         }
         super.dispose();
         _disposed = true;
      }
      
      private function animationStop() : void
      {
         var_434 = false;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_519,onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_263,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_521,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_571,onRoomViewUpdate);
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(var_26 != null)
         {
            var_26.beginDrag(param1.stageY,true);
         }
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_26 == null)
         {
            return;
         }
         _loc1_ = -1;
         while(_loc1_ >= 0)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
               setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < _itemList.length)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < var_64.length)
         {
            _loc2_ = var_64[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,getFreeItemId(),localizations);
         _loc2_.define(param1);
         if(var_796 != 1)
         {
            _loc2_.senderX /= var_796;
         }
         _loc2_.senderX -= 0;
         setChatItemLocHorizontal(_loc2_);
         var_64.push(_loc2_);
         processBuffer();
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = _itemList.indexOf(param1);
            _loc3_ = !!method_2() ? 0 : Number(var_471);
            if(_loc2_ == -1)
            {
               param1.y = getAreaBottom() - (_loc3_ + 1) * const_102 - const_280;
            }
            else
            {
               _loc4_ = _itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = _itemList[_loc2_ + 1].y - getItemSpacing(param1,_itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = _itemList[_loc2_ + 1].y - _loc4_ * const_102;
               }
            }
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_64.length)
         {
            _loc1_ = var_64[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
      
      private function animationStart() : void
      {
         if(var_434)
         {
            return;
         }
         selectItemsToMove();
         var_434 = true;
      }
      
      public function hideHistoryViewer() : void
      {
         if(var_26 != null)
         {
            var_26.hideHistoryViewer();
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > var_661 && var_661 > 0)
         {
            var_661 = -1;
            animationStart();
         }
         if(var_434)
         {
            _loc2_ = param1 / const_1044 * const_1045;
            if(_loc2_ + var_662 > var_559)
            {
               _loc2_ = var_559 - var_662;
            }
            if(_loc2_ > 0)
            {
               moveItemsUp(_loc2_);
               var_662 += _loc2_;
            }
            if(var_662 >= var_559)
            {
               var_559 = const_102;
               var_662 = 0;
               animationStop();
               processBuffer();
               var_661 = getTimer() + const_755;
            }
         }
         if(var_26 != null)
         {
            var_26.update(param1);
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_102;
               }
               else
               {
                  _loc2_ += getItemSpacing(_itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_102;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(var_1407 == 0)
            {
               var_1407 = param1.scale;
            }
            else
            {
               var_796 = param1.scale / var_1407;
            }
         }
         if(param1.positionDelta != null)
         {
            var_660.x += param1.positionDelta.x / var_796;
            var_660.y += param1.positionDelta.y / var_796;
         }
         if(param1.rect != null)
         {
            if(var_26 == null)
            {
               return;
            }
            var_36.width = _loc2_.width;
            var_36.height = var_148 + var_26.pulldownBarHeight;
            var_334.width = 0 - 0;
            var_334.height = var_148;
            var_334.x = var_36.x;
            var_334.y = var_36.y;
            var_123.width = 0 - 0;
            var_123.height = var_148;
            if(method_2())
            {
               reAlignItemsToHistoryContent();
            }
            var_26.containerResized(var_36.rectangle,true);
         }
         alignItems();
      }
      
      private function getAreaBottom() : Number
      {
         if(method_2())
         {
            return var_123.height;
         }
         return var_148 + var_36.y;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(method_2())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(_itemList.length > var_1656)
         {
            _loc2_ = _itemList.shift();
            _loc3_ = var_218.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               var_218.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               var_123.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < _itemList.length; _loc1_++)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_491)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = var_218.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     var_218.splice(_loc3_,1);
                  }
                  var_123.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(false)
         {
            _loc4_ = true;
         }
         if(getTotalContentHeight() > const_102 && !_loc4_ && !method_2())
         {
            if(var_26 != null)
            {
               stretchAreaBottomTo(var_36.y);
               alignItems();
               if(!method_2())
               {
                  var_26.showHistoryViewer();
               }
               if(!historyViewerVisible())
               {
                  var_26.visible = true;
               }
            }
         }
         else if(historyViewerVisible())
         {
            var_26.visible = false;
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = var_36.rectangle.bottom + param1 - 0;
         stretchAreaBottomTo(_loc2_);
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(false)
         {
            return;
         }
         if(historyViewerMinimized())
         {
            resetArea();
            hideHistoryViewer();
         }
         if(!checkLastItemAllowsAdding(var_64[0]))
         {
            selectItemsToMove();
            moveItemsUp(getItemSpacing(_itemList["-1"],var_64[0]));
            if(!checkLastItemAllowsAdding(var_64[0]))
            {
               var_123.height += const_102;
               if(var_26 != null)
               {
                  var_26.containerResized(var_36.rectangle);
               }
            }
         }
         _loc1_ = var_64.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               var_123.addChild(_loc2_);
               _loc1_.timestamp = new Date().time;
               _itemList.push(_loc1_);
               _loc3_ = 0;
               if(false)
               {
                  _loc3_ = _itemList["-2"].screenLevel;
                  if(method_2())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(var_471,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = var_471;
               if(_loc1_.aboveLevels > const_490 + const_346 + 2)
               {
                  _loc1_.aboveLevels = const_490 + const_346 + 2;
               }
               var_471 = 0;
               setChatItemLocHorizontal(_loc1_);
               setChatItemLocVertical(_loc1_);
               setChatItemRenderable(_loc1_);
            }
         }
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = var_36.context.getDesktopWindow().height - 0;
         param1 = Math.min(param1,_loc2_);
         var_148 = param1 - 0;
         var_36.height = var_148 + RoomChatHistoryPulldown.const_77;
         if(var_26 != null)
         {
            var_26.containerResized(var_36.rectangle);
         }
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:int, param6:WindowMouseEvent) : void
      {
         if(param6.shiftKey)
         {
            if(var_26 != null)
            {
               var_26.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_314,param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc8_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_730,param1,param2,param4,param5);
         messageListener.processWidgetMessage(_loc8_);
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(var_434)
         {
            return;
         }
         purgeItems();
         var_218 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(false)
         {
            var_471 = 1;
            return;
         }
         if(method_2())
         {
            return;
         }
         ++var_471;
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_346 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timestamp >= const_1048)
               {
                  _loc4_.timestamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  var_218.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_64.length)
         {
            _loc1_ = var_64[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(method_2())
         {
            var_123.height = getTotalContentHeight() + const_280;
            alignItems();
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_491)
            {
               if(param1.view != null)
               {
                  var_123.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  var_123.addChild(param1.view);
               }
            }
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return true;
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(var_218 == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         while(_loc5_ >= 0)
         {
            _loc2_ = var_218[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = _itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(method_2())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(_itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - _itemList[_loc4_ - 1].y < getItemSpacing(_itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function method_2() : Boolean
      {
         return var_26 == null ? false : Boolean(var_26.active);
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_102;
         }
         return const_1047;
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(historyViewerVisible())
         {
            return;
         }
         if(var_26 != null)
         {
            var_26.beginDrag(param5.stageY);
         }
      }
      
      private function historyViewerVisible() : Boolean
      {
         return var_26 == null ? false : Boolean(var_26.visible);
      }
   }
}
