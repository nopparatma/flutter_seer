import 'package:flutter/material.dart';
import 'package:flutter_seer/widgets/common_layout.dart';

class CardDetailPage extends StatefulWidget {
  final String titleCardDetail;

  const CardDetailPage({super.key, required this.titleCardDetail});

  @override
  createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      scrollController: _scrollController,
      title: widget.titleCardDetail,
      body: Container(),
    );
  }
}
