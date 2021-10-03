package com.sulake.habbo.avatar.wardrobe
{
   import com.sulake.habbo.avatar.HabboAvatarEditor;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IOutfit;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import flash.display.BitmapData;
   
   public class Outfit implements IOutfit
   {
       
      
      private var var_577:String;
      
      private var var_314:String;
      
      private var _view:OutfitView;
      
      private var var_48:HabboAvatarEditor;
      
      public function Outfit(param1:HabboAvatarEditor, param2:String, param3:String)
      {
         super();
         var_48 = param1;
         _view = new OutfitView(param1.windowManager,param1.assets,param2 != "");
         switch(param3)
         {
            case FigureData.const_80:
            case "m":
            case "M":
               param3 = "null";
               break;
            case FigureData.const_90:
            case "f":
            case "F":
               param3 = "null";
         }
         var_314 = param2;
         var_577 = param3;
         update();
      }
      
      public function get gender() : String
      {
         return var_577;
      }
      
      public function get view() : OutfitView
      {
         return _view;
      }
      
      public function update() : void
      {
         var _loc2_:* = null;
         var _loc1_:IAvatarImage = var_48.avatarRenderManager.createAvatarImage(figure,AvatarScaleType.SMALL,var_577);
         if(_loc1_)
         {
            _loc1_.setDirection(AvatarSetType.const_41,int(FigureData.const_509));
            _loc2_ = _loc1_.getImage(AvatarSetType.const_41,true);
            if(_view)
            {
               _view.udpate(_loc2_);
            }
            _loc1_.dispose();
         }
      }
      
      public function get figure() : String
      {
         return var_314;
      }
      
      public function dispose() : void
      {
         if(_view)
         {
            _view.dispose();
            _view = null;
         }
         var_314 = null;
         var_577 = null;
      }
   }
}
