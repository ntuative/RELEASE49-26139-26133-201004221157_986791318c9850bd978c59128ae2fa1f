package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLRequest;
   import flash.net.URLStream;
   
   public class ZipFileLoader extends AssetLoaderEventBroker implements IAssetLoader
   {
       
      
      protected var var_105:URLStream;
      
      protected var _type:String;
      
      protected var var_639:String;
      
      public function ZipFileLoader(param1:String, param2:URLRequest = null)
      {
         super();
         var_639 = param2 == null ? "" : param2.url;
         _type = param1;
         var_105 = new URLStream();
         var_105.addEventListener(Event.COMPLETE,loadEventHandler);
         var_105.addEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
         var_105.addEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
         var_105.addEventListener(Event.OPEN,loadEventHandler);
         var_105.addEventListener(ProgressEvent.PROGRESS,loadEventHandler);
         var_105.addEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
         if(param2 != null)
         {
            this.load(param2);
         }
      }
      
      public function get bytesTotal() : uint
      {
         return var_105.bytesAvailable;
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            super.dispose();
            var_105.removeEventListener(Event.COMPLETE,loadEventHandler);
            var_105.removeEventListener(HTTPStatusEvent.HTTP_STATUS,loadEventHandler);
            var_105.removeEventListener(IOErrorEvent.IO_ERROR,loadEventHandler);
            var_105.removeEventListener(Event.OPEN,loadEventHandler);
            var_105.removeEventListener(ProgressEvent.PROGRESS,loadEventHandler);
            var_105.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,loadEventHandler);
            var_105.close();
            var_105 = null;
            _type = null;
            var_639 = null;
         }
      }
      
      public function get ready() : Boolean
      {
         return bytesTotal > 0 ? bytesTotal == bytesLoaded : false;
      }
      
      public function load(param1:URLRequest) : void
      {
         var_639 = param1.url;
         var_105.load(param1);
      }
      
      public function get url() : String
      {
         return var_639;
      }
      
      public function get bytesLoaded() : uint
      {
         return var_105.bytesAvailable;
      }
      
      public function get mimeType() : String
      {
         return _type;
      }
      
      public function get content() : Object
      {
         return var_105;
      }
   }
}
