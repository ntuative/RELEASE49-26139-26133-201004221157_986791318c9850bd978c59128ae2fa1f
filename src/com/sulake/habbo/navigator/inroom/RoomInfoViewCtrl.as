package com.sulake.habbo.navigator.inroom
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.outgoing.navigator.AddFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.CanCreateEventMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.DeleteFavouriteRoomMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RateFlatMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.UpdateNavigatorSettingsMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.SimpleAlertView;
   import com.sulake.habbo.navigator.TagRenderer;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.events.HabboRoomSettingsTrackingEvent;
   import com.sulake.habbo.navigator.roomsettings.IRoomSettingsCtrlOwner;
   import com.sulake.habbo.navigator.roomsettings.RoomSettingsCtrl;
   import com.sulake.habbo.navigator.roomthumbnails.RoomThumbnailCtrl;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class RoomInfoViewCtrl implements IRoomSettingsCtrlOwner
   {
       
      
      private var var_753:IWindowContainer;
      
      private var var_1078:ITextWindow;
      
      private var var_207:RoomSettingsCtrl;
      
      private var var_1332:IContainerButtonWindow;
      
      private var _window:IWindowContainer;
      
      private var _hideInfoTimer:Timer;
      
      private var var_1334:ITextWindow;
      
      private var var_365:IWindowContainer;
      
      private var var_2187:IWindowContainer;
      
      private var var_2188:ITextWindow;
      
      private var var_910:IWindowContainer;
      
      private var var_1576:IButtonWindow;
      
      private var _ownerName:ITextWindow;
      
      private var var_770:ITextWindow;
      
      private var var_1578:IWindowContainer;
      
      private var var_1331:IWindowContainer;
      
      private var var_911:ITextWindow;
      
      private var var_1079:ITextFieldWindow;
      
      private var var_320:IWindowContainer;
      
      private var var_912:ITextWindow;
      
      private var var_1575:IButtonWindow;
      
      private var var_1080:ITextWindow;
      
      private var var_2344:int;
      
      private var var_1336:IContainerButtonWindow;
      
      private var var_913:IWindowContainer;
      
      private var var_1335:ITextWindow;
      
      private var var_1333:IContainerButtonWindow;
      
      private var var_1579:ITextWindow;
      
      private var var_1577:IButtonWindow;
      
      private var var_907:TagRenderer;
      
      private var var_2186:ITextWindow;
      
      private var var_366:RoomEventViewCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_752:ITextWindow;
      
      private var var_286:RoomThumbnailCtrl;
      
      private var var_1330:IContainerButtonWindow;
      
      private var var_2189:IWindowContainer;
      
      private var var_287:IWindowContainer;
      
      public function RoomInfoViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_366 = new RoomEventViewCtrl(_navigator);
         var_207 = new RoomSettingsCtrl(_navigator,this,true);
         var_286 = new RoomThumbnailCtrl(_navigator);
         var_907 = new TagRenderer(_navigator);
         _navigator.roomSettingsCtrls.push(this.var_207);
         _hideInfoTimer = new Timer(6000,1);
         _hideInfoTimer.addEventListener(TimerEvent.TIMER,hideInfo);
      }
      
      public function backToRoomSettings() : void
      {
         this.var_207.active = true;
         this.var_366.active = false;
         this.var_286.active = false;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      private function refreshEventButtons(param1:RoomEventData) : void
      {
         if(false)
         {
            return;
         }
         var_1576.visible = param1 == null && _navigator.data.currentRoomOwner;
         var_1577.visible = param1 != null && (_navigator.data.currentRoomOwner || _navigator.data.eventMod);
         var_1578.visible = Util.hasVisibleChildren(var_1578);
      }
      
      private function refreshRoomDetails(param1:GuestRoomData, param2:Boolean) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_770.text = param1.roomName;
         var_770.height = NaN;
         _ownerName.text = param1.ownerName;
         var_911.text = param1.description;
         var_907.refreshTags(var_365,param1.tags);
         var_911.visible = false;
         if(param1.description != "")
         {
            var_911.height = NaN;
            var_911.visible = true;
         }
         var _loc3_:* = _navigator.data.currentRoomRating == -1;
         _navigator.refreshButton(var_365,"thumb_up",_loc3_,onThumbUp,0);
         _navigator.refreshButton(var_365,"thumb_down",_loc3_,onThumbDown,0);
         var_2188.visible = _loc3_;
         var_912.visible = !_loc3_;
         var_1579.visible = !_loc3_;
         var_1579.text = "" + _navigator.data.currentRoomRating;
         _navigator.refreshButton(var_365,"home",param2,null,0);
         _navigator.refreshButton(var_365,"favourite",!param2 && _navigator.data.isCurrentRoomFavourite(),null,0);
         Util.moveChildrenToColumn(var_365,["room_name","owner_name_cont","tags","room_desc","rating_cont"],var_770.y,0);
         var_365.visible = true;
         var_365.height = Util.method_1(var_365);
      }
      
      private function getButtonsMinHeight() : int
      {
         return !!_navigator.data.currentRoomOwner ? 0 : 21;
      }
      
      public function dispose() : void
      {
         if(_hideInfoTimer)
         {
            _hideInfoTimer.removeEventListener(TimerEvent.TIMER,hideInfo);
            _hideInfoTimer.reset();
            _hideInfoTimer = null;
         }
      }
      
      private function onThumbUp(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(1));
      }
      
      private function hideInfo(param1:Event) : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_362,HabboToolbarIconEnum.ROOMINFO,_window,false));
      }
      
      private function getRoomInfoMinHeight() : int
      {
         return 37;
      }
      
      public function onAddFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         if(_navigator.data.isFavouritesFull())
         {
            _loc3_ = new SimpleAlertView(_navigator,"${navigator.favouritesfull.title}","${navigator.favouritesfull.body}");
            _loc3_.show();
         }
         else
         {
            _navigator.send(new AddFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
         }
      }
      
      private function refreshRoomButtons(param1:Boolean) : void
      {
         if(_navigator.data.enteredGuestRoom == null || false || false)
         {
            return;
         }
         var_1575.visible = _navigator.data.canEditRoomSettings;
         var _loc2_:Boolean = _navigator.data.isCurrentRoomFavourite();
         var_1332.visible = _navigator.data.canAddFavourite && !_loc2_;
         var_1330.visible = _navigator.data.canAddFavourite && _loc2_;
         var_1336.visible = _navigator.data.canEditRoomSettings && !param1;
         var_1333.visible = _navigator.data.canEditRoomSettings && param1;
         var_1331.visible = Util.hasVisibleChildren(var_1331);
      }
      
      public function open(param1:Boolean) : void
      {
         this._hideInfoTimer.reset();
         this.var_366.active = false;
         this.var_207.active = false;
         this.var_286.active = false;
         if(param1)
         {
            this.startRoomSettingsEdit(_navigator.data.enteredGuestRoom.flatId);
         }
         refresh();
         _window.visible = true;
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,_window,false));
         _window.parent.activate();
         _window.activate();
         if(!param1)
         {
            this._hideInfoTimer.start();
         }
      }
      
      public function toggle() : void
      {
         this._hideInfoTimer.reset();
         this.var_366.active = false;
         this.var_207.active = false;
         this.var_286.active = false;
         refresh();
         if(true)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_49,HabboToolbarIconEnum.ROOMINFO,_window,false));
            _window.parent.activate();
         }
         else
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_362,HabboToolbarIconEnum.ROOMINFO,_window,false));
         }
      }
      
      private function refreshRoom() : void
      {
         Util.hideChildren(var_320);
         var_320.findChildByName("close").visible = true;
         var _loc1_:GuestRoomData = _navigator.data.enteredGuestRoom;
         var _loc2_:Boolean = _navigator.data.settings != null && _loc1_ != null && _loc1_.flatId == _navigator.data.settings.homeRoomId;
         refreshRoomDetails(_loc1_,_loc2_);
         refreshPublicSpaceDetails(_navigator.data.enteredPublicSpace);
         refreshRoomButtons(_loc2_);
         this.var_207.refresh(var_320);
         this.var_286.refresh(var_320);
         Util.moveChildrenToColumn(var_320,["room_details","room_buttons"],0,2);
         var_320.height = Util.method_1(var_320);
         var_320.visible = true;
         Logger.log("XORP: undefined, undefined, undefined, undefined, undefined");
      }
      
      private function onCloseButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         hideInfo(null);
      }
      
      private function onEmbedSrcClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var_1079.setSelection(0,var_1079.text.length);
      }
      
      private function getEmbedData() : String
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_navigator.data.enteredGuestRoom != null)
         {
            _loc1_ = "private";
            _loc2_ = "" + _navigator.data.enteredGuestRoom.flatId;
         }
         else
         {
            _loc1_ = "public";
            _loc2_ = "" + _navigator.data.publicSpaceNodeId;
            Logger.log("Node id is: " + _loc2_);
         }
         var _loc3_:String = _navigator.configuration.getKey("user.hash","");
         _navigator.registerParameter("navigator.embed.src","roomType",_loc1_);
         _navigator.registerParameter("navigator.embed.src","embedCode",_loc3_);
         _navigator.registerParameter("navigator.embed.src","roomId",_loc2_);
         return _navigator.getText("navigator.embed.src");
      }
      
      private function onThumbDown(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         _navigator.send(new RateFlatMessageComposer(-1));
      }
      
      private function refreshEvent() : void
      {
         Util.hideChildren(var_287);
         var _loc1_:RoomEventData = _navigator.data.roomEventData;
         refreshEventDetails(_loc1_);
         refreshEventButtons(_loc1_);
         this.var_366.refresh(var_287);
         if(Util.hasVisibleChildren(var_287) && !this.var_286.active)
         {
            Util.moveChildrenToColumn(var_287,["event_details","event_buttons"],0,2);
            var_287.height = Util.method_1(var_287);
            var_287.visible = true;
         }
         else
         {
            var_287.visible = false;
         }
         Logger.log("EVENT: undefined, undefined");
      }
      
      public function startEventEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_366.active = true;
         this.var_207.active = false;
         this.var_286.active = false;
         this.reload();
      }
      
      private function getEventInfoMinHeight() : int
      {
         return 18;
      }
      
      public function onRemoveFavouriteClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.enteredGuestRoom == null)
         {
            return;
         }
         _navigator.send(new DeleteFavouriteRoomMessageComposer(_navigator.data.enteredGuestRoom.flatId));
      }
      
      private function onHover(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            return;
         }
         _hideInfoTimer.reset();
      }
      
      private function refreshPublicSpaceDetails(param1:PublicRoomShortData) : void
      {
         if(param1 == null || false || false)
         {
            return;
         }
         var_1078.text = _navigator.getPublicSpaceName(param1.unitPropertySet,param1.worldId);
         var_1078.height = NaN;
         var_1334.text = _navigator.getPublicSpaceDesc(param1.unitPropertySet,param1.worldId);
         var_1334.height = NaN;
         Util.moveChildrenToColumn(var_753,["public_space_name","public_space_desc"],var_1078.y,0);
         var_753.visible = true;
         var_753.height = Math.max(86,Util.method_1(var_753));
      }
      
      public function reload() : void
      {
         if(_window != null && false)
         {
            refresh();
         }
      }
      
      private function find(param1:String) : IWindow
      {
         var _loc2_:IWindow = _window.findChildByName(param1);
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function refreshEmbed() : void
      {
         var _loc1_:* = _navigator.configuration.getKey("embed.showInRoomInfo","false") == "true";
         if(_loc1_ && true && true && true)
         {
            var_913.visible = true;
            var_1079.text = this.getEmbedData();
         }
         else
         {
            var_913.visible = false;
         }
      }
      
      public function startRoomSettingsEdit(param1:int) : void
      {
         this._hideInfoTimer.reset();
         this.var_207.load(param1);
         this.var_207.active = true;
         this.var_366.active = false;
         this.var_286.active = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_DEFAULT));
      }
      
      public function startThumbnailEdit() : void
      {
         this._hideInfoTimer.reset();
         this.var_207.active = false;
         this.var_366.active = false;
         this.var_286.active = true;
         this.reload();
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_THUMBS));
      }
      
      private function prepareWindow() : void
      {
         if(_window != null)
         {
            return;
         }
         _window = IWindowContainer(_navigator.getXmlWindow("iro_room_details"));
         _window.setParamFlag(HabboWindowParam.const_72,false);
         _window.setParamFlag(HabboWindowParam.const_1402,true);
         _window.visible = false;
         var_320 = IWindowContainer(find("room_info"));
         var_365 = IWindowContainer(find("room_details"));
         var_753 = IWindowContainer(find("public_space_details"));
         var_2189 = IWindowContainer(find("owner_name_cont"));
         var_2187 = IWindowContainer(find("rating_cont"));
         var_1331 = IWindowContainer(find("room_buttons"));
         var_770 = ITextWindow(find("room_name"));
         var_1078 = ITextWindow(find("public_space_name"));
         _ownerName = ITextWindow(find("owner_name"));
         var_911 = ITextWindow(find("room_desc"));
         var_1334 = ITextWindow(find("public_space_desc"));
         var_1080 = ITextWindow(find("owner_caption"));
         var_912 = ITextWindow(find("rating_caption"));
         var_2188 = ITextWindow(find("rate_caption"));
         var_1579 = ITextWindow(find("rating_txt"));
         var_287 = IWindowContainer(find("event_info"));
         var_910 = IWindowContainer(find("event_details"));
         var_1578 = IWindowContainer(find("event_buttons"));
         var_2186 = ITextWindow(find("event_name"));
         var_752 = ITextWindow(find("event_desc"));
         var_1332 = IContainerButtonWindow(find("add_favourite_button"));
         var_1330 = IContainerButtonWindow(find("rem_favourite_button"));
         var_1336 = IContainerButtonWindow(find("make_home_button"));
         var_1333 = IContainerButtonWindow(find("unmake_home_button"));
         var_1575 = IButtonWindow(find("room_settings_button"));
         var_1576 = IButtonWindow(find("create_event_button"));
         var_1577 = IButtonWindow(find("edit_event_button"));
         var_913 = IWindowContainer(find("embed_info"));
         var_1335 = ITextWindow(find("embed_info_txt"));
         var_1079 = ITextFieldWindow(find("embed_src_txt"));
         Util.setProcDirectly(var_1332,onAddFavouriteClick);
         Util.setProcDirectly(var_1330,onRemoveFavouriteClick);
         Util.setProcDirectly(var_1575,onRoomSettingsClick);
         Util.setProcDirectly(var_1336,onMakeHomeClick);
         Util.setProcDirectly(var_1333,onUnmakeHomeClick);
         Util.setProcDirectly(var_1576,onEventSettingsClick);
         Util.setProcDirectly(var_1577,onEventSettingsClick);
         Util.setProcDirectly(var_1079,onEmbedSrcClick);
         _navigator.refreshButton(var_1332,"favourite",true,null,0);
         _navigator.refreshButton(var_1330,"favourite",true,null,0);
         _navigator.refreshButton(var_1336,"home",true,null,0);
         _navigator.refreshButton(var_1333,"home",true,null,0);
         _window.findChildByName("close").procedure = onCloseButtonClick;
         Util.setProcDirectly(var_320,onHover);
         Util.setProcDirectly(var_287,onHover);
         var_1080.width = var_1080.textWidth;
         Util.moveChildrenToRow(var_2189,["owner_caption","owner_name"],var_1080.x,var_1080.y,3);
         var_912.width = var_912.textWidth;
         Util.moveChildrenToRow(var_2187,["rating_caption","rating_txt"],var_912.x,var_912.y,3);
         var_1335.height = NaN;
         Util.moveChildrenToColumn(var_913,["embed_info_txt","embed_src_txt"],var_1335.y,2);
         var_913.height = Util.method_1(var_913) + 5;
         var_2344 = NaN;
      }
      
      private function refreshEventDetails(param1:RoomEventData) : void
      {
         if(param1 == null || false)
         {
            return;
         }
         var_2186.text = param1.eventName;
         var_752.text = param1.eventDescription;
         var_907.refreshTags(var_910,[_navigator.getText("roomevent_type_" + param1.eventType),param1.tags[0],param1.tags[1]]);
         var_752.visible = false;
         if(param1.eventDescription != "")
         {
            var_752.height = NaN;
            var_752.y = Util.method_1(var_910) + 2;
            var_752.visible = true;
         }
         var_910.visible = true;
         var_910.height = Util.method_1(var_910);
      }
      
      private function refresh() : void
      {
         prepareWindow();
         refreshRoom();
         refreshEvent();
         refreshEmbed();
         Util.moveChildrenToColumn(this._window,["room_info","event_info","embed_info"],0,2);
         _window.height = Util.method_1(_window);
         _window.y = _window.desktop.height - 0 - 5;
         Logger.log("MAIN: undefined, undefined, undefined");
      }
      
      private function onRoomSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         startRoomSettingsEdit(_loc3_.flatId);
      }
      
      private function onUnmakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("CLEARING HOME ROOM:");
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(0));
      }
      
      private function onEventSettingsClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         if(_navigator.data.roomEventData == null)
         {
            if(_navigator.data.currentRoomOwner)
            {
               _navigator.send(new CanCreateEventMessageComposer());
            }
         }
         else
         {
            startEventEdit();
         }
      }
      
      public function roomSettingsRefreshNeeded() : void
      {
         refresh();
      }
      
      public function close() : void
      {
         _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_919,HabboToolbarIconEnum.ROOMINFO,_window,false));
         if(_window == null)
         {
            return;
         }
         this._window.visible = false;
         _navigator.events.dispatchEvent(new Event(HabboRoomSettingsTrackingEvent.HABBO_ROOM_SETTINGS_TRACKING_EVENT_CLOSED));
      }
      
      private function onMakeHomeClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         var _loc3_:GuestRoomData = _navigator.data.enteredGuestRoom;
         if(_loc3_ == null)
         {
            Logger.log("No entered room data?!");
            return;
         }
         Logger.log("SETTING HOME ROOM TO: " + _loc3_.flatId);
         _navigator.send(new UpdateNavigatorSettingsMessageComposer(_loc3_.flatId));
      }
   }
}
