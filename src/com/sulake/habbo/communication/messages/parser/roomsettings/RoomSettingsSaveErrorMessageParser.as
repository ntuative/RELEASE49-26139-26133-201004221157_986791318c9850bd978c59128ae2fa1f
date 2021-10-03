package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1620:int = 9;
      
      public static const const_1537:int = 4;
      
      public static const const_1493:int = 1;
      
      public static const const_1308:int = 10;
      
      public static const const_1513:int = 2;
      
      public static const const_1139:int = 7;
      
      public static const const_1203:int = 11;
      
      public static const const_1527:int = 3;
      
      public static const const_1269:int = 8;
      
      public static const const_1229:int = 5;
      
      public static const const_1535:int = 6;
      
      public static const const_1171:int = 12;
       
      
      private var var_1861:String;
      
      private var _roomId:int;
      
      private var var_1197:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1861;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1197 = param1.readInteger();
         var_1861 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1197;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
