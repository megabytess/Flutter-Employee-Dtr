import 'package:employee_dtr/config/colors.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen/history_tab.dart';
import 'home_screen/home_tab.dart';
import 'home_screen/profile_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Tab> myTabs = <Tab>[
    Tab(
      text: "HISTORY",
      icon: Icon(
        Icons.history_rounded,
        size: 35,
        color: Color.fromARGB(255, 12, 50, 87),
      ),
    ),
    Tab(
      text: "HOME",
      icon: Icon(
        Icons.home_rounded,
        size: 35,
        color: Color.fromARGB(255, 12, 50, 87),
      ),
    ),
    Tab(
        text: "PROFILE",
        icon: Icon(
          Icons.account_circle,
          size: 35,
          color: Color.fromARGB(255, 12, 50, 87),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Builder(builder: (context) {
        return Scaffold(
          // endDrawerEnableOpenDragGesture: true,
          // drawerEnableOpenDragGesture: true,
          // floatingActionButton: Builder(
          //   builder: (context) => InkWell(
          //     onLongPress: () => Scaffold.of(context).openEndDrawer(),
          //     child: FloatingActionButton(
          //       onPressed: () => Scaffold.of(context).openDrawer(),
          //       backgroundColor: const Color.fromARGB(255, 12, 50, 87),
          //       child: const Icon(
          //         Icons.menu,
          //         color: Colors.white,
          //       ),
          //     ),
          //   ),
          // ),
          // drawer: Drawer(
          //   //remove this when not in used
          //   child: ListView(
          //     padding: EdgeInsets.zero,
          //     children: const <Widget>[
          //       DrawerHeader(
          //         decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 10, 45, 78),
          //         ),
          //         child: Text(
          //           'Drawer Header',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 24,
          //           ),
          //         ),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.message),
          //         title: Text('Messages'),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.account_circle),
          //         title: Text('Profile'),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.settings),
          //         title: Text('Settings'),
          //       ),
          //     ],
          //   ),
          // ),
          // endDrawer: Drawer(
          //   //remove this when not in used
          //   child: ListView(
          //     padding: EdgeInsets.zero,
          //     children: const <Widget>[
          //       DrawerHeader(
          //         decoration: BoxDecoration(
          //           color: Color.fromARGB(255, 12, 50, 87),
          //         ),
          //         child: Text(
          //           'Drawer Header',
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 24,
          //           ),
          //         ),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.message),
          //         title: Text('Messages'),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.account_circle),
          //         title: Text('Profile'),
          //       ),
          //       ListTile(
          //         leading: Icon(Icons.settings),
          //         title: Text('Settings'),
          //       ),
          //     ],
          //   ),
          // ),
          appBar: AppBar(
            actions: const [SizedBox()],
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            elevation: 1,
            centerTitle: true,
            title: SvgPicture.asset(
              'assets/images/headericon.svg',
              height: 20,
            ),
          ),
          body: const TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HistoryTab(),
              HomeTab(),
              ProfileTab(),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: AppBar().preferredSize.height *1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    flex: 3,
                    child: TabBarAnimate(
                      tabs: myTabs,
                      controller: DefaultTabController.of(context),
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class TabBarAnimate extends StatefulWidget {
  const TabBarAnimate(
      {super.key, required this.tabs, required this.controller});
  final List<Tab> tabs;
  final TabController controller;

  @override
  State<TabBarAnimate> createState() => _TabBarAnimate();
}

class _TabBarAnimate extends State<TabBarAnimate> {
  final animationDuration = const Duration(milliseconds: 300);
  final animationCurve = Curves.easeInOut;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      tabIndex = widget.controller.index;
    });
    widget.controller.addListener(() {
      if (widget.controller.indexIsChanging) {
        setState(() {
          tabIndex = widget.controller.index;
        });
      }
    });
  }

  final tabHeight = 100.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: prefer_const_constructors
      padding: EdgeInsets.all(5),
      height: tabHeight,
      child: Stack(
        children: [
          AnimatedAlign(
            duration: animationDuration,
            curve: animationCurve,
            alignment:
                FractionalOffset(1 / (widget.tabs.length - 1) * tabIndex, 0),
            child: Container(
              height: tabHeight,
              color: Colors.transparent,
              child: FractionallySizedBox(
                widthFactor: 1 / widget.tabs.length,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context) == ThemeData.light()
                            ? Colors.white
                            : Colors.transparent,
                        border: Border(
                            top: BorderSide(
                                color: Theme.of(context) == ThemeData.light()
                                    ? CustomTheme.materialBlue[700]!
                                    : Colors.white,
                                width: 2)),
                      ),
                      child: Text(
                        '${widget.tabs[tabIndex].text}',
                        style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 12, 50, 87)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
              children: widget.tabs.asMap().entries.map((entry) {
            final i = entry.key;
            final tab = entry.value;
            final isActiveTab = i == tabIndex;
            return Expanded(
              child: GestureDetector(
                onTap: () => widget.controller.animateTo(i),
                child: Container(
                    color: Colors.transparent,
                    height: tabHeight,
                    child: AnimatedOpacity(
                      duration: animationDuration,
                      opacity: isActiveTab ? 1 : 0.25,
                      child: AnimatedSlide(
                          duration: animationDuration,
                          offset: Offset(0, isActiveTab ? -0.15 : 0),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedOpacity(
                                duration: animationDuration,
                                opacity: isActiveTab ? 1 : 0,
                                child: Transform.translate(
                                  offset: const Offset(8, 0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),
                              tab.icon as Icon
                            ],
                          )),
                    )),
              ),
            );
          }).toList()),
        ],
      ),
    );
  }
}
