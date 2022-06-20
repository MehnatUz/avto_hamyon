import 'package:avto_hamyon/pages/map/on_map_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class OnMapTabBarPage extends StatefulWidget {
  const OnMapTabBarPage({Key? key, this.radius = 20, this.isWorker = 0})
      : super(key: key);
  final double radius;
  final int isWorker;

  @override
  State<OnMapTabBarPage> createState() => _OnMapTabBarPageState();
}

class _OnMapTabBarPageState extends State<OnMapTabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  _OnMapTabBarPageState();

  @override
  void initState() {
    _tabController =
        TabController(length: 2, vsync: this, initialIndex: widget.isWorker);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Material(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                onTap: (index) {
                  // if (index == 0) {
                  //   bloc.add(MapOpened(isWorker: 0, radius: widget.radius));
                  // } else {
                  //   bloc.add(MapOpened(isWorker: 1, radius: widget.radius));
                  // }
                },
                labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w500),
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Hammasi',
                  ),
                  Tab(
                    text: 'Ochiqlar',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  // first tab bar view widget
                  OnMapPage(
                    isWorkers: true,
                  ),
                  OnMapPage(
                    isWorkers: true,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
