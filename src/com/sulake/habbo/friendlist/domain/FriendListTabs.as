package com.sulake.habbo.friendlist.domain
{
   import com.sulake.habbo.friendlist.FriendRequestsView;
   import com.sulake.habbo.friendlist.FriendsView;
   import com.sulake.habbo.friendlist.SearchView;
   
   public class FriendListTabs
   {
       
      
      private var var_1831:int = 200;
      
      private var var_681:int = 200;
      
      private var var_427:IFriendListTabsDeps;
      
      private var var_430:Array;
      
      private var var_1446:FriendListTab;
      
      private var var_1447:int = 200;
      
      public function FriendListTabs(param1:IFriendListTabsDeps)
      {
         var_430 = new Array();
         super();
         var_427 = param1;
         var_430.push(new FriendListTab(var_427.getFriendList(),FriendListTab.const_87,new FriendsView(),"${friendlist.friends}","friends_footer","hdr_friends"));
         var_430.push(new FriendListTab(var_427.getFriendList(),FriendListTab.const_91,new FriendRequestsView(),"${friendlist.tab.friendrequests}","friend_requests_footer","hdr_friend_requests"));
         var_430.push(new FriendListTab(var_427.getFriendList(),FriendListTab.const_307,new SearchView(),"${generic.search}","search_footer","hdr_search"));
         toggleSelected(null);
      }
      
      public function findSelectedTab() : FriendListTab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_430)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function get tabContentWidth() : int
      {
         return var_1447 - 2;
      }
      
      public function toggleSelected(param1:FriendListTab) : void
      {
         var _loc2_:FriendListTab = findSelectedTab();
         if(_loc2_ == null)
         {
            var_681 = var_1831;
            setSelected(determineDisplayedTab(param1),true);
         }
         else if(_loc2_ == param1 || param1 == null)
         {
            var_1831 = var_681;
            var_681 = 0;
            clearSelections();
         }
         else
         {
            setSelected(determineDisplayedTab(param1),true);
         }
      }
      
      public function clearSelections() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_430)
         {
            _loc1_.setSelected(false);
         }
      }
      
      public function set tabContentHeight(param1:int) : void
      {
         var_681 = param1;
      }
      
      public function findTab(param1:int) : FriendListTab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_430)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function setSelected(param1:FriendListTab, param2:Boolean) : void
      {
         var _loc3_:FriendListTab = findSelectedTab();
         clearSelections();
         param1.setSelected(param2);
         if(param2)
         {
            var_1446 = param1;
         }
      }
      
      private function determineDisplayedTab(param1:FriendListTab) : FriendListTab
      {
         if(param1 != null)
         {
            return param1;
         }
         if(var_1446 != null)
         {
            return var_1446;
         }
         return var_430[0];
      }
      
      public function get tabContentHeight() : int
      {
         return var_681;
      }
      
      public function set windowWidth(param1:int) : void
      {
         var_1447 = param1;
      }
      
      public function getTabs() : Array
      {
         return var_430;
      }
      
      public function get windowWidth() : int
      {
         return var_1447;
      }
   }
}
