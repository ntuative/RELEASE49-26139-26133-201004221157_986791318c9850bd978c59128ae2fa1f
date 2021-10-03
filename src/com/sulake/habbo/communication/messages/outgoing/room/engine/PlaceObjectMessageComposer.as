package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_158:int;
      
      private var var_228:int = 0;
      
      private var _roomId:int;
      
      private var var_81:int = 0;
      
      private var _y:int = 0;
      
      private var var_1630:int;
      
      private var var_1645:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         var_158 = param1;
         var_1630 = param2;
         var_1645 = param3;
         var_81 = param4;
         _y = param5;
         var_228 = param6;
         _roomId = param7;
         _roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(var_1630)
         {
            case RoomObjectCategoryEnum.const_34:
               return [var_158 + " " + var_81 + " " + _y + " " + var_228];
            case RoomObjectCategoryEnum.const_32:
               return [var_158 + " " + var_1645];
            default:
               return [];
         }
      }
   }
}
