package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_416:FloorRasterizer;
      
      private var var_905:Boolean = false;
      
      private var var_585:PlaneMaskManager;
      
      private var var_417:WallRasterizer;
      
      private var var_586:WallAdRasterizer;
      
      private var var_415:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_417 = new WallRasterizer();
         var_416 = new FloorRasterizer();
         var_586 = new WallAdRasterizer();
         var_415 = new LandscapeRasterizer();
         var_585 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_417;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_586;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_416;
      }
      
      public function get initialized() : Boolean
      {
         return var_905;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_585;
      }
      
      public function dispose() : void
      {
         if(var_417 != null)
         {
            var_417.dispose();
            var_417 = null;
         }
         if(var_416 != null)
         {
            var_416.dispose();
            var_416 = null;
         }
         if(var_586 != null)
         {
            var_586.dispose();
            var_586 = null;
         }
         if(var_415 != null)
         {
            var_415.dispose();
            var_415 = null;
         }
         if(var_585 != null)
         {
            var_585.dispose();
            var_585 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            var_417.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            var_416.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            var_586.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            var_415.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            var_585.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(var_417 != null)
         {
            var_417.clearCache();
         }
         if(var_416 != null)
         {
            var_416.clearCache();
         }
         if(var_415 != null)
         {
            var_415.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return var_415;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_905)
         {
            return;
         }
         var_417.initializeAssetCollection(param1);
         var_416.initializeAssetCollection(param1);
         var_586.initializeAssetCollection(param1);
         var_415.initializeAssetCollection(param1);
         var_585.initializeAssetCollection(param1);
         var_905 = true;
      }
   }
}
