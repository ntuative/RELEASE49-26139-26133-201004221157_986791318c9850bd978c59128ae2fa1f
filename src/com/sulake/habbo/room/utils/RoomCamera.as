package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_349:Number = 0.5;
      
      private static const const_780:int = 3;
      
      private static const const_1080:Number = 1;
       
      
      private var var_1997:Boolean = false;
      
      private var var_1991:Boolean = false;
      
      private var var_1035:int = 0;
      
      private var var_276:Vector3d = null;
      
      private var var_1995:int = 0;
      
      private var var_1990:int = 0;
      
      private var var_1994:Boolean = false;
      
      private var var_1988:int = -2;
      
      private var var_1993:Boolean = false;
      
      private var var_1996:int = 0;
      
      private var var_1989:int = -1;
      
      private var var_414:Vector3d = null;
      
      private var var_1992:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1995;
      }
      
      public function get targetId() : int
      {
         return var_1989;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1996 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1995 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1997 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1989 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1991 = param1;
      }
      
      public function dispose() : void
      {
         var_414 = null;
         var_276 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_414 == null)
         {
            var_414 = new Vector3d();
         }
         var_414.assign(param1);
         var_1035 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1988;
      }
      
      public function get screenHt() : int
      {
         return var_1992;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1990 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_276;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1992 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1996;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1997;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1991;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_414 != null && var_276 != null)
         {
            ++var_1035;
            _loc2_ = Vector3d.dif(var_414,var_276);
            if(_loc2_.length <= const_349)
            {
               var_276 = var_414;
               var_414 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_349 * (const_780 + 1))
               {
                  _loc2_.mul(const_349);
               }
               else if(var_1035 <= const_780)
               {
                  _loc2_.mul(const_349);
               }
               else
               {
                  _loc2_.mul(const_1080);
               }
               var_276 = Vector3d.sum(var_276,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1994 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1990;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1993 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1988 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_276 != null)
         {
            return;
         }
         var_276 = new Vector3d();
         var_276.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1994;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1993;
      }
   }
}
