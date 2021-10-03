package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_152:int = 1;
      
      public static const const_1302:int = 3;
      
      public static const const_380:int = 2;
       
      
      private var var_1871:int;
      
      private var var_1868:int;
      
      private var var_1863:int;
      
      private var var_1843:int;
      
      private var var_32:int;
      
      private var var_429:int;
      
      private var var_1235:int;
      
      private var var_1869:int;
      
      private var var_989:int;
      
      private var _roomResources:String;
      
      private var var_1860:int;
      
      private var var_1864:int;
      
      private var var_1865:String;
      
      private var var_1870:String;
      
      private var var_1867:int = 0;
      
      private var var_1183:String;
      
      private var _message:String;
      
      private var var_1792:int;
      
      private var var_1862:String;
      
      private var var_1258:int;
      
      private var var_770:String;
      
      private var var_1866:String;
      
      private var var_1455:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_989 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1867 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1864;
      }
      
      public function set roomName(param1:String) : void
      {
         var_770 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1860 = param1;
      }
      
      public function get state() : int
      {
         return var_32;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_770;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1843 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_32 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1868;
      }
      
      public function get priority() : int
      {
         return var_1871 + var_1867;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1869 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1870;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1455) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1258;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1864 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1235;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1865 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1860;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1843;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1866 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1183 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1869;
      }
      
      public function set priority(param1:int) : void
      {
         var_1871 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1868 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1865;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1863 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1870 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1792 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1183;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1235 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1863;
      }
      
      public function set flatId(param1:int) : void
      {
         var_429 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1258 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1455 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1792;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1862 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1455;
      }
      
      public function get reportedUserId() : int
      {
         return var_989;
      }
      
      public function get flatId() : int
      {
         return var_429;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1866;
      }
      
      public function get reporterUserName() : String
      {
         return var_1862;
      }
   }
}
