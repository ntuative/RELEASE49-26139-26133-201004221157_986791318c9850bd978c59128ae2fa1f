package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1415:int = 10;
       
      
      private var var_1414:NavigatorSettingsMessageParser;
      
      private var var_1149:int;
      
      private var var_1700:int;
      
      private var var_1699:Boolean;
      
      private var var_968:Array;
      
      private var var_801:Dictionary;
      
      private var var_967:Array;
      
      private var var_2307:int;
      
      private var var_1703:int;
      
      private var var_1697:int;
      
      private var var_1702:int;
      
      private var var_563:PublicRoomShortData;
      
      private var var_391:RoomEventData;
      
      private var var_124:MsgWithRequestId;
      
      private var var_1701:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1698:Boolean;
      
      private var var_190:GuestRoomData;
      
      private var var_665:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_968 = new Array();
         var_967 = new Array();
         var_801 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_1700;
      }
      
      public function get eventMod() : Boolean
      {
         return var_1698;
      }
      
      public function startLoading() : void
      {
         this.var_665 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_1698 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_391 != null)
         {
            var_391.dispose();
         }
         var_391 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_124 != null && var_124 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_124 != null && var_124 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_124 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_190;
      }
      
      public function get allCategories() : Array
      {
         return var_968;
      }
      
      public function onRoomExit() : void
      {
         if(var_391 != null)
         {
            var_391.dispose();
            var_391 = null;
         }
         if(var_563 != null)
         {
            var_563.dispose();
            var_563 = null;
         }
         if(var_190 != null)
         {
            var_190.dispose();
            var_190 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_124 = param1;
         var_665 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1414;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_124 = param1;
         var_665 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_563 = null;
         var_190 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_563 = param1.publicSpace;
            var_391 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2307 = param1.limit;
         this.var_1149 = param1.favouriteRoomIds.length;
         this.var_801 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_801[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_124 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_563;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_1699;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_124 = param1;
         var_665 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1697 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_190 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_665;
      }
      
      public function get visibleCategories() : Array
      {
         return var_967;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_968 = param1;
         var_967 = new Array();
         for each(_loc2_ in var_968)
         {
            if(_loc2_.visible)
            {
               var_967.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_1703;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_1702;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1414 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_124 == null)
         {
            return;
         }
         var_124.dispose();
         var_124 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_391;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_801[param1] = !!param2 ? "yes" : null;
         var_1149 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_124 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1697;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_124 != null && var_124 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_1699 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_1703 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_1701 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_190 != null)
         {
            var_190.dispose();
         }
         var_190 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_190 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1414.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1149 >= var_2307;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_1702 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_1701;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_190 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_1700 = param1;
      }
   }
}
