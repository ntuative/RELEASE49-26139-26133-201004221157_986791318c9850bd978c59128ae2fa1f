package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1815:int;
      
      private var var_2098:String;
      
      private var var_2096:int;
      
      private var var_2095:int;
      
      private var var_725:Boolean;
      
      private var var_1848:Boolean;
      
      private var var_429:int;
      
      private var var_1123:String;
      
      private var var_1847:int;
      
      private var var_1258:int;
      
      private var _ownerName:String;
      
      private var var_770:String;
      
      private var var_2094:int;
      
      private var var_2097:RoomThumbnailData;
      
      private var var_2093:Boolean;
      
      private var var_642:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_642 = new Array();
         super();
         var_429 = param1.readInteger();
         var_725 = param1.readBoolean();
         var_770 = param1.readString();
         _ownerName = param1.readString();
         var_1847 = param1.readInteger();
         var_1815 = param1.readInteger();
         var_2094 = param1.readInteger();
         var_1123 = param1.readString();
         var_2096 = param1.readInteger();
         var_2093 = param1.readBoolean();
         var_2095 = param1.readInteger();
         var_1258 = param1.readInteger();
         var_2098 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_642.push(_loc4_);
            _loc3_++;
         }
         var_2097 = new RoomThumbnailData(param1);
         var_1848 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2094;
      }
      
      public function get roomName() : String
      {
         return var_770;
      }
      
      public function get userCount() : int
      {
         return var_1815;
      }
      
      public function get score() : int
      {
         return var_2095;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2098;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_2093;
      }
      
      public function get tags() : Array
      {
         return var_642;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1848;
      }
      
      public function get event() : Boolean
      {
         return var_725;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_642 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1258;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2096;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2097;
      }
      
      public function get doorMode() : int
      {
         return var_1847;
      }
      
      public function get flatId() : int
      {
         return var_429;
      }
      
      public function get description() : String
      {
         return var_1123;
      }
   }
}
