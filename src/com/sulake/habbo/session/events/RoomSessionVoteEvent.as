package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_115:String = "RSPE_VOTE_RESULT";
      
      public static const const_112:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1372:int = 0;
      
      private var var_1094:String = "";
      
      private var var_654:Array;
      
      private var var_990:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_990 = [];
         var_654 = [];
         super(param1,param2,param7,param8);
         var_1094 = param3;
         var_990 = param4;
         var_654 = param5;
         if(var_654 == null)
         {
            var_654 = [];
         }
         var_1372 = param6;
      }
      
      public function get votes() : Array
      {
         return var_654.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1372;
      }
      
      public function get question() : String
      {
         return var_1094;
      }
      
      public function get choices() : Array
      {
         return var_990.slice();
      }
   }
}
