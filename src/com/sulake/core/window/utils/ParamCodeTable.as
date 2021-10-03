package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_135;
         param1["bound_to_parent_rect"] = const_93;
         param1["child_window"] = const_842;
         param1["embedded_controller"] = const_330;
         param1["resize_to_accommodate_children"] = const_69;
         param1["input_event_processor"] = const_51;
         param1["internal_event_handling"] = const_584;
         param1["mouse_dragging_target"] = const_195;
         param1["mouse_dragging_trigger"] = const_340;
         param1["mouse_scaling_target"] = const_243;
         param1["mouse_scaling_trigger"] = const_453;
         param1["horizontal_mouse_scaling_trigger"] = const_221;
         param1["vertical_mouse_scaling_trigger"] = const_225;
         param1["observe_parent_input_events"] = const_857;
         param1["optimize_region_to_layout_size"] = const_471;
         param1["parent_window"] = const_933;
         param1["relative_horizontal_scale_center"] = const_182;
         param1["relative_horizontal_scale_fixed"] = const_124;
         param1["relative_horizontal_scale_move"] = const_344;
         param1["relative_horizontal_scale_strech"] = const_262;
         param1["relative_scale_center"] = const_957;
         param1["relative_scale_fixed"] = const_601;
         param1["relative_scale_move"] = const_961;
         param1["relative_scale_strech"] = const_823;
         param1["relative_vertical_scale_center"] = const_155;
         param1["relative_vertical_scale_fixed"] = const_132;
         param1["relative_vertical_scale_move"] = const_323;
         param1["relative_vertical_scale_strech"] = const_275;
         param1["on_resize_align_left"] = const_696;
         param1["on_resize_align_right"] = const_469;
         param1["on_resize_align_center"] = const_459;
         param1["on_resize_align_top"] = const_632;
         param1["on_resize_align_bottom"] = const_440;
         param1["on_resize_align_middle"] = const_479;
         param1["on_accommodate_align_left"] = const_837;
         param1["on_accommodate_align_right"] = const_463;
         param1["on_accommodate_align_center"] = const_619;
         param1["on_accommodate_align_top"] = const_889;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_508;
         param1["route_input_events_to_parent"] = const_366;
         param1["use_parent_graphic_context"] = const_35;
         param1["draggable_with_mouse"] = const_1005;
         param1["scalable_with_mouse"] = const_874;
         param1["reflect_horizontal_resize_to_parent"] = const_431;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_264;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
