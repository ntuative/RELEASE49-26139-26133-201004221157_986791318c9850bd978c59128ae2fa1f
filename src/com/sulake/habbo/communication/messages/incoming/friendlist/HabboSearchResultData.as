package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2325:Boolean;
      
      private var var_2324:int;
      
      private var var_2322:Boolean;
      
      private var var_1586:String;
      
      private var var_1256:String;
      
      private var var_1697:int;
      
      private var var_2217:String;
      
      private var var_2323:String;
      
      private var var_2216:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1697 = param1.readInteger();
         this.var_1586 = param1.readString();
         this.var_2217 = param1.readString();
         this.var_2325 = param1.readBoolean();
         this.var_2322 = param1.readBoolean();
         param1.readString();
         this.var_2324 = param1.readInteger();
         this.var_2216 = param1.readString();
         this.var_2323 = param1.readString();
         this.var_1256 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1256;
      }
      
      public function get avatarName() : String
      {
         return this.var_1586;
      }
      
      public function get avatarId() : int
      {
         return this.var_1697;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2325;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2323;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2216;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2322;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2217;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2324;
      }
   }
}
