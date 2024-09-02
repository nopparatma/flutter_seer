import 'package:flutter/material.dart';
import 'package:flutter_seer/app/app_router.dart';
import 'package:flutter_seer/models/view/card_type_item.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';
import 'package:flutter_seer/widgets/common_layout.dart';
import 'package:flutter_seer/widgets/grid_card.dart';
import 'package:get/get.dart';

class CardListPage extends StatelessWidget {
  final String titleCardType;

  CardListPage({super.key, required this.titleCardType});

  final ScrollController _scrollController = ScrollController();

  final List<CardItem> cardTypes = [
    CardItem(label: 'The Fool', desc: '', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'The Magician', desc: '', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'The High Priestess', desc: '', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'The Empress', desc: '', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'The Emperor', desc: '', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'The Hierophant', desc: '', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'The Chariot', desc: '', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'Strength', desc: '', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'The Hermit', desc: '', imagePath: 'assets/images/tarot_cards.png'),
    CardItem(label: 'Wheel of Fortune', desc: '', imagePath: 'assets/images/tarot_cards.png'),
  ];

  void onTapCardItem(BuildContext context, CardItem item) {
    FocusScope.of(context).requestFocus(FocusNode());

    Get.toNamed(
      RoutePath.cardDetail,
      arguments: {'titleCardDetail': item.label},
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      scrollController: _scrollController,
      title: titleCardType,
      body: ListView(
        controller: _scrollController,
        children: [
          Padding(
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
                  onTapItem: (item) => onTapCardItem(context, item),
                  childAspectRatio: 0.8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
