package com.sulake.habbo.avatar.common
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IIconWindow;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.window.enum.HabboIconType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AvatarEditorGridColorItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var _model:IAvatarEditorCategoryModel;
      
      private var _window:IWindowContainer;
      
      private var var_747:IPartColor;
      
      private var var_906:BitmapData;
      
      private var var_748:BitmapData;
      
      private var var_674:BitmapData;
      
      public function AvatarEditorGridColorItem(param1:IWindowContainer, param2:IAvatarEditorCategoryModel, param3:IPartColor)
      {
         super();
         _model = param2;
         _window = param1;
         _window.background = true;
         var_747 = param3;
         var _loc4_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_1") as BitmapDataAsset;
         var_674 = _loc4_.content as BitmapData;
         var _loc5_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_2") as BitmapDataAsset;
         var_906 = _loc5_.content as BitmapData;
         var _loc6_:BitmapDataAsset = param2.controller.assets.getAssetByName("editor_clr_40x32_3") as BitmapDataAsset;
         var_748 = _loc6_.content as BitmapData;
         updateThumbData();
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      public function get partColor() : IPartColor
      {
         return var_747;
      }
      
      private function updateThumbData() : void
      {
         var _loc5_:* = null;
         if(_window == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = _window.findChildByTag("BG_BORDER") as IBitmapWrapperWindow;
         if(_loc1_ != null)
         {
            _loc1_.bitmap = new BitmapData(var_674.width,var_674.height,true,0);
            _loc1_.bitmap.copyPixels(var_674,var_674.rect,new Point(0,0));
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = new BitmapData(var_906.width,var_906.height,true,0);
            _loc5_ = var_906.clone();
            _loc5_.colorTransform(_loc5_.rect,var_747.colorTransform);
            _loc2_.bitmap.copyPixels(_loc5_,_loc5_.rect,new Point(0,0));
         }
         var _loc3_:IBitmapWrapperWindow = _window.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow;
         if(_loc3_ != null)
         {
            if(_isSelected)
            {
               _loc3_.bitmap = new BitmapData(var_748.width,var_748.height,true,16777215);
               _loc3_.bitmap.copyPixels(var_748,var_748.rect,new Point(0,0),null,null,true);
               _loc3_.visible = true;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         var _loc4_:IIconWindow = _window.findChildByTag("CLUB_ICON") as IIconWindow;
         if(_loc4_)
         {
            if(var_747)
            {
               switch(var_747.clubLevel)
               {
                  case HabboClubLevelEnum.const_53:
                     _loc4_.visible = false;
                     break;
                  case HabboClubLevelEnum.const_61:
                     _loc4_.style = HabboIconType.const_620;
                     _loc4_.visible = true;
                     break;
                  case HabboClubLevelEnum.const_54:
                     _loc4_.style = HabboIconType.const_740;
                     _loc4_.visible = true;
               }
            }
            else
            {
               _loc4_.visible = false;
            }
         }
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
         updateThumbData();
      }
      
      public function dispose() : void
      {
         _model = null;
         if(_window != null)
         {
            if(true)
            {
               _window.dispose();
            }
         }
         _window = null;
         var_747 = null;
         var_674 = null;
         var_906 = null;
         var_748 = null;
      }
   }
}
