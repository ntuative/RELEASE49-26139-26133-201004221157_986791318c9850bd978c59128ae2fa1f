package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_119:DisplayObject;
      
      private var var_2338:uint;
      
      private var var_896:IWindowToolTipAgentService;
      
      private var var_897:IWindowMouseScalingService;
      
      private var _windowContext:IWindowContext;
      
      private var var_895:IWindowFocusManagerService;
      
      private var var_898:IWindowMouseListenerService;
      
      private var var_894:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2338 = 0;
         var_119 = param2;
         _windowContext = param1;
         var_894 = new WindowMouseDragger(param2);
         var_897 = new WindowMouseScaler(param2);
         var_898 = new WindowMouseListener(param2);
         var_895 = new FocusManager(param2);
         var_896 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_897;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_895;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_896;
      }
      
      public function dispose() : void
      {
         if(var_894 != null)
         {
            var_894.dispose();
            var_894 = null;
         }
         if(var_897 != null)
         {
            var_897.dispose();
            var_897 = null;
         }
         if(var_898 != null)
         {
            var_898.dispose();
            var_898 = null;
         }
         if(var_895 != null)
         {
            var_895.dispose();
            var_895 = null;
         }
         if(var_896 != null)
         {
            var_896.dispose();
            var_896 = null;
         }
         _windowContext = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_898;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_894;
      }
   }
}
