package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1581:GarbageMonitor = null;
      
      private var var_1338:int = 0;
      
      private var var_1280:Boolean = false;
      
      private var var_2044:String = "";
      
      private var var_1580:String = "";
      
      private var var_367:Number = 0;
      
      private var var_1341:int = 10;
      
      private var var_2346:Array;
      
      private var var_647:int = 0;
      
      private var var_1339:int = 60;
      
      private var var_1081:int = 0;
      
      private var var_1082:int = 0;
      
      private var var_2050:String = "";
      
      private var var_2201:Number = 0;
      
      private var var_1340:int = 1000;
      
      private var var_2202:Boolean = true;
      
      private var var_2203:Number = 0.15;
      
      private var var_156:IHabboConfigurationManager = null;
      
      private var var_2049:String = "";
      
      private var var_1337:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         var_2346 = [];
         super();
         var_1580 = Capabilities.version;
         var_2044 = Capabilities.os;
         var_1280 = Capabilities.isDebugger;
         var_2049 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         var_1581 = new GarbageMonitor();
         updateGarbageMonitor();
         var_1338 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = var_1581.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            var_1581.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return var_367;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         var_1339 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return var_1580;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++var_1082;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > var_1340)
         {
            ++var_1081;
            _loc3_ = true;
         }
         else
         {
            ++var_647;
            if(var_647 <= 1)
            {
               var_367 = param1;
            }
            else
            {
               _loc4_ = Number(var_647);
               var_367 = var_367 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - var_1338 > var_1339 * 1000 && var_1337 < var_1341)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / var_367);
            _loc5_ = true;
            if(var_2202 && var_1337 > 0)
            {
               _loc6_ = differenceInPercents(var_2201,var_367);
               if(_loc6_ < var_2203)
               {
                  _loc5_ = false;
               }
            }
            var_1338 = getTimer();
            if(_loc5_ || _loc3_)
            {
               var_2201 = var_367;
               if(sendReport())
               {
                  ++var_1337;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         var_1341 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         var_1340 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(_connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,var_2049,var_1580,var_2044,var_2050,var_1280,_loc4_,_loc3_,var_1082,var_367,var_1081);
            _connection.send(_loc1_);
            var_1082 = 0;
            var_367 = 0;
            var_647 = 0;
            var_1081 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_156 = param1;
         var_1339 = int(var_156.getKey("performancetest.interval","60"));
         var_1340 = int(var_156.getKey("performancetest.slowupdatelimit","1000"));
         var_1341 = int(var_156.getKey("performancetest.reportlimit","10"));
         var_2203 = Number(var_156.getKey("performancetest.distribution.deviancelimit.percent","10"));
         var_2202 = Boolean(int(var_156.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
