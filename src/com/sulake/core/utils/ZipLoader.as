package com.sulake.core.utils
{
   import com.sulake.core.Core;
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.HTTPStatusEvent;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_1139:uint = 0;
      
      private var var_1140:uint = 0;
      
      private var var_106:FZip;
      
      private var var_1141:Array;
      
      private var var_1654:uint = 0;
      
      private var var_795:int = 0;
      
      private var var_2377:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1141 = new Array();
      }
      
      override protected function removeEventListeners() : void
      {
         if(var_106)
         {
            var_106.removeEventListener(Event.COMPLETE,onComplete);
            var_106.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            var_106.removeEventListener(ProgressEvent.PROGRESS,onProgress);
            var_106.removeEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
         }
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         failure("IO Error, send or load operation failed for file \"undefined\": " + param1.text);
         if(!handleHttpStatus(var_214))
         {
            removeEventListeners();
         }
      }
      
      override public function get bytesLoaded() : uint
      {
         return var_1140;
      }
      
      override protected function loadEventHandler(param1:Event) : void
      {
      }
      
      override public function get bytesTotal() : uint
      {
         return var_1139;
      }
      
      public function get resources() : Array
      {
         return var_1141;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var loaderInfo:LoaderInfo = null;
         var name:String = null;
         var event:Event = param1;
         try
         {
            loaderInfo = event.target as LoaderInfo;
            name = getQualifiedClassName(var_15.content);
            var_1141.push(var_15.contentLoaderInfo.applicationDomain.getDefinition(name));
            ++var_795;
            if(var_1141.length == var_1654)
            {
               var_15.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
               var_15.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
               removeEventListeners();
               dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0,var_1139,var_1140));
            }
            else
            {
               var_15.loadBytes(var_106.getFileAt(var_795).content);
            }
         }
         catch(e:Error)
         {
            Core.crash("Crashed on ZipLoader.onLoaderComplete",Core.const_615,e);
         }
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         var_1139 = param1.bytesTotal;
         var_1140 = param1.bytesLoaded;
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0,var_1139,var_1140));
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_146 = param1;
         _name = parseNameFromUrl(var_146.url);
         var_291 = param3;
         if(var_106)
         {
            var_106.close();
         }
         ErrorReportStorage.addDebugData("Library name","Library name " + _name);
         var_106 = new FZip();
         var_106.addEventListener(Event.COMPLETE,onComplete);
         var_106.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_106.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_106.addEventListener(HTTPStatusEvent.HTTP_STATUS,onHTTPStatus);
         var_106.load(var_146);
      }
      
      override protected function handleHttpStatus(param1:int) : Boolean
      {
         if(param1 >= 400)
         {
            if(var_291 > 0)
            {
               if(var_106)
               {
                  var_106.close();
               }
               addRequestCounterToUrlRequest(var_146,const_1031 - var_291);
               var_106.load(var_146);
               --var_291;
               return true;
            }
            failure("HTTP Error " + param1 + " \"" + var_146.url + "\"");
            removeEventListeners();
         }
         return false;
      }
      
      private function onComplete(param1:Event) : void
      {
         var event:Event = param1;
         var_795 = 0;
         var_1654 = var_106.getFileCount();
         removeEventListeners();
         try
         {
            if(var_15)
            {
               var_15.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
               var_15.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
               var_15.loadBytes(var_106.getFileAt(var_795).content);
            }
         }
         catch(e:Error)
         {
            Core.crash("Crashed on ZipLoader.onComplete",Core.const_615,e);
         }
      }
      
      private function onHTTPStatus(param1:HTTPStatusEvent) : void
      {
         var_214 = param1.status;
         debug("Load event STATUS " + var_214 + " for file \"" + var_146.url + "\"");
      }
   }
}
