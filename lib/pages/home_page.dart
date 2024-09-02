import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seer/app/app_router.dart';
import 'package:flutter_seer/models/view/card_type_item.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';
import 'package:flutter_seer/widgets/grid_card.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final ScrollController scrollController;

  const HomePage({super.key, required this.scrollController});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of images to display in the carousel
  final List<CardItem> cardTypes = [
    CardItem(label: 'Midnight Tarot', desc: 'Discover Your Fate', imagePath: 'assets/images/midnight_tarot.png'),
    CardItem(label: 'Angel Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/angel_cards.png'),
    CardItem(label: 'Gypsy Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/gypsy_cards.png'),
    CardItem(label: 'Kipper Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/kipper_cards.png'),
    CardItem(label: 'Lenormand Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/lenormand_cards.png'),
    CardItem(label: 'Oracle Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/oracle_cards.png'),
    CardItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
  ];

  @override
  void initState() {
    super.initState();
  }

  void onTapCardTypeItem(CardItem item) {
    Get.toNamed(
      RoutePath.cardList,
      arguments: {'titleCardType': item.label},
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: widget.scrollController,
      children: [
        CarouselSlider.builder(
          itemCount: cardTypes.length,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            enlargeFactor: 0.4,
            // height: 300,
          ),
          itemBuilder: (context, index, realIdx) {
            CardItem cardTypeItem = cardTypes[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                        image: DecorationImage(
                          image: AssetImage(cardTypeItem.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          gradient: LinearGradient(
                            colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cardTypeItem.label,
                              style: Theme.of(context).textTheme.large?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              cardTypeItem.desc,
                              style: Theme.of(context).textTheme.normal?.copyWith(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        _buildMainContent(),
        const SizedBox(height: kBottomNavigationBarHeight),
      ],
    );
  }

  Widget _buildMainContent() {
    double lineSpace = 16.0;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Your Card Type',
            style: Theme.of(context).textTheme.normal?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: lineSpace),
          Text(
            'Welcome to the Fortune Teller Assistant app. Here, you can select from a variety of card types to aid in your divination practices. Whether you prefer tarot, oracle, or Lenormand cards, we have something for ...',
            style: Theme.of(context).textTheme.normal,
          ),
          SizedBox(height: lineSpace),
          _buildCardTypeItemGrid(),
        ],
      ),
    );
  }

  Widget _buildCardTypeItemGrid() {
    return GridCard(
      listCards: cardTypes,
      onTapItem: (item) => onTapCardTypeItem(item),
    );
  }
}
