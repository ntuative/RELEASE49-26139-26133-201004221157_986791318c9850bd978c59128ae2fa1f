package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_598:int = 6;
      
      public static const const_211:int = 5;
      
      public static const const_552:int = 2;
      
      public static const const_306:int = 9;
      
      public static const const_300:int = 4;
      
      public static const const_274:int = 2;
      
      public static const const_639:int = 4;
      
      public static const const_218:int = 8;
      
      public static const const_702:int = 7;
      
      public static const const_271:int = 3;
      
      public static const const_343:int = 1;
      
      public static const const_228:int = 5;
      
      public static const const_432:int = 12;
      
      public static const const_328:int = 1;
      
      public static const const_742:int = 11;
      
      public static const const_635:int = 3;
      
      public static const const_1523:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_430:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_430 = new Array();
         var_430.push(new Tab(_navigator,const_343,const_432,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_359));
         var_430.push(new Tab(_navigator,const_274,const_328,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_359));
         var_430.push(new Tab(_navigator,const_300,const_742,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_900));
         var_430.push(new Tab(_navigator,const_271,const_211,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_359));
         var_430.push(new Tab(_navigator,const_228,const_218,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_555));
         setSelectedTab(const_343);
      }
      
      public function getSelected() : Tab
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
      
      public function getTab(param1:int) : Tab
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
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_430)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_300;
      }
      
      public function get tabs() : Array
      {
         return var_430;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
