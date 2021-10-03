package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_115:String = "RWPUE_VOTE_RESULT";
      
      public static const const_112:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1372:int;
      
      private var var_1094:String;
      
      private var var_654:Array;
      
      private var var_990:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_1094 = param2;
         var_990 = param3;
         var_654 = param4;
         if(var_654 == null)
         {
            var_654 = [];
         }
         var_1372 = param5;
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
