import 'package:bani_bayram/ui/home/upload_video.dart';
import 'package:bani_bayram/widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'dart:developer' as dev;

import '../../controllers/auth_controller.dart';
import '../../images.dart';
import '../../theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AuthenticationController authController;
  int currentIndex = 0;
  late TabController tabController;

  final List<NavItem> navItems = [
    NavItem('Home', Images.homeBlack, const HomeScreen()),
    NavItem('block', Images.block, Container()),
    NavItem('plus', Images.plus, const UploadVideoScreen()),
    NavItem('block', Images.block, Container()),
    NavItem('block', Images.block, Container()),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authController = AuthenticationController();
    tabController = TabController(length: 5, initialIndex: 0, vsync: this);
    tabController.addListener(() {
      currentIndex = tabController.index;
      setState(() {});
    });
  }

  List<Widget> buildTab() {
    List<Widget> tabs = [];
    for (int i = 0; i < navItems.length; i++) {
      tabs.add(
        SvgPicture.asset(
          navItems[i].icon,
          color: (currentIndex == i || i == 2) ? null : AppTheme.mainColor.shade100,
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        myAlertDialog(
          context: context,
          message: 'Se déconnecter ?',
          onAccept: () => authController.signOut(context),
        );
        return true;
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                  controller: tabController,
                  children: navItems.map((navItem) => navItem.screen).toList()),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: AppTheme.mainColor,
                      width: 3.0,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: AppTheme.mainColor,
                tabs: buildTab(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavItem {
  final String title;
  final String icon;
  final Widget screen;

  NavItem(this.title, this.icon, this.screen);
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              ListTile(
                leading: Icon(Icons.person_outline),
                title: Text('Bayram Bani'),
                subtitle: Text('bayram.bani@gmail.com'),
                trailing: Icon(Icons.search_outlined),
              )
            ],
          ),
        ),
      ),
    );
  }
}
