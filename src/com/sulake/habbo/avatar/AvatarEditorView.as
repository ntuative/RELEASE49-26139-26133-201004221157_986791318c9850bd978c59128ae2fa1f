package com.sulake.habbo.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IContainerButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITabSelectorWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.enum.AvatarEditorSideCategory;
   import com.sulake.habbo.avatar.events.AvatarEditorSavedEvent;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.catalog.enum.CatalogPageName;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class AvatarEditorView
   {
      
      public static var var_1610:IWindowContainer;
      
      public static var var_1383:IWindowContainer;
      
      public static var var_2275:int = 6710886;
       
      
      private var var_1425:Boolean = true;
      
      private var var_336:Timer;
      
      private var var_1424:ITabSelectorWindow;
      
      private var _window:IWindowContainer;
      
      private var var_477:IFrameWindow;
      
      private var _catalog:IHabboCatalog;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1737:Boolean = true;
      
      private var var_1423:String;
      
      private var var_256:String;
      
      private var var_48:HabboAvatarEditor;
      
      private var var_1695:Number = 0;
      
      public function AvatarEditorView(param1:HabboAvatarEditor, param2:IHabboWindowManager, param3:IHabboCatalog)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         super();
         var_48 = param1;
         _windowManager = param2;
         _catalog = param3;
         createWindow();
         if(var_1383 == null)
         {
            _loc4_ = var_48.assets.getAssetByName("AvatarEditorThumb") as XmlAsset;
            var_1383 = var_48.windowManager.buildFromXML(_loc4_.content as XML) as IWindowContainer;
         }
         if(var_1610 == null)
         {
            _loc5_ = var_48.assets.getAssetByName("color_chooser_cell") as XmlAsset;
            var_1610 = var_48.windowManager.buildFromXML(_loc5_.content as XML) as IWindowContainer;
         }
         var_336 = new Timer(1000);
         var_336.addEventListener(TimerEvent.TIMER,onUpdate);
      }
      
      public function hide() : void
      {
         _window.visible = false;
      }
      
      public function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1.type == WindowEvent.const_62)
         {
            _loc3_ = param2.name;
            Logger.log("Select tab: " + _loc3_);
            if(_loc3_ != var_256)
            {
               var_48.toggleAvatarEditorPage(_loc3_);
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "save":
                  if(var_48.hasInvalidClubItems())
                  {
                     displayStripClubDialog();
                     return;
                  }
                  _loc4_ = var_48.figureData.getFigureString();
                  if(false)
                  {
                     var_48.handler.saveCurrentSelection();
                  }
                  var_1695 = new Date().valueOf();
                  var_1425 = false;
                  var_336.start();
                  _window.findChildByName("save").disable();
                  var_48.events.dispatchEvent(new AvatarEditorSavedEvent(_loc4_));
                  var_48.close();
                  break;
               case "cancel":
                  var_48.close();
                  break;
               case "wardrobe":
                  toggleWardrobe();
            }
            if(param2.name == "header_button_close")
            {
               hide();
            }
         }
      }
      
      private function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1695 > 5000;
      }
      
      private function createWindow() : void
      {
         if(_window == null)
         {
            _window = _windowManager.buildFromXML((var_48.assets.getAssetByName("AvatarEditor") as XmlAsset).content as XML) as IWindowContainer;
         }
         _window.procedure = windowEventProc;
         var_1424 = _window.findChildByName("mainTabs") as ITabSelectorWindow;
         attachImages();
         update();
      }
      
      public function update() : void
      {
         var _loc1_:IWindowContainer = var_48.figureData.view.window;
         var _loc2_:IWindowContainer = _window.findChildByName("figureContainer") as IWindowContainer;
         if(_loc2_.numChildren > 0)
         {
            _loc2_.removeChildAt(0);
         }
         if(_loc2_ != null)
         {
            _loc2_.addChild(_loc1_);
         }
         var _loc3_:IContainerButtonWindow = _window.findChildByName("wardrobe") as IContainerButtonWindow;
         if(_loc3_)
         {
            _loc3_.visible = var_48.sessionData.hasUserRight("fuse_use_wardrobe");
         }
         var _loc4_:String = "null";
         if(var_48.sessionData.hasUserRight("fuse_use_wardrobe") && (var_1423 == AvatarEditorSideCategory.WARDROBE || var_1737))
         {
            _loc4_ = "null";
         }
         if(var_48.isClubTryoutAllowed() && true)
         {
            _loc4_ = "null";
         }
         setSideContent(_loc4_);
         setViewToCategory(var_256);
      }
      
      public function toggle() : void
      {
         _window.visible = true;
         if(false)
         {
            var_336.start();
         }
         else
         {
            var_336.stop();
         }
      }
      
      private function attachImages() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:Number = NaN;
         var _loc1_:* = ["generic","head","torso","legs","hotlooks","wardrobe"];
         for each(_loc2_ in _loc1_)
         {
            _loc3_ = _window.findChildByName(_loc2_) as IWindowContainer;
            _loc4_ = _loc3_.findChildByTag("BITMAP") as IBitmapWrapperWindow;
            if(_loc4_ != null)
            {
               _loc5_ = var_48.assets.getAssetByName("ae_tabs_" + _loc2_) as BitmapDataAsset;
               _loc6_ = (_loc5_.content as BitmapData).clone();
               _loc4_.bitmap = new BitmapData(_loc4_.width,_loc4_.height,true,16777215);
               _loc7_ = (_loc4_.width - _loc6_.width) / 2;
               _loc8_ = (_loc4_.height - _loc6_.height) / 2;
               _loc4_.bitmap.copyPixels(_loc6_,_loc6_.rect,new Point(_loc7_,_loc8_));
            }
         }
      }
      
      public function dispose() : void
      {
         if(var_336 != null)
         {
            var_336.stop();
            var_336.removeEventListener(TimerEvent.TIMER,onUpdate);
            var_336 = null;
         }
      }
      
      private function displayStripClubDialog() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!var_477)
         {
            _loc1_ = var_48.assets.getAssetByName("StripClubItemsInfo");
            if(!_loc1_)
            {
               throw new Error("Failed to initialize strip club info dialog; missing asset!");
            }
            _loc2_ = _loc1_.content as XML;
            var_477 = _windowManager.buildFromXML(_loc2_,2) as IFrameWindow;
            var_477.procedure = stripClubDialogEventProc;
            var_477.center();
         }
         else
         {
            var_477.visible = true;
            var_477.center();
         }
      }
      
      public function get window() : IWindowContainer
      {
         return _window;
      }
      
      private function setSideContent(param1:String) : void
      {
         var _loc2_:IWindowContainer = _window.findChildByName("sideContainer") as IWindowContainer;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:* = null;
         switch(param1)
         {
            case AvatarEditorSideCategory.const_588:
               break;
            case AvatarEditorSideCategory.const_457:
               _loc3_ = var_48.getSideContentWindowContainer(AvatarEditorSideCategory.const_457);
               break;
            case AvatarEditorSideCategory.WARDROBE:
               _loc3_ = var_48.getSideContentWindowContainer(AvatarEditorSideCategory.WARDROBE);
         }
         _loc2_.removeChildAt(0);
         _loc2_.invalidate();
         if(_loc3_)
         {
            _loc2_.addChild(_loc3_);
            _loc3_.visible = true;
            _loc2_.width = _loc3_.width;
         }
         else
         {
            _loc2_.width = 0;
         }
         var_1423 = param1;
      }
      
      private function stripClubDialogEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "header_button_close":
                  var_477.visible = false;
                  break;
               case "strip_button_ok":
                  if(var_48)
                  {
                     var_48.stripClubItems();
                  }
                  var_477.visible = false;
                  break;
               case "strip_button_club_info":
                  openCatalogClubPage();
                  var_477.visible = false;
            }
         }
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(canChangeOutfit())
         {
            var_1425 = canChangeOutfit();
            var_336.stop();
            if(_window)
            {
               _window.findChildByName("save").enable();
            }
         }
      }
      
      private function openCatalogClubPage() : void
      {
         if(_catalog)
         {
            _catalog.openCatalogPage(CatalogPageName.const_202,true);
         }
      }
      
      private function setViewToCategory(param1:String) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == "")
         {
            return;
         }
         var _loc2_:IWindowContainer = _window.findChildByName("contentArea") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:IWindowContainer = _loc2_.getChildAt(0) as IWindowContainer;
         _loc2_.removeChild(_loc3_);
         _loc2_.invalidate();
         var _loc4_:IWindowContainer = var_48.getCategoryWindowContainer(param1);
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.visible = true;
         _loc2_.addChild(_loc4_);
         var_256 = param1;
         var_1424.setSelected(var_1424.getSelectableByName(param1));
         _window.invalidate();
      }
      
      private function toggleWardrobe() : void
      {
         if(var_1423 == AvatarEditorSideCategory.WARDROBE)
         {
            var_1737 = false;
            setSideContent(AvatarEditorSideCategory.const_588);
         }
         else
         {
            setSideContent(AvatarEditorSideCategory.WARDROBE);
         }
      }
      
      public function toggleCategoryView(param1:String, param2:Boolean = false) : void
      {
         if(!param2)
         {
         }
         setViewToCategory(param1);
      }
      
      public function show() : void
      {
         _window.visible = true;
      }
   }
}
