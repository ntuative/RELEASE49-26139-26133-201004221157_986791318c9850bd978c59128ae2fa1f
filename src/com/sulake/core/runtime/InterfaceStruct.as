package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_393:uint;
      
      private var var_981:IUnknown;
      
      private var var_1169:String;
      
      private var var_980:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_980 = param1;
         var_1169 = getQualifiedClassName(var_980);
         var_981 = param2;
         var_393 = 0;
      }
      
      public function get iid() : IID
      {
         return var_980;
      }
      
      public function get disposed() : Boolean
      {
         return var_981 == null;
      }
      
      public function get references() : uint
      {
         return var_393;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_393) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_981;
      }
      
      public function get iis() : String
      {
         return var_1169;
      }
      
      public function reserve() : uint
      {
         return ++var_393;
      }
      
      public function dispose() : void
      {
         var_980 = null;
         var_1169 = null;
         var_981 = null;
         var_393 = 0;
      }
   }
}
