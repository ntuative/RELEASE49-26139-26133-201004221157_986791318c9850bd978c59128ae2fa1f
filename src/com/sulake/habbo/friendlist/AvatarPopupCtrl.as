package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   
   public class AvatarPopupCtrl extends PopupCtrl
   {
       
      
      private var var_1257:String;
      
      private var var_1586:String;
      
      private var var_1256:String;
      
      private var var_2217:String;
      
      private var var_758:Boolean;
      
      private var var_2216:String;
      
      public function AvatarPopupCtrl(param1:HabboFriendList)
      {
         super(param1,5,-5,"avatar_popup");
      }
      
      public function setData(param1:Boolean, param2:String, param3:String, param4:String, param5:String, param6:String = "") : void
      {
         var_758 = param1;
         var_1586 = param2;
         var_2217 = param3;
         var_2216 = param4;
         var_1257 = param5;
         var_1256 = param6;
      }
      
      override public function refreshContent(param1:IWindowContainer) : void
      {
         Util.hideChildren(param1);
         if(var_1256 != "")
         {
            friendList.refreshText(param1,"name_text_online",var_758,var_1256);
         }
         else
         {
            friendList.refreshText(param1,"name_text_online",var_758,var_1586);
         }
         friendList.refreshText(param1,"name_text_offline",!var_758,var_1586);
         friendList.refreshText(param1,"motto_text",var_758,var_2217);
         friendList.refreshButton(param1,"offline",!var_758,null,0);
         if(var_758)
         {
            refreshFigure(param1,var_2216);
            param1.findChildByName("online_text").visible = true;
         }
         else
         {
            param1.findChildByName("last_access_text").visible = true;
            friendList.registerParameter("friendlist.avatarpopup.lastaccess","last_access",var_1257 == null ? "" : var_1257);
         }
         param1.height = Util.method_1(param1) + 10;
      }
      
      private function refreshFigure(param1:IWindowContainer, param2:String) : void
      {
         var _loc3_:IBitmapWrapperWindow = param1.getChildByName(HabboFriendList.const_179) as IBitmapWrapperWindow;
         if(param2 == null || param2 == "")
         {
            _loc3_.visible = false;
         }
         else
         {
            _loc3_.bitmap = friendList.getAvatarFaceBitmap(param2);
            _loc3_.width = _loc3_.bitmap.width;
            _loc3_.height = _loc3_.bitmap.height;
            _loc3_.visible = true;
         }
      }
   }
}
