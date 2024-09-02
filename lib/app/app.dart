import 'package:flutter/material.dart';
import 'package:flutter_seer/app/app_router.dart';
import 'package:flutter_seer/models/view/menu_item.dart';
import 'package:flutter_seer/pages/home_page.dart';
import 'package:flutter_seer/pages/search_page.dart';
import 'package:flutter_seer/pages/setting_page.dart';
import 'package:flutter_seer/shared/colors.dart';
import 'package:flutter_seer/utils/translation_service.dart';
import 'package:flutter_seer/widgets/common_layout.dart';
import 'package:get/get.dart';

class MainApplication extends StatelessWidget {
  const MainApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: TranslationService(),
      locale: const Locale('th', 'TH'),
      fallbackLocale: const Locale('th', 'TH'),
      theme: ThemeData(
        fontFamily: 'Cloud',
        textTheme: const TextTheme(
          displaySmall: TextStyle(color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: colorPurple800,
          surfaceTintColor: colorPurple800,
          foregroundColor: Colors.white,
        ),
      ),
      getPages: AppRouter.routes,
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentSelectPage = 0;

  final ScrollController _scrollController = ScrollController();

  late final List<MenuItem> _menus = [
    MenuItem(label: "home".tr, body: HomePage(scrollController: _scrollController), icon: const Icon(Icons.home)),
    MenuItem(label: "search".tr, body: SearchPage(scrollController: _scrollController), icon: const Icon(Icons.search)),
    MenuItem(label: "setting".tr, body: SettingPage(scrollController: _scrollController), icon: const Icon(Icons.settings)),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onTapChangePage(int index) {
    setState(() {
      _currentSelectPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      isShowBottomNavigationBar: true,
      onTapChangePage: _onTapChangePage,
      currentSelectPage: _currentSelectPage,
      scrollController: _scrollController,
      menus: _menus,
    );
  }
}