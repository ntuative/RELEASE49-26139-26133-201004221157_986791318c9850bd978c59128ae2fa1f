package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_851:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_851 = new Array();
         var_851.push(param1.length);
         var_851 = var_851.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_851;
      }
   }
}
