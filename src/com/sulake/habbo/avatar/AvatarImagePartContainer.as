package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1887:int;
      
      private var var_1891:String;
      
      private var var_1433:IActionDefinition;
      
      private var var_1886:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1889:String;
      
      private var var_1885:String;
      
      private var var_1888:Boolean;
      
      private var var_1890:ColorTransform;
      
      private var var_1892:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1891 = param1;
         var_1889 = param2;
         var_1887 = param3;
         _color = param4;
         _frames = param5;
         var_1433 = param6;
         var_1888 = param7;
         var_1892 = param8;
         var_1885 = param9;
         var_1886 = param10;
         var_1890 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1888;
      }
      
      public function get partType() : String
      {
         return var_1889;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1892;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1886;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1887;
      }
      
      public function get flippedPartType() : String
      {
         return var_1885;
      }
      
      public function get bodyPartId() : String
      {
         return var_1891;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1433;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1890;
      }
   }
}
