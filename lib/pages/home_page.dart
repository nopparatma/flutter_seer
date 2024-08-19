import 'package:flutter/material.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';

class HomePage extends StatefulWidget {
  final ScrollController scrollController;

  const HomePage({super.key, required this.scrollController});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Home $index', style: Theme.of(context).textTheme.normal),
        );
      },
    );
  }
}
