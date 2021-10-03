package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_2267:Date;
      
      private var var_1378:Boolean = false;
      
      private var _type:int;
      
      private var var_379:BitmapData;
      
      private var var_252:Boolean = false;
      
      private var var_1167:int;
      
      private var var_637:int = 1;
      
      private var var_1106:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_379;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_637;
         if(var_637 < 0)
         {
            var_637 = 0;
         }
         var_1106 = var_1167;
         var_252 = false;
         var_1378 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_1106 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_252;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_379 = param1;
      }
      
      public function get duration() : int
      {
         return var_1167;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1378;
      }
      
      public function get effectsInInventory() : int
      {
         return var_637;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_379;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_252)
         {
            var_2267 = new Date();
         }
         var_252 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_637 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_252)
         {
            _loc1_ = var_1106 - (new Date().valueOf() - var_2267.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_1106;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1378 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1167 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
