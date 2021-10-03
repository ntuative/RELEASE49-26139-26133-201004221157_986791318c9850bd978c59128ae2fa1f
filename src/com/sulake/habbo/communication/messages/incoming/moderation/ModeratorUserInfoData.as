package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2264:int;
      
      private var var_2261:int;
      
      private var var_2263:int;
      
      private var _userName:String;
      
      private var var_2262:int;
      
      private var var_2265:int;
      
      private var var_2260:int;
      
      private var _userId:int;
      
      private var var_758:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2265 = param1.readInteger();
         var_2262 = param1.readInteger();
         var_758 = param1.readBoolean();
         var_2263 = param1.readInteger();
         var_2261 = param1.readInteger();
         var_2264 = param1.readInteger();
         var_2260 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2260;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_758;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2262;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2261;
      }
      
      public function get cautionCount() : int
      {
         return var_2264;
      }
      
      public function get cfhCount() : int
      {
         return var_2263;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2265;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
