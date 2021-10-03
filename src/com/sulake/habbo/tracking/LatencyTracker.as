package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_149:Array;
      
      private var var_32:Boolean = false;
      
      private var var_1415:int = 0;
      
      private var var_1416:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_476:Map;
      
      private var var_1720:int = 0;
      
      private var var_1418:int = 0;
      
      private var var_156:IHabboConfigurationManager;
      
      private var var_1153:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1417:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_32)
         {
            return;
         }
         if(getTimer() - var_1415 > var_1416)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1415 = getTimer();
         var_476.add(var_1153,var_1415);
         _connection.send(new LatencyPingRequestMessageComposer(var_1153));
         ++var_1153;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_156 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1416 = int(var_156.getKey("latencytest.interval"));
         var_1417 = int(var_156.getKey("latencytest.report.index"));
         var_1720 = int(var_156.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1416 < 1)
         {
            return;
         }
         var_476 = new Map();
         var_149 = new Array();
         var_32 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_476 == null || var_149 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_476.getValue(_loc2_.requestId);
         var_476.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_149.push(_loc4_);
         if(var_149.length == var_1417 && var_1417 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_149.length)
            {
               _loc5_ += var_149[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_149.length)
            {
               if(var_149[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_149[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_149 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1418) > var_1720 || var_1418 == 0)
            {
               var_1418 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_149.length);
               _connection.send(_loc11_);
            }
            var_149 = [];
         }
      }
      
      public function dispose() : void
      {
         var_32 = false;
         var_156 = null;
         _communication = null;
         _connection = null;
         if(var_476 != null)
         {
            var_476.dispose();
            var_476 = null;
         }
         var_149 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_156 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
