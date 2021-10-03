package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1130:int = 80;
       
      
      private var var_540:Map;
      
      private var var_770:String = "";
      
      private var var_1376:Array;
      
      public function UserRegistry()
      {
         var_540 = new Map();
         var_1376 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_540.getValue(var_1376.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_770;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_540.getValue(param1) != null)
         {
            var_540.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_770);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_770 == "")
         {
            var_1376.push(param1);
         }
         var_540.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_540;
      }
      
      public function unregisterRoom() : void
      {
         var_770 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_540.length > const_1130)
         {
            _loc1_ = var_540.getKey(0);
            var_540.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_770 = param1;
         if(var_770 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
