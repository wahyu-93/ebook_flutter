import 'package:ebook_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecentBook extends StatelessWidget {
  const RecentBook({super.key, required this.imageBook, required this.title });

  final String imageBook;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: borderColorRecentBook),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Image.asset(imageBook, width: 90),
          SizedBox(width: 18),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: semiBoldText14.copyWith(color: blackColor2)),
              CircularPercentIndicator(
                reverse: true,
                radius: 30,
                lineWidth: 7,
                animation: true,
                percent: 0.5,
                progressColor: greenColor,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              Text('50% completed', style: mediumText12.copyWith(color: greyColorRecentBook)),
            ],
          ),
        ],
      ),
    );
  }
}
