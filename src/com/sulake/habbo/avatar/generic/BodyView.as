package com.sulake.habbo.avatar.generic
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.common.AvatarEditorGridView;
   import com.sulake.habbo.avatar.common.CategoryBaseView;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryModel;
   import com.sulake.habbo.avatar.common.IAvatarEditorCategoryView;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class BodyView extends CategoryBaseView implements IAvatarEditorCategoryView
   {
       
      
      private const const_499:String = "tab_girl";
      
      private const const_498:String = "tab_boy";
      
      public function BodyView(param1:IAvatarEditorCategoryModel, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super(param2,param3,param1);
         var_143 = FigureData.FACE;
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case const_498:
                  _model.controller.gender = FigureData.const_80;
                  param1.stopPropagation();
                  break;
               case const_499:
                  _model.controller.gender = FigureData.const_90;
                  param1.stopPropagation();
            }
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            switch(param2.name)
            {
               case const_498:
               case const_499:
                  activateTab(param2.name);
            }
         }
         else if(param1.type == WindowMouseEvent.const_33)
         {
            switch(param2.name)
            {
               case const_498:
               case const_499:
                  updateGenderTab();
            }
         }
      }
      
      override public function getWindowContainer() : IWindowContainer
      {
         if(!var_162)
         {
            init();
         }
         updateGenderTab();
         return _window;
      }
      
      public function updateGenderTab() : void
      {
         if(_model == null)
         {
            return;
         }
         switch(_model.controller.gender)
         {
            case FigureData.const_80:
               activateTab(const_498);
               inactivateTab(const_499);
               break;
            case FigureData.const_90:
               activateTab(const_499);
               inactivateTab(const_498);
         }
      }
      
      public function switchCategory(param1:String) : void
      {
         updateGenderTab();
      }
      
      override public function reset() : void
      {
         super.reset();
         var_143 = FigureData.FACE;
      }
      
      override public function init() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _loc1_ = _assetLibrary.getAssetByName("avatareditor_generic_base") as XmlAsset;
            if(_loc1_)
            {
               _window = IWindowContainer(_windowManager.buildFromXML(_loc1_.content as XML));
               _window.visible = false;
               _window.procedure = windowEventProc;
            }
         }
         if(!var_35)
         {
            var_35 = new Dictionary();
            var_35["null"] = new AvatarEditorGridView(_model,FigureData.FACE,_windowManager,_assetLibrary);
         }
         else
         {
            for each(_loc2_ in var_35)
            {
               _loc2_.initFromList();
            }
         }
         var_162 = true;
         updateGridView();
         attachImages();
         updateGenderTab();
      }
   }
}
