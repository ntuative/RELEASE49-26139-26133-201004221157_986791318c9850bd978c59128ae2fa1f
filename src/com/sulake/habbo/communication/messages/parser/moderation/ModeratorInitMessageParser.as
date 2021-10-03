package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_2182:Boolean;
      
      private var var_1573:Array;
      
      private var var_2184:Boolean;
      
      private var var_2178:Boolean;
      
      private var var_2181:Boolean;
      
      private var var_153:Array;
      
      private var var_2180:Boolean;
      
      private var var_2179:Boolean;
      
      private var var_1574:Array;
      
      private var var_2183:Boolean;
      
      private var var_2185:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_2185;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2182;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2184;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2180;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2179;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1573;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_153 = [];
         var_1573 = [];
         _roomMessageTemplates = [];
         var_1574 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_153.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1573.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1574.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2180 = param1.readBoolean();
         var_2181 = param1.readBoolean();
         var_2184 = param1.readBoolean();
         var_2178 = param1.readBoolean();
         var_2185 = param1.readBoolean();
         var_2179 = param1.readBoolean();
         var_2182 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_2183 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2178;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1574;
      }
      
      public function get issues() : Array
      {
         return var_153;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2183;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2181;
      }
   }
}
