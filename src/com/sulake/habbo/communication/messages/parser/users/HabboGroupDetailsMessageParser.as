package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboGroupDetailsMessageParser implements IMessageParser
   {
       
      
      private var var_770:String = "";
      
      private var _name:String = "";
      
      private var _roomId:int = -1;
      
      private var var_986:int = -1;
      
      private var var_1123:String = "";
      
      public function HabboGroupDetailsMessageParser()
      {
         super();
      }
      
      public function get groupId() : int
      {
         return var_986;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_986 = param1.readInteger();
         if(var_986 != -1)
         {
            _name = param1.readString();
            var_1123 = param1.readString();
            _roomId = param1.readInteger();
            var_770 = param1.readString();
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_986 = -1;
         _name = "";
         var_1123 = "";
         _roomId = -1;
         var_770 = "";
         return true;
      }
      
      public function get roomName() : String
      {
         return var_770;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return var_1123;
      }
   }
}
