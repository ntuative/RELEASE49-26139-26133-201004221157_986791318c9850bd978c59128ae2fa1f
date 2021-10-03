package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1217:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_833:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1217 = param1;
         var_833 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_833;
      }
      
      public function get identifier() : IID
      {
         return var_1217;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1217 = null;
            while(false)
            {
               var_833.pop();
            }
            var_833 = null;
         }
      }
   }
}
