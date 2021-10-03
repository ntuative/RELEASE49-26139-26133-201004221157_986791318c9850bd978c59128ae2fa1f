package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_80:Number = 0;
      
      private var _data:String = "";
      
      private var var_1471:int = 0;
      
      private var var_32:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_1879:Boolean = false;
      
      private var var_2376:String = "";
      
      private var _id:int = 0;
      
      private var var_189:Boolean = false;
      
      private var var_228:String = "";
      
      private var var_1880:int = 0;
      
      private var var_1878:int = 0;
      
      private var var_1882:int = 0;
      
      private var var_1881:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_1879 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_189)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_1879;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_189)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_228;
      }
      
      public function get state() : int
      {
         return var_32;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_189)
         {
            var_1882 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_189)
         {
            var_1880 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_189)
         {
            var_1878 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_189)
         {
            var_228 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_189)
         {
            var_1881 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_189)
         {
            var_32 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1882;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_189)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_1880;
      }
      
      public function get wallY() : Number
      {
         return var_1878;
      }
      
      public function get localY() : Number
      {
         return var_1881;
      }
      
      public function setReadOnly() : void
      {
         var_189 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_80;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_189)
         {
            var_80 = param1;
         }
      }
   }
}
