package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_927:String = "AssetLoaderEventUnload";
      
      public static const const_47:String = "AssetLoaderEventError";
      
      public static const const_1007:String = "AssetLoaderEventOpen";
      
      public static const const_968:String = "AssetLoaderEventProgress";
      
      public static const const_831:String = "AssetLoaderEventStatus";
      
      public static const const_37:String = "AssetLoaderEventComplete";
       
      
      private var var_214:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_214 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_214;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_214);
      }
   }
}
