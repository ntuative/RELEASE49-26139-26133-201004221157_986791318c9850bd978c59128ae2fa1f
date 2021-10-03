package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.IProduct;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class SpacesCatalogWidget extends CatalogWidget implements ICatalogWidget, IGetImageListener
   {
      
      private static const const_191:String = "landscape";
      
      private static const const_192:String = "floor";
      
      private static const const_190:String = "wallpaper";
       
      
      private var var_1245:String = "default";
      
      private var var_1241:Array;
      
      private var var_266:BitmapData = null;
      
      private var var_231:int = 0;
      
      private var var_712:int = 0;
      
      private var var_1243:String = "1.1";
      
      private var var_1238:int = -1;
      
      private var var_1237:int = -1;
      
      private var var_842:Array;
      
      private var var_713:int = 0;
      
      private var var_268:BitmapData = null;
      
      private var var_305:int = 0;
      
      private var var_711:int = 0;
      
      private var var_306:int = 0;
      
      private var var_265:int = 0;
      
      private var var_843:Array;
      
      private var _floorType:String = "default";
      
      private var _activeFloorPatterns:Array;
      
      private var var_1239:Array;
      
      private var var_267:int = 0;
      
      private var var_156:XML;
      
      private var var_1240:Array;
      
      private var var_304:int = 0;
      
      public function SpacesCatalogWidget(param1:IWindowContainer)
      {
         var_1240 = [];
         var_843 = [];
         var_1241 = [];
         _activeFloorPatterns = [];
         var_1239 = [];
         var_842 = [];
         super(param1);
      }
      
      private function setRoomImage(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param1 != null && param2 != null && true)
         {
            _loc3_ = new Point(param1.width / 2 + 4 + 19,param1.height / 2 - param2.height / 2 - 24 + 10);
            _loc4_ = new BitmapData(param1.width,param1.height,param1.transparent);
            _loc4_.copyPixels(param1,param1.rect,new Point(0,0),null,null,true);
            _loc4_.copyPixels(param2,param2.rect,_loc3_,null,null,true);
            _loc5_ = window.getChildByName("catalog_floor_preview_example") as IBitmapWrapperWindow;
            if(_loc5_ != null)
            {
               if(_loc5_.bitmap == null)
               {
                  _loc5_.bitmap = new BitmapData(_loc5_.width,_loc5_.height,true,16777215);
               }
               _loc5_.bitmap.fillRect(_loc5_.bitmap.rect,16777215);
               _loc6_ = (_loc5_.width - _loc4_.width) / 2;
               _loc7_ = (_loc5_.height - _loc4_.height) / 2;
               _loc5_.bitmap.copyPixels(_loc4_,_loc4_.rect,new Point(_loc6_,_loc7_),null,null,true);
               _loc5_.invalidate();
            }
            _loc4_.dispose();
         }
      }
      
      private function changeColor(param1:String, param2:int) : void
      {
         switch(param1)
         {
            case const_190:
               var_231 += param2;
               if(var_231 < 0)
               {
                  if(var_711 > 0)
                  {
                     var_231 = var_711 - 1;
                  }
                  else
                  {
                     var_231 = 0;
                  }
               }
               if(var_231 >= var_711)
               {
                  var_231 = 0;
               }
               break;
            case const_192:
               var_265 += param2;
               if(var_265 < 0)
               {
                  if(var_713 > 0)
                  {
                     var_265 = var_713 - 1;
                  }
                  else
                  {
                     var_265 = 0;
                  }
               }
               if(var_265 >= var_713)
               {
                  var_265 = 0;
               }
               break;
            case const_191:
               var_267 += param2;
               if(var_267 < 0)
               {
                  if(var_712 > 0)
                  {
                     var_267 = var_712 - 1;
                  }
                  else
                  {
                     var_267 = 0;
                  }
               }
               if(var_267 >= var_712)
               {
                  var_267 = 0;
               }
         }
      }
      
      override public function init() : void
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         super.init();
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("configuration_catalog_spaces") as XmlAsset;
         if(_loc1_ != null)
         {
            var_156 = _loc1_.content as XML;
            for each(_loc2_ in page.offers)
            {
               _loc4_ = _loc2_.productContainer.firstProduct;
               _loc5_ = _loc2_.localizationId;
               _loc6_ = _loc5_.split(" ")[0];
               _loc7_ = _loc5_.split(" ")[1];
               _loc8_ = false;
               switch(_loc4_.furnitureData.name)
               {
                  case "floor":
                     for each(_loc9_ in var_156.floors.pattern)
                     {
                        _activeFloorPatterns.push(String(_loc9_.@id));
                        var_1241.push(_loc2_);
                     }
                     break;
                  case "wallpaper":
                     for each(_loc10_ in var_156.walls.pattern)
                     {
                        if(_loc10_.@id == _loc7_)
                        {
                           var_843.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        var_1240.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find wallpaper pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  case "landscape":
                     for each(_loc11_ in var_156.landscapes.pattern)
                     {
                        if(_loc11_.@id == _loc7_)
                        {
                           var_842.push(_loc7_);
                           _loc8_ = true;
                        }
                     }
                     if(_loc8_)
                     {
                        var_1239.push(_loc2_);
                     }
                     else
                     {
                        Logger.log("[SpacesCatalogWidget] Could not find landscape pattern configuration! " + [_loc2_.localizationId,_loc4_.furnitureData.name]);
                     }
                     break;
                  default:
                     Logger.log("[SpacesCatalogWidget] : " + _loc4_.furnitureData.name);
                     break;
               }
            }
            _loc3_ = 0;
            while(_loc3_ < _window.numChildren)
            {
               _loc12_ = _window.getChildAt(_loc3_);
               if(_loc12_ is IButtonWindow)
               {
                  _loc12_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onClick);
               }
               _loc3_++;
            }
            changePattern(const_190,0);
            changePattern(const_191,0);
            changePattern(const_192,0);
            updateConfiguration();
            retrieveSpacesPreview();
            return;
         }
      }
      
      override public function dispose() : void
      {
         if(var_266 != null)
         {
            var_266.dispose();
            var_266 = null;
         }
         if(var_268 != null)
         {
            var_268.dispose();
            var_268 = null;
         }
         super.dispose();
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         switch(param1)
         {
            case var_1237:
               var_1237 = 0;
               if(var_266 != null)
               {
                  var_266.dispose();
               }
               var_266 = param2;
               break;
            case var_1238:
               var_1238 = 0;
               if(var_268 != null)
               {
                  var_268.dispose();
               }
               var_268 = param2;
         }
         if(var_266 != null && var_268 != null)
         {
            setRoomImage(var_266,var_268);
         }
      }
      
      private function updateConfiguration() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc2_:String = "null";
         for each(_loc1_ in var_156.walls.pattern)
         {
            if(_loc1_.@id == _loc2_)
            {
               if(var_231 >= 0)
               {
                  _loc9_ = _loc1_.children()[var_231];
                  if(_loc9_ != null)
                  {
                     var_1245 = _loc9_.@id;
                  }
               }
            }
         }
         _loc3_ = var_1240[var_305];
         _loc4_ = (page.viewer.catalog as HabboCatalog).localization;
         if(_loc3_ != null)
         {
            _loc10_ = _window.findChildByName("ctlg_wall_price") as ITextWindow;
            if(_loc10_ != null)
            {
               _loc10_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc3_.priceInCredits));
            }
         }
         var _loc5_:String = "null";
         for each(_loc1_ in var_156.floors.pattern)
         {
            if(_loc1_.@id == _loc5_)
            {
               _loc11_ = _loc1_.children()[var_265];
               if(_loc11_ != null)
               {
                  _floorType = _loc11_.@id;
               }
            }
         }
         _loc6_ = var_1241[var_306];
         if(_loc6_ != null)
         {
            _loc12_ = _window.findChildByName("ctlg_floor_price") as ITextWindow;
            if(_loc12_ != null)
            {
               _loc12_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc6_.priceInCredits));
            }
         }
         var _loc7_:String = "null";
         for each(_loc1_ in var_156.landscapes.pattern)
         {
            if(_loc1_.@id == _loc7_)
            {
               _loc13_ = _loc1_.children()[var_267];
               if(_loc13_ != null)
               {
                  var_1243 = _loc13_.@id;
               }
            }
         }
         _loc8_ = var_1239[var_304];
         if(_loc8_ != null)
         {
            _loc14_ = _window.findChildByName("ctlg_landscape_price") as ITextWindow;
            if(_loc14_ != null)
            {
               _loc14_.caption = _loc4_.registerParameter("catalog.purchase.price.credits","credits",String(_loc8_.priceInCredits));
            }
         }
      }
      
      private function changePattern(param1:String, param2:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         switch(param1)
         {
            case const_190:
               var_305 += param2;
               if(var_305 < 0)
               {
                  var_305 = -1;
               }
               if(var_305 == var_843.length)
               {
                  var_305 = 0;
               }
               var_231 = 0;
               var_711 = 0;
               _loc5_ = "null";
               for each(_loc8_ in var_156.walls.pattern)
               {
                  if(_loc8_.@id == _loc5_)
                  {
                     var_711 = _loc8_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_wall_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_wall_color_next") as IButtonWindow;
               if(var_711 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_192:
               var_306 += param2;
               if(var_306 < 0)
               {
                  var_306 = -1;
               }
               if(var_306 >= _activeFloorPatterns.length)
               {
                  var_306 = 0;
               }
               var_265 = 0;
               var_713 = 0;
               _loc6_ = "null";
               for each(_loc9_ in var_156.floors.pattern)
               {
                  if(_loc9_.@id == _loc6_)
                  {
                     var_713 = _loc9_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_floor_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_floor_color_next") as IButtonWindow;
               if(var_713 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
               break;
            case const_191:
               var_304 += param2;
               if(var_304 < 0)
               {
                  var_304 = -1;
               }
               if(var_304 >= var_842.length)
               {
                  var_304 = 0;
               }
               var_267 = 0;
               var_712 = 0;
               _loc7_ = "null";
               for each(_loc10_ in var_156.landscapes.pattern)
               {
                  if(_loc10_.@id == _loc7_)
                  {
                     var_712 = _loc10_.children().length();
                  }
               }
               _loc4_ = _window.findChildByName("ctlg_landscape_color_prev") as IButtonWindow;
               _loc3_ = _window.findChildByName("ctlg_landscape_color_next") as IButtonWindow;
               if(var_712 < 2)
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.disable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.disable();
                  }
               }
               else
               {
                  if(_loc4_ != null)
                  {
                     _loc4_.enable();
                  }
                  if(_loc3_ != null)
                  {
                     _loc3_.enable();
                  }
               }
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:IWindow = param1.target as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         switch(_loc2_.name)
         {
            case "ctlg_wall_pattern_prev":
               changePattern(const_190,-1);
               break;
            case "ctlg_wall_pattern_next":
               changePattern(const_190,1);
               break;
            case "ctlg_wall_color_prev":
               changeColor(const_190,-1);
               break;
            case "ctlg_wall_color_next":
               changeColor(const_190,1);
               break;
            case "ctlg_buy_wall":
               _loc3_ = var_1240[var_305];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page,var_1245);
               }
               break;
            case "ctlg_floor_pattern_prev":
               changePattern(const_192,-1);
               break;
            case "ctlg_floor_pattern_next":
               changePattern(const_192,1);
               break;
            case "ctlg_floor_color_prev":
               changeColor(const_192,-1);
               break;
            case "ctlg_floor_color_next":
               changeColor(const_192,1);
               break;
            case "ctlg_buy_floor":
               _loc3_ = var_1241[var_306];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page,_floorType);
               }
               break;
            case "ctlg_landscape_pattern_next":
               changePattern(const_191,-1);
               break;
            case "ctlg_landscape_pattern_prev":
               changePattern(const_191,1);
               break;
            case "ctlg_landscape_color_prev":
               changeColor(const_191,-1);
               break;
            case "ctlg_landscape_color_next":
               changeColor(const_191,1);
               break;
            case "ctlg_buy_landscape":
               _loc3_ = var_1239[var_304];
               if(_loc3_ != null)
               {
                  (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(_loc3_,page,var_1243);
               }
               break;
            default:
               Logger.log("Spaces, unknown button: " + _loc2_.name);
         }
         updateConfiguration();
         retrieveSpacesPreview();
      }
      
      private function retrieveSpacesPreview() : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:ImageResult = page.viewer.roomEngine.getRoomImage(_floorType,var_1245,var_1243,64,this,"window_romantic_wide");
         var _loc3_:ImageResult = page.viewer.roomEngine.getGenericRoomObjectImage("window_romantic_wide","",new Vector3d(180,0,0),64,this,"window_romantic_wide");
         if(_loc2_ != null && _loc3_ != null)
         {
            var_1237 = _loc2_.id;
            var_1238 = _loc3_.id;
            _loc4_ = _loc2_.data as BitmapData;
            _loc5_ = _loc3_.data as BitmapData;
            if(var_266 != null)
            {
               var_266.dispose();
            }
            if(var_268 != null)
            {
               var_268.dispose();
            }
            var_266 = _loc4_;
            var_268 = _loc5_;
            setRoomImage(_loc4_,_loc5_);
         }
      }
   }
}
