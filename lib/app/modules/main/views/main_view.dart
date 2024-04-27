import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:movie/app/modules/Post/views/post_view.dart';
import 'package:movie/app/modules/home/views/home_view.dart';
import 'package:movie/app/modules/saved/views/saved_view.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      initState: (_) {},
      builder: (_) {
        return Obx(
          () => Scaffold(
            body: [
              const HomeView(),
              const SavedView(),
              const SavedView(),
              const PostView(),
            ][controller.mainState.currentPageIndex],
            bottomNavigationBar: NavigationBar(
              elevation: 3.0,
              indicatorColor: Colors.transparent,
              backgroundColor: Colors.white,
              destinations: [
                NavigationDestination(
                  label: "",
                  icon: Image.asset(
                    "assets/images/Bookmark.png",
                  ),
                ),
                NavigationDestination(
                  label: "",
                  icon: Image.asset(
                    "assets/images/Shape.png",
                  ),
                ),
                NavigationDestination(
                  label: "",
                  icon: Image.asset(
                    "assets/images/saved.png",
                  ),
                ),
              ],
              selectedIndex: controller.mainState.currentPageIndex,
              onDestinationSelected: (value) =>
                  {controller.mainState.currentPageIndex = value},
            ),
          ),
        );
      },
    );
  }
}
