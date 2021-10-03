package com.sulake.habbo.communication.messages.incoming.room.furniture
{
   public class RoomDimmerPresetsMessageData
   {
       
      
      private var _color:uint = 0;
      
      private var var_189:Boolean = false;
      
      private var var_1170:uint = 0;
      
      private var _type:int = 0;
      
      private var _id:int = 0;
      
      public function RoomDimmerPresetsMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_189)
         {
            _type = param1;
         }
      }
      
      public function set color(param1:uint) : void
      {
         if(!var_189)
         {
            _color = param1;
         }
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function set light(param1:int) : void
      {
         if(!var_189)
         {
            var_1170 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function setReadOnly() : void
      {
         var_189 = true;
      }
      
      public function get light() : int
      {
         return var_1170;
      }
   }
}
