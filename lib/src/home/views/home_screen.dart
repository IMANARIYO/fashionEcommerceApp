// import 'package:ecom_t/main.dart';
import 'package:ecom_t/src/home/controllers/home_tab_notifier.dart';
import 'package:ecom_t/src/home/widgets/categories_list.dart';
import 'package:ecom_t/src/home/widgets/custom_app_bar.dart';
import 'package:ecom_t/src/home/widgets/home_header.dart';
import 'package:ecom_t/src/home/widgets/home_slider.dart';
import 'package:ecom_t/src/home/widgets/home_tabs.dart';
import 'package:ecom_t/src/products/widgets/explore_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController _tabController;
  int _currentTabIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: homeTabs.length, vsync: this);
    _tabController.addListener(_handleSelection);
  }

  void _handleSelection() {
    final controller = Provider.of<HomeTabNotifier>(context, listen: false);
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
      controller.setIndex(homeTabs[_currentTabIndex]);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(110), child: CustomAppBar()),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal:12.w),
          children: [
            SizedBox(
              height: 10.h,
            ),
            const HomeSlider(),
            SizedBox(
              height: 15.h,
            ),
            const HomeHeader(),
            SizedBox(
              height: 15.h,
            ),
            const HomeCategoriesList(),
              SizedBox(
              height: 15.h,
            ),
          HomeTabs(tabController: _tabController),
         SizedBox(
              height: 15.h,
            ),
           const  ExploreProducts(),
             SizedBox(
              height: 150.h,
            ),
             
          ],
        ));
  }
}

List<String> homeTabs = ['all', "popular", "unisex", "men", "women", "kids"];