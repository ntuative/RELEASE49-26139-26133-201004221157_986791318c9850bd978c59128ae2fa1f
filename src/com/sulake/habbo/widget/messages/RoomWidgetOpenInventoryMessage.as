package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_908:String = "inventory_badges";
      
      public static const const_1249:String = "inventory_clothes";
      
      public static const const_1392:String = "inventory_furniture";
      
      public static const const_705:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_999:String = "inventory_effects";
       
      
      private var var_1953:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_705);
         var_1953 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1953;
      }
   }
}
