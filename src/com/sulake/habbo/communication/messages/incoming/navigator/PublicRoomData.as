package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1868:int;
      
      private var var_2154:String;
      
      private var var_1843:int;
      
      private var _disposed:Boolean;
      
      private var var_2155:int;
      
      private var var_1842:String;
      
      private var var_1327:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1842 = param1.readString();
         var_1868 = param1.readInteger();
         var_1843 = param1.readInteger();
         var_2154 = param1.readString();
         var_2155 = param1.readInteger();
         var_1327 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_2155;
      }
      
      public function get worldId() : int
      {
         return var_1843;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1842;
      }
      
      public function get unitPort() : int
      {
         return var_1868;
      }
      
      public function get castLibs() : String
      {
         return var_2154;
      }
      
      public function get nodeId() : int
      {
         return var_1327;
      }
   }
}
