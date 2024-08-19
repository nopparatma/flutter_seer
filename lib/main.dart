import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';
import 'package:flutter_seer/utils/translation_service.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await TranslationService.loadTranslations();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      ),
      home: MyHomePage(title: 'home'.tr),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  bool _isBottomNavVisible = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (_isBottomNavVisible) {
          setState(() {
            _isBottomNavVisible = false;
          });
        }
      } else if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!_isBottomNavVisible) {
          setState(() {
            _isBottomNavVisible = true;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // static List<Widget> _widgetOptions = <Widget>[
  //   HomeScreen(),
  //   SettingsScreen(),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double bottomNavHeight = _isBottomNavVisible
        ? kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom
        : 0;

    return Scaffold(
      backgroundColor: const Color(0xFF191A25),
      appBar: AppBar(
        backgroundColor: const Color(0xFF20212D),
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.large,
        ),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 30,
        itemBuilder: (context, index) {
          return ListTile(
            title:
                Text('Item $index', style: Theme.of(context).textTheme.normal),
          );
        },
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: bottomNavHeight,
        child: Wrap(
          children: [
            BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  label: 'home'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: 'settings'.tr,
                ),
              ],
              currentIndex: _selectedIndex,
              backgroundColor: const Color(0xFF20212D),
              selectedItemColor: const Color(0xFF766AFF),
              unselectedItemColor: const Color(0xFF7C7D90),
              onTap: _onItemTapped,
            )
          ],
        ),
      ),
    );
  }
}
