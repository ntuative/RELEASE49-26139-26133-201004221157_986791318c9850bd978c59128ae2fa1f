package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_235:String = "RWUIUE_PEER";
      
      public static const const_206:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1162:String = "BOT";
      
      public static const const_916:int = 2;
      
      public static const const_1282:int = 0;
      
      public static const const_906:int = 3;
       
      
      private var var_314:String = "";
      
      private var var_1255:String = "";
      
      private var var_1939:Boolean = false;
      
      private var var_1688:int = 0;
      
      private var var_1936:int = 0;
      
      private var var_1937:Boolean = false;
      
      private var var_1256:String = "";
      
      private var var_1934:Boolean = false;
      
      private var var_930:int = 0;
      
      private var var_1933:Boolean = true;
      
      private var var_986:int = 0;
      
      private var var_1938:Boolean = false;
      
      private var var_1199:Boolean = false;
      
      private var var_1941:Boolean = false;
      
      private var var_1930:int = 0;
      
      private var var_1932:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_279:Array;
      
      private var var_1198:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1687:int = 0;
      
      private var var_1940:Boolean = false;
      
      private var var_1935:int = 0;
      
      private var var_1931:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_279 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1936;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1936 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1939;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1933;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1933 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1934 = param1;
      }
      
      public function get motto() : String
      {
         return var_1255;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1938 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1199;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1255 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1940;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1931;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1199 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1932;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1930 = param1;
      }
      
      public function get badges() : Array
      {
         return var_279;
      }
      
      public function get amIController() : Boolean
      {
         return var_1937;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1937 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1940 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1935 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1931 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1256 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1934;
      }
      
      public function set figure(param1:String) : void
      {
         var_314 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_1930;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1198;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1938;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_930 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1935;
      }
      
      public function get realName() : String
      {
         return var_1256;
      }
      
      public function get figure() : String
      {
         return var_314;
      }
      
      public function set webID(param1:int) : void
      {
         var_1687 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_279 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1941 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1932 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_930;
      }
      
      public function get webID() : int
      {
         return var_1687;
      }
      
      public function set groupId(param1:int) : void
      {
         var_986 = param1;
      }
      
      public function get xp() : int
      {
         return var_1688;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1939 = param1;
      }
      
      public function get groupId() : int
      {
         return var_986;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1941;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1198 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_1688 = param1;
      }
   }
}
