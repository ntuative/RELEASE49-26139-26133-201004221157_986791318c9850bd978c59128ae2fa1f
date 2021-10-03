package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_646;
         param1["bitmap"] = const_565;
         param1["border"] = const_622;
         param1["border_notify"] = const_1160;
         param1["button"] = const_360;
         param1["button_thick"] = const_729;
         param1["button_icon"] = const_1195;
         param1["button_group_left"] = const_710;
         param1["button_group_center"] = const_542;
         param1["button_group_right"] = const_589;
         param1["canvas"] = const_711;
         param1["checkbox"] = const_527;
         param1["closebutton"] = const_970;
         param1["container"] = const_339;
         param1["container_button"] = const_719;
         param1["display_object_wrapper"] = const_609;
         param1["dropmenu"] = const_364;
         param1["dropmenu_item"] = const_449;
         param1["frame"] = const_303;
         param1["frame_notify"] = const_1234;
         param1["header"] = const_694;
         param1["icon"] = const_828;
         param1["itemgrid"] = const_974;
         param1["itemgrid_horizontal"] = const_480;
         param1["itemgrid_vertical"] = const_744;
         param1["itemlist"] = const_856;
         param1["itemlist_horizontal"] = const_296;
         param1["itemlist_vertical"] = const_294;
         param1["maximizebox"] = const_1343;
         param1["menu"] = const_1298;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_969;
         param1["minimizebox"] = const_1165;
         param1["notify"] = const_1377;
         param1["null"] = const_510;
         param1["password"] = const_531;
         param1["radiobutton"] = const_629;
         param1["region"] = const_412;
         param1["restorebox"] = const_1214;
         param1["scaler"] = const_678;
         param1["scaler_horizontal"] = const_1322;
         param1["scaler_vertical"] = const_1341;
         param1["scrollbar_horizontal"] = const_387;
         param1["scrollbar_vertical"] = const_539;
         param1["scrollbar_slider_button_up"] = const_864;
         param1["scrollbar_slider_button_down"] = const_862;
         param1["scrollbar_slider_button_left"] = const_955;
         param1["scrollbar_slider_button_right"] = const_950;
         param1["scrollbar_slider_bar_horizontal"] = const_966;
         param1["scrollbar_slider_bar_vertical"] = const_878;
         param1["scrollbar_slider_track_horizontal"] = const_841;
         param1["scrollbar_slider_track_vertical"] = const_930;
         param1["scrollable_itemlist"] = const_1185;
         param1["scrollable_itemlist_vertical"] = const_402;
         param1["scrollable_itemlist_horizontal"] = const_956;
         param1["selector"] = const_688;
         param1["selector_list"] = const_582;
         param1["submenu"] = const_969;
         param1["tab_button"] = const_595;
         param1["tab_container_button"] = const_843;
         param1["tab_context"] = const_407;
         param1["tab_content"] = const_962;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_530;
         param1["input"] = const_540;
         param1["toolbar"] = const_1323;
         param1["tooltip"] = const_335;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
