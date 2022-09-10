import 'package:direct2u/app/core/resources/app_resources.dart';
import 'package:direct2u/app/core/utils/app_widgets.dart';
import 'package:direct2u/app/modules/categories/views/categories_view.dart';
import 'package:direct2u/app/modules/home/views/home_view.dart';
import 'package:direct2u/app/modules/notification/views/notification_view.dart';
import 'package:direct2u/app/modules/orders/views/orders_view.dart';
import 'package:direct2u/app/modules/profile/views/profile_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const HomeView(),
      const CategoriesView(),
      const OrdersView(),
      const NotificationView(),
      const ProfileView()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_outlined),
        title: ("Home"),
        activeColorPrimary: themeColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.apps_outlined),
        title: ("Categories"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag_outlined),
        title: ("Order"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications_outlined),
        title: ("Notification"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_circle_outlined),
        title: ("Profile"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildMainAppBar(() {}),
        body: PersistentTabView(
          context,
          controller: controller.persistentController,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .simple, // Choose the nav bar style with this property.
        ));
  }
}
