package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_609:RoomObjectLocationCacheItem = null;
      
      private var var_169:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_609 = new RoomObjectLocationCacheItem(param1);
         var_169 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_609;
      }
      
      public function dispose() : void
      {
         if(var_609 != null)
         {
            var_609.dispose();
            var_609 = null;
         }
         if(var_169 != null)
         {
            var_169.dispose();
            var_169 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_169;
      }
   }
}
