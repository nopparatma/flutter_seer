import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_seer/models/view/menu_item.dart';
import 'package:flutter_seer/shared/colors.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';

class CommonLayout extends StatefulWidget {
  final Function(int) onTapChangePage;
  final int currentSelectPage;
  final ScrollController scrollController;
  final List<MenuItem> menus;

  const CommonLayout({
    super.key,
    required this.onTapChangePage,
    required this.currentSelectPage,
    required this.scrollController,
    required this.menus,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CommonLayoutState createState() => _CommonLayoutState();
}

class _CommonLayoutState extends State<CommonLayout> {
  bool _isBottomNavVisible = true;

  late List<BottomNavigationBarItem> bottomMenus;

  @override
  void initState() {
    super.initState();

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (_isBottomNavVisible) {
          setState(() {
            _isBottomNavVisible = false;
          });
        }
      } else if (widget.scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (!_isBottomNavVisible) {
          setState(() {
            _isBottomNavVisible = true;
          });
        }
      }
    });

    bottomMenus = widget.menus
        .map((e) => BottomNavigationBarItem(
              icon: e.icon,
              label: e.label,
            ))
        .toList();
  }

  @override
  void dispose() {
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double bottomNavHeight = _isBottomNavVisible ? kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom : 0;
    final double appBarHeight = _isBottomNavVisible ? kToolbarHeight + MediaQuery.of(context).padding.top : kToolbarHeight;

    return Scaffold(
      backgroundColor: colorPurple900,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: appBarHeight,
          child: AppBar(
            title: Text(
              widget.menus[widget.currentSelectPage].label,
              style: Theme.of(context).textTheme.large,
            ),
          ),
        ),
      ),
      body: widget.menus[widget.currentSelectPage].body,
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        height: bottomNavHeight,
        child: Wrap(
          children: [
            BottomNavigationBar(
              items: bottomMenus,
              currentIndex: widget.currentSelectPage,
              backgroundColor: colorPurple800,
              selectedItemColor: colorPurple100,
              unselectedItemColor: colorPurpleGray,
              onTap: widget.onTapChangePage,
            )
          ],
        ),
      ),
    );
  }
}
