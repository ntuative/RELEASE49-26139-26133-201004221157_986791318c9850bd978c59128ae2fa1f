package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_1088:SoundChannel = null;
      
      private var var_919:Boolean;
      
      private var var_1087:Sound = null;
      
      private var var_690:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_1087 = param1;
         var_1087.addEventListener(Event.COMPLETE,onComplete);
         var_690 = 1;
         var_919 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_919;
      }
      
      public function stop() : Boolean
      {
         var_1088.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_919 = false;
         var_1088 = var_1087.play(0);
         this.volume = var_690;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_690;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_1088.position;
      }
      
      public function get length() : Number
      {
         return var_1087.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_690 = param1;
         if(var_1088 != null)
         {
            var_1088.soundTransform = new SoundTransform(var_690);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_919 = true;
      }
   }
}
