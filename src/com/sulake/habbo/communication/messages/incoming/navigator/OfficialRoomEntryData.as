package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1274:int = 4;
      
      public static const const_698:int = 3;
      
      public static const const_514:int = 2;
      
      public static const const_939:int = 1;
       
      
      private var var_2087:String;
      
      private var _disposed:Boolean;
      
      private var var_1815:int;
      
      private var var_2088:Boolean;
      
      private var var_807:String;
      
      private var var_876:PublicRoomData;
      
      private var var_2086:int;
      
      private var _index:int;
      
      private var var_2085:String;
      
      private var _type:int;
      
      private var var_1744:String;
      
      private var var_877:GuestRoomData;
      
      private var var_2084:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2087 = param1.readString();
         var_2084 = param1.readString();
         var_2088 = param1.readInteger() == 1;
         var_2085 = param1.readString();
         var_807 = param1.readString();
         var_2086 = param1.readInteger();
         var_1815 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_939)
         {
            var_1744 = param1.readString();
         }
         else if(_type == const_698)
         {
            var_876 = new PublicRoomData(param1);
         }
         else if(_type == const_514)
         {
            var_877 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2086;
      }
      
      public function get popupCaption() : String
      {
         return var_2087;
      }
      
      public function get userCount() : int
      {
         return var_1815;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2088;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_939)
         {
            return 0;
         }
         if(this.type == const_514)
         {
            return this.var_877.maxUserCount;
         }
         if(this.type == const_698)
         {
            return this.var_876.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2084;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_877 != null)
         {
            this.var_877.dispose();
            this.var_877 = null;
         }
         if(this.var_876 != null)
         {
            this.var_876.dispose();
            this.var_876 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_877;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2085;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_876;
      }
      
      public function get picRef() : String
      {
         return var_807;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1744;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
