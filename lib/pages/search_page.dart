import 'package:flutter/material.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';

class SearchPage extends StatefulWidget {
  final ScrollController scrollController;

  const SearchPage({super.key, required this.scrollController});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    debugPrint("SearchPage");
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: widget.scrollController,
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Search $index', style: Theme.of(context).textTheme.normal),
        );
      },
    );
  }
}
