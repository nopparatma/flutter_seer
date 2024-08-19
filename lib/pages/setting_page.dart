import 'package:flutter/material.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';

class SettingPage extends StatefulWidget {
  final ScrollController scrollController;

  const SettingPage({
    super.key,
    required this.scrollController,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
    debugPrint("SettingPage");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Setting $index', style: Theme.of(context).textTheme.normal),
        );
      },
    );
  }
}
