package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2030:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_137:TutorialUI;
      
      private var var_721:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_59:HelpUI;
      
      private var var_722:IHabboConfigurationManager;
      
      private var var_194:IHabboToolbar;
      
      private var var_595:HotelMergeUI;
      
      private var var_312:IHabboCommunicationManager;
      
      private var var_861:FaqIndex;
      
      private var var_1789:String = "";
      
      private var var_997:IncomingMessages;
      
      private var var_1271:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1271 = new CallForHelpData();
         var_2030 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_861 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_194;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_59 != null)
         {
            var_59.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_59 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_59.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(var_137 != null)
         {
            var_137.dispose();
            var_137 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1789;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_59 != null)
         {
            var_59.dispose();
            var_59 = null;
         }
         if(var_137 != null)
         {
            var_137.dispose();
            var_137 = null;
         }
         if(var_595)
         {
            var_595.dispose();
            var_595 = null;
         }
         if(var_861 != null)
         {
            var_861.dispose();
            var_861 = null;
         }
         var_997 = null;
         if(var_194)
         {
            var_194.release(new IIDHabboToolbar());
            var_194 = null;
         }
         if(var_721)
         {
            var_721.release(new IIDHabboLocalizationManager());
            var_721 = null;
         }
         if(var_312)
         {
            var_312.release(new IIDHabboCommunicationManager());
            var_312 = null;
         }
         if(var_722)
         {
            var_722.release(new IIDHabboConfigurationManager());
            var_722 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_721;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_98:
               if(var_59 != null)
               {
                  var_59.setRoomSessionStatus(true);
               }
               if(var_137 != null)
               {
                  var_137.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_103:
               if(var_59 != null)
               {
                  var_59.setRoomSessionStatus(false);
               }
               if(var_137 != null)
               {
                  var_137.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_59 != null)
         {
            var_59.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2030;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_59 != null)
         {
            var_59.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_595)
         {
            var_595 = new HotelMergeUI(this);
         }
         var_595.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_137 == null && _assetLibrary != null && _windowManager != null)
         {
            var_137 = new TutorialUI(this);
         }
         return var_137 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_59 == null && _assetLibrary != null && _windowManager != null)
         {
            var_59 = new HelpUI(this,_assetLibrary,_windowManager,var_721,var_194);
         }
         return var_59 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1271;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1271.reportedUserId = param1;
         var_1271.reportedUserName = param2;
         var_59.showUI(HabboHelpViewEnum.const_325);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1789 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_194 != null)
         {
            var_194.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_117,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_721 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_137 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_137.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_312 = IHabboCommunicationManager(param2);
         var_997 = new IncomingMessages(this,var_312);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_59 != null)
         {
            var_59.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_59 != null)
         {
            var_59.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_312 != null && param1 != null)
         {
            var_312.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_861;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_59 != null)
         {
            var_59.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_194 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_722 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_137;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_88)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_63)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_595;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_98,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_103,onRoomSessionEvent);
         var_194.events.addEventListener(HabboToolbarEvent.const_88,onHabboToolbarEvent);
         var_194.events.addEventListener(HabboToolbarEvent.const_63,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_59 != null)
         {
            var_59.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_722 == null)
         {
            return param1;
         }
         return var_722.getKey(param1,param2,param3);
      }
   }
}
