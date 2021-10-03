package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ObjectMessageData
   {
       
      
      private var var_1085:int = 0;
      
      private var _data:String = "";
      
      private var var_1471:int = -1;
      
      private var var_32:int = 0;
      
      private var _type:int = 0;
      
      private var var_1084:int = 0;
      
      private var var_2376:String = "";
      
      private var var_1644:int = 0;
      
      private var _id:int = 0;
      
      private var var_189:Boolean = false;
      
      private var var_228:int = 0;
      
      private var var_1643:String = null;
      
      private var var_81:Number = 0;
      
      private var _y:Number = 0;
      
      private var var_80:Number = 0;
      
      public function ObjectMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_189)
         {
            _type = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_189)
         {
            _y = param1;
         }
      }
      
      public function get dir() : int
      {
         return var_228;
      }
      
      public function get extra() : int
      {
         return var_1471;
      }
      
      public function get state() : int
      {
         return var_32;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_189)
         {
            var_228 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_189)
         {
            var_81 = param1;
         }
      }
      
      public function set extra(param1:int) : void
      {
         if(!var_189)
         {
            var_1471 = param1;
         }
      }
      
      public function get z() : Number
      {
         return var_80;
      }
      
      public function set state(param1:int) : void
      {
         if(!var_189)
         {
            var_32 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function get expiryTime() : int
      {
         return var_1644;
      }
      
      public function get staticClass() : String
      {
         return var_1643;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function set expiryTime(param1:int) : void
      {
         if(!var_189)
         {
            var_1644 = param1;
         }
      }
      
      public function set data(param1:String) : void
      {
         if(!var_189)
         {
            _data = param1;
         }
      }
      
      public function set staticClass(param1:String) : void
      {
         if(!var_189)
         {
            var_1643 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_189 = true;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!var_189)
         {
            var_1085 = param1;
         }
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!var_189)
         {
            var_1084 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_189)
         {
            var_80 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return var_1085;
      }
      
      public function get x() : Number
      {
         return var_81;
      }
      
      public function get sizeY() : int
      {
         return var_1084;
      }
   }
}
