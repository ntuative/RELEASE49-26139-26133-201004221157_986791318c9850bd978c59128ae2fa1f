package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_107:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1815:int;
      
      private var var_429:int;
      
      private var var_725:RoomData;
      
      private var var_1817:int;
      
      private var _ownerName:String;
      
      private var var_1816:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         var_429 = param1.readInteger();
         var_1815 = param1.readInteger();
         var_1816 = param1.readBoolean();
         var_1817 = param1.readInteger();
         _ownerName = param1.readString();
         var_107 = new RoomData(param1);
         var_725 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return var_1815;
      }
      
      public function get event() : RoomData
      {
         return var_725;
      }
      
      public function get room() : RoomData
      {
         return var_107;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(var_107 != null)
         {
            var_107.dispose();
            var_107 = null;
         }
         if(var_725 != null)
         {
            var_725.dispose();
            var_725 = null;
         }
      }
      
      public function get flatId() : int
      {
         return var_429;
      }
      
      public function get ownerId() : int
      {
         return var_1817;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return var_1816;
      }
   }
}
