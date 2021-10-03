package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_314:String;
      
      private var var_1257:String;
      
      private var var_1255:String;
      
      private var var_1258:int;
      
      private var var_577:int;
      
      private var var_1256:String;
      
      private var _name:String;
      
      private var var_1155:Boolean;
      
      private var var_758:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_577 = param1.readInteger();
         this.var_758 = param1.readBoolean();
         this.var_1155 = param1.readBoolean();
         this.var_314 = param1.readString();
         this.var_1258 = param1.readInteger();
         this.var_1255 = param1.readString();
         this.var_1257 = param1.readString();
         this.var_1256 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_577;
      }
      
      public function get realName() : String
      {
         return var_1256;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1255;
      }
      
      public function get categoryId() : int
      {
         return var_1258;
      }
      
      public function get online() : Boolean
      {
         return var_758;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1155;
      }
      
      public function get lastAccess() : String
      {
         return var_1257;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_314;
      }
   }
}
