import 'package:flutter/material.dart';
import 'package:flutter_seer/models/view/card_type_item.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';

class GridCard extends StatelessWidget {
  final List<CardItem> listCards;
  final Function(CardItem) onTapItem;
  final double childAspectRatio;

  const GridCard({
    super.key,
    required this.listCards,
    required this.onTapItem,
    this.childAspectRatio = 1.5
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: childAspectRatio,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          itemCount: listCards.length,
          itemBuilder: (context, index) {
            CardItem item = listCards[index];
            return GestureDetector(
              onTap: () => onTapItem(item),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  image: DecorationImage(
                    // image: AssetImage(item.imagePath),
                    image: NetworkImage('https://static.wixstatic.com/media/2c520b_799e0d1497524e1e84261a96a317b345~mv2.png/v1/fit/w_517,h_701,q_90/2c520b_799e0d1497524e1e84261a96a317b345~mv2.webp'),
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
                      item.label,
                      style: Theme.of(context).textTheme.normal?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
