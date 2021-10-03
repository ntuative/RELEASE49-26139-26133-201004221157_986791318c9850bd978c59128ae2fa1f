package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1757:int;
      
      private var var_1756:int;
      
      private var var_2214:Boolean;
      
      private var var_2215:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_2213:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1756 = param1;
         var_1757 = param2;
         var_2215 = param3;
         var_2213 = param4;
         var_2214 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1756,var_1757,var_2215,var_2213,int(var_2214)];
      }
      
      public function dispose() : void
      {
      }
   }
}
