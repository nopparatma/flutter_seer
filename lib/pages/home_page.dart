import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_seer/models/view/card_type_item.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';

class HomePage extends StatefulWidget {
  final ScrollController scrollController;

  const HomePage({super.key, required this.scrollController});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List of images to display in the carousel
  final List<CardTypeItem> cardTypes = [
    CardTypeItem(label: 'Midnight Tarot', desc: 'Discover Your Fate', imagePath: 'assets/images/midnight_tarot.png'),
    CardTypeItem(label: 'Angel Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/angel_cards.png'),
    CardTypeItem(label: 'Gypsy Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/gypsy_cards.png'),
    CardTypeItem(label: 'Kipper Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/kipper_cards.png'),
    CardTypeItem(label: 'Lenormand Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/lenormand_cards.png'),
    CardTypeItem(label: 'Oracle Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/oracle_cards.png'),
    CardTypeItem(label: 'Tarot Cards', desc: 'Discover Your Fate', imagePath: 'assets/images/tarot_cards.png'),
  ];

  @override
  void initState() {
    super.initState();
    debugPrint("HomePage");
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
            CardTypeItem cardTypeItem = cardTypes[index];

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
                            Text(cardTypeItem.desc, style: Theme.of(context).textTheme.normal?.copyWith(color: Colors.grey))
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
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
      ),
      itemCount: cardTypes.length,
      itemBuilder: (context, index) {
        CardTypeItem cardTypeItem = cardTypes[index];
        return GestureDetector(
          onTap: () {
            // Handle tap event here if needed
          },
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
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cardTypeItem.label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
