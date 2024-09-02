import 'package:flutter/material.dart';
import 'package:flutter_seer/app/app_router.dart';
import 'package:flutter_seer/models/view/card_type_item.dart';
import 'package:flutter_seer/shared/colors.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';
import 'package:flutter_seer/widgets/common_layout.dart';
import 'package:flutter_seer/widgets/grid_card.dart';
import 'package:get/get.dart';

class CardListPage extends StatefulWidget {
  final String titleCardType;

  const CardListPage({super.key, required this.titleCardType});

  @override
  createState() => _CardListPageState();
}

class _CardListPageState extends State<CardListPage> {
  final ScrollController _scrollController = ScrollController();

  // List of images to display in the carousel
  final List<CardItem> cardTypes = [
    CardItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
  ];

  void onTapCardItem(CardItem item) {
    Get.toNamed(
      RoutePath.cardDetail,
      arguments: {'titleCardDetail': item.label},
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      scrollController: _scrollController,
      title: widget.titleCardType,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                // controller: _controller,
                style: Theme.of(context).textTheme.normal,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search for a card meaning...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) => {},
              ),
              const SizedBox(height: 16),
              GridCard(
                listCards: cardTypes,
                onTapItem: (item) => onTapCardItem(item),
              )
            ],
          ),
        ),
      ),
    );

    // return Scaffold(
    //   backgroundColor: colorPurple900,
    //   appBar: AppBar(
    //     title: Text(
    //       widget.titleCardType,
    //       style: Theme.of(context).textTheme.large,
    //     ),
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       children: [
    //         TextField(
    //           // controller: _controller,
    //           style: Theme.of(context).textTheme.normal,
    //           decoration: InputDecoration(
    //             prefixIcon: const Icon(Icons.search),
    //             hintText: 'Search for a card meaning...',
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(8.0),
    //             ),
    //           ),
    //           onChanged: (value) => {},
    //         ),
    //         const SizedBox(height: 8),
    //         Expanded(
    //           child: GridCard(
    //             listCards: cardTypes,
    //             onTapItem: (item) => onTapCardItem(item),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
