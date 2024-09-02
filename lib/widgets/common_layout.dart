import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_seer/models/view/menu_item.dart';
import 'package:flutter_seer/shared/colors.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';

class CommonLayout extends StatefulWidget {
  final ScrollController scrollController;
  final Function(int)? onTapChangePage;
  final int currentSelectPage;
  final List<MenuItem> menus;
  final bool isShowBottomNavigationBar;
  final String? title;
  final Widget? body;
  final bool isAlwaysShowAppBar;

  const CommonLayout({
    super.key,
    required this.scrollController,
    this.onTapChangePage,
    this.currentSelectPage = 0,
    List<MenuItem>? menus,
    this.isShowBottomNavigationBar = false,
    this.title,
    this.body,
    this.isAlwaysShowAppBar = false,
  }) : menus = menus ?? const [];

  @override
  createState() => _CommonLayoutState();
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
    final double appBarHeight = widget.isAlwaysShowAppBar || _isBottomNavVisible ? kToolbarHeight + MediaQuery.of(context).padding.top : kToolbarHeight;
    final double bottomNavHeight = _isBottomNavVisible ? kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom : 0;

    return Scaffold(
      backgroundColor: colorPurple900,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: appBarHeight,
          child: widget.isAlwaysShowAppBar || _isBottomNavVisible
              ? AppBar(
                  title: Text(
                    _overrideTextAppBar(),
                    style: Theme.of(context).textTheme.large,
                  ),
                )
              : null,
        ),
      ),
      body: _overrideBody(),
      bottomNavigationBar: widget.isShowBottomNavigationBar
          ? AnimatedContainer(
              duration: const Duration(milliseconds: 200),
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
            )
          : null,
    );
  }

  String _overrideTextAppBar() {
    if (widget.title != null) {
      return widget.title ?? '';
    }

    return widget.menus[widget.currentSelectPage].label;
  }

  Widget _overrideBody() {
    if (widget.body != null) {
      return widget.body ?? Container();
    }

    return widget.menus[widget.currentSelectPage].body;
  }
}
