package com.sulake.habbo.help.hotelmerge
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.avatar.ChangeUserNameResultMessageEvent;
   import com.sulake.habbo.help.tutorial.NameSuggestionListRenderer;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   
   public class HotelMergeNameChangeView
   {
      
      private static var var_1542:uint = 13232628;
      
      private static var var_2113:uint = 11129827;
       
      
      private var var_1347:String;
      
      private var var_918:Boolean = false;
      
      private var var_623:IWindowContainer;
      
      private var var_881:NameSuggestionListRenderer;
      
      private var _window:IFrameWindow;
      
      private var var_282:IWindowContainer;
      
      private var var_368:String;
      
      private var var_1346:IWindowContainer;
      
      private var var_48:HotelMergeUI;
      
      private var var_37:IWindowContainer;
      
      public function HotelMergeNameChangeView(param1:HotelMergeUI)
      {
         super();
         var_48 = param1;
      }
      
      public function setNameAvailableView() : void
      {
         if(_window == null)
         {
            return;
         }
         nameCheckWaitEnd(true);
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         var_48.localization.registerParameter("help.tutorial.name.available","name",var_368);
         _loc1_.text = var_48.localization.getKey("help.tutorial.name.available");
         var _loc2_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.text = var_368;
         var _loc3_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.visible = false;
      }
      
      private function showView(param1:IWindowContainer) : void
      {
         var_918 = false;
         if(var_37)
         {
            var_37.visible = false;
         }
         var_37 = param1;
         var_37.visible = true;
         if(_window)
         {
            _window.content.width = var_37.width;
            _window.content.height = var_37.height;
         }
      }
      
      private function getName() : String
      {
         var _loc1_:* = null;
         if(_window)
         {
            _loc1_ = _window.findChildByName("input") as ITextFieldWindow;
            if(_loc1_)
            {
               return _loc1_.text;
            }
         }
         return null;
      }
      
      private function nameOut(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_1542;
         }
      }
      
      private function createWindow(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = var_48.assets.getAssetByName(param1) as XmlAsset;
         if(!_loc2_)
         {
            return null;
         }
         return var_48.windowManager.buildFromXML(_loc2_.content as XML);
      }
      
      private function nameSelected(param1:WindowMouseEvent) : void
      {
         nameCheckWaitEnd(true);
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(!_loc2_)
         {
            return;
         }
         var _loc3_:String = _loc2_.text;
         setNormalView();
         var _loc4_:ITextFieldWindow = _window.findChildByName("input") as ITextFieldWindow;
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.text = _loc3_;
      }
      
      private function nameOver(param1:WindowMouseEvent) : void
      {
         var _loc2_:ITextWindow = param1.target as ITextWindow;
         if(_loc2_ != null)
         {
            _loc2_.color = var_2113;
         }
      }
      
      private function showSelectionView() : void
      {
         if(!var_623)
         {
            var_623 = createWindow("hotel_merge_name_selection_xml") as IWindowContainer;
            if(!var_623)
            {
               return;
            }
            _window.content.addChild(var_623);
         }
         _window.caption = var_48.localization.getKey("hotel_merge.name_change.title.select");
         var _loc1_:IButtonWindow = _window.findChildByName("select_name_button") as IButtonWindow;
         if(_loc1_)
         {
            _loc1_.disable();
         }
         setNormalView();
         showView(var_623);
      }
      
      private function showConfirmationView() : void
      {
         if(!var_282)
         {
            var_282 = createWindow("hotel_merge_name_confirmation_xml") as IWindowContainer;
            if(!var_282)
            {
               return;
            }
            _window.content.addChild(var_282);
         }
         _window.caption = var_48.localization.getKey("hotel_merge.name_change.title.confirm");
         var _loc1_:ITextWindow = var_282.findChildByName("final_name") as ITextWindow;
         if(_loc1_)
         {
            _loc1_.text = var_368;
         }
         showView(var_282);
      }
      
      public function get id() : String
      {
         return TutorialUI.const_216;
      }
      
      public function dispose() : void
      {
         disposeWindow();
         if(var_881 != null)
         {
            var_881.dispose();
            var_881 = null;
         }
      }
      
      private function windowEventHandler(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(!var_918)
         {
            if(param1.type == WindowEvent.const_125)
            {
               if(param2.name == "input")
               {
                  _loc3_ = _window.findChildByName("select_name_button");
                  _loc4_ = param2 as ITextFieldWindow;
                  if(_loc3_ && _loc4_)
                  {
                     if(_loc4_.text.length > 2)
                     {
                        _loc3_.enable();
                     }
                     else
                     {
                        _loc3_.disable();
                     }
                  }
               }
            }
         }
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         switch(param2.name)
         {
            case "change_name_button":
               showSelectionView();
               break;
            case "keep_name_button":
               var_368 = var_48.myName;
               showConfirmationView();
               break;
            case "check_name_button":
               var_48.checkName(getName());
               nameCheckWaitBegin();
               break;
            case "select_name_button":
               _loc5_ = getName();
               if(_loc5_.length < 1)
               {
                  return;
               }
               if(var_368 != _loc5_)
               {
                  var_1347 = _loc5_;
                  var_48.checkName(_loc5_);
                  nameCheckWaitBegin();
               }
               else
               {
                  showConfirmationView();
               }
               break;
            case "cancel_selection_button":
               nameCheckWaitEnd(true);
               showMainView();
               break;
            case "confirm_name_button":
               var_48.changeName(var_368);
               break;
            case "cancel_confirmation_button":
               nameCheckWaitEnd(true);
               showMainView();
               break;
            case "header_button_close":
               disposeWindow();
         }
      }
      
      public function showMainView() : void
      {
         if(!_window)
         {
            _window = createWindow("hotel_merge_name_change_xml") as IFrameWindow;
            _window.center();
            _window.procedure = windowEventHandler;
            var_1346 = _window.content.getChildAt(0) as IWindowContainer;
         }
         var_48.localization.registerParameter("hotel_merge.name_change.current","name",var_48.myName);
         _window.caption = var_48.localization.getKey("hotel_merge.name_change.title.main");
         showView(var_1346);
      }
      
      public function setNameNotAvailableView(param1:int, param2:String, param3:Array) : void
      {
         var _loc8_:* = null;
         nameCheckWaitEnd(false);
         if(var_37 != var_623)
         {
            showSelectionView();
         }
         var_1347 = null;
         var_368 = null;
         if(_window == null)
         {
            return;
         }
         var _loc4_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc4_ == null)
         {
            return;
         }
         switch(param1)
         {
            case ChangeUserNameResultMessageEvent.var_947:
               var_48.localization.registerParameter("help.tutorial.name.taken","name",param2);
               _loc4_.text = var_48.localization.getKey("help.tutorial.name.taken");
               break;
            case ChangeUserNameResultMessageEvent.var_945:
               var_48.localization.registerParameter("help.tutorial.name.invalid","name",param2);
               _loc4_.text = var_48.localization.getKey("help.tutorial.name.invalid");
               break;
            case ChangeUserNameResultMessageEvent.var_943:
               break;
            case ChangeUserNameResultMessageEvent.var_944:
               _loc4_.text = var_48.localization.getKey("help.tutorial.name.long");
               break;
            case ChangeUserNameResultMessageEvent.var_946:
               _loc4_.text = var_48.localization.getKey("help.tutorial.name.short");
               break;
            case ChangeUserNameResultMessageEvent.var_1110:
               _loc4_.text = var_48.localization.getKey("help.tutorial.name.change_not_allowed");
               break;
            case ChangeUserNameResultMessageEvent.var_1109:
               _loc4_.text = var_48.localization.getKey("help.tutorial.name.merge_hotel_down");
         }
         var _loc5_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == ChangeUserNameResultMessageEvent.var_1109 || param1 == ChangeUserNameResultMessageEvent.var_1110)
         {
            _loc5_.visible = false;
            return;
         }
         _loc5_.visible = true;
         var_881 = new NameSuggestionListRenderer(var_48);
         var _loc6_:int = var_881.render(param3,_loc5_);
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_.numChildren)
         {
            _loc8_ = _loc5_.getChildAt(_loc7_);
            _loc8_.color = var_1542;
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,nameSelected);
            _loc8_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,nameOver);
            _loc8_.addEventListener(WindowMouseEvent.const_33,nameOut);
            _loc7_++;
         }
      }
      
      public function nameCheckWaitEnd(param1:Boolean) : void
      {
         var _loc2_:* = null;
         if(_window && true)
         {
            if(param1)
            {
               _loc2_ = _window.findChildByName("select_name_button");
               if(_loc2_)
               {
                  _loc2_.enable();
               }
            }
            _loc2_ = _window.findChildByName("check_name_button");
            if(_loc2_)
            {
               _loc2_.enable();
            }
            _loc2_ = _window.findChildByName("input");
            if(_loc2_)
            {
               _loc2_.enable();
            }
         }
         var_918 = false;
      }
      
      public function set checkedName(param1:String) : void
      {
         var_368 = param1;
         if(var_1347 == var_368)
         {
            showConfirmationView();
            return;
         }
         setNameAvailableView();
      }
      
      public function get view() : IWindowContainer
      {
         return _window;
      }
      
      public function setNormalView() : void
      {
         if(_window == null)
         {
            return;
         }
         var _loc1_:ITextWindow = _window.findChildByName("info_text") as ITextWindow;
         if(_loc1_ == null)
         {
            return;
         }
         _loc1_.text = var_48.localization.getKey("help.tutorial.name.info");
         var _loc2_:IWindowContainer = _window.findChildByName("suggestions") as IWindowContainer;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = false;
      }
      
      private function disposeWindow() : void
      {
         var_1346 = null;
         var_623 = null;
         var_282 = null;
         var_37 = null;
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
      }
      
      public function nameCheckWaitBegin() : void
      {
         var _loc1_:* = null;
         if(_window && true)
         {
            _loc1_ = _window.findChildByName("select_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("check_name_button");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("input");
            if(_loc1_)
            {
               _loc1_.disable();
            }
            _loc1_ = _window.findChildByName("info_text");
            if(_loc1_)
            {
               _loc1_.caption = var_48.localization.getKey("help.tutorial.name.wait_while_checking");
            }
         }
         var_918 = true;
      }
   }
}
