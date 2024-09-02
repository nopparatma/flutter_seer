import 'package:flutter/material.dart';
import 'package:flutter_seer/shared/custom_text_theme.dart';
import 'package:flutter_seer/widgets/common_layout.dart';

class CardDetailPage extends StatelessWidget {
  final String titleCardDetail;

  CardDetailPage({
    super.key,
    required this.titleCardDetail,
  });

  final ScrollController _scrollController = ScrollController();

  final List<Map<String, String>> details = [
    {'title': 'ความหมายโดยสรุป', 'desc': 'ไพ่ The Fool แสดงถึงการเริ่มต้นใหม่ในชีวิต หรือการก้าวเข้าสู่สิ่งใหม่ๆ ที่ไม่เคยทำมาก่อน เป็นช่วงเวลาของการสำรวจและการลองทำสิ่งใหม่ๆ โดยไม่คำนึงถึงความเสี่ยงที่อาจเกิดขึ้น ความหมายนี้สามารถนำไปใช้ได้กับทุกด้านของชีวิต เช่น การเริ่มต้นงานใหม่ ความสัมพันธ์ใหม่ หรือการเริ่มต้นการเดินทางที่ไม่เคยมีประสบการณ์มาก่อน ไพ่ใบนี้ยังเตือนให้ระวังไม่ให้ทำอะไรโดยไม่คิดล่วงหน้า ควรมีสติและพิจารณาอย่างรอบคอบก่อนที่จะตัดสินใจ'},
    {'title': 'การงาน', 'desc': 'โอกาสใหม่ในงานหรือโปรเจคที่ยังไม่เคยทำมาก่อน คุณอาจพบว่าตนเองกำลังเริ่มต้นสิ่งใหม่ๆ ที่ยังไม่เคยมีประสบการณ์ แต่การเปิดใจและการรับมือกับความเสี่ยงจะนำไปสู่ความสำเร็จได้'},
    {'title': 'การเงิน', 'desc': 'การเงินมีความเสี่ยง แต่ก็มีโอกาสที่จะได้รับผลตอบแทนที่ดีหากคุณกล้าพอที่จะลงทุนหรือใช้เงินในสิ่งใหม่ๆ ที่ไม่เคยลองมาก่อน'},
    {'title': 'ความรัก', 'desc': 'ความสัมพันธ์ที่มีความไม่แน่นอน อาจเป็นความรักที่เกิดขึ้นโดยบังเอิญหรือความรักที่ยังไม่มั่นคง การเริ่มต้นใหม่ในความสัมพันธ์อาจมีความท้าทาย'},
  ];

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      isAlwaysShowAppBar: true,
      scrollController: _scrollController,
      title: titleCardDetail,
      body: ListView(
        controller: _scrollController,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(
                  'https://cms.dmpcdn.com/horoscope/2019/07/01/a58ed9f4-ee1c-4174-9fcf-07c3dcf1039e_original.png',
                  fit: BoxFit.fitHeight,
                  scale: 1,
                  height: 300,
                ),
                const SizedBox(height: 16),
                _buildExpansionTiles(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildExpansionTiles(BuildContext context) {
    return Column(
      children: [
        ...details.map(
          (e) => Column(
            children: [
              ExpansionTile(
                initiallyExpanded: true,
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
                title: Text(
                  e['title'] ?? '',
                  style: Theme.of(context).textTheme.normal?.copyWith(fontWeight: FontWeight.bold),
                ),
                expandedAlignment: Alignment.topLeft,
                children: [
                  ListTile(
                    title: Text(
                      e['desc'] ?? '',
                      style: Theme.of(context).textTheme.normal,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
