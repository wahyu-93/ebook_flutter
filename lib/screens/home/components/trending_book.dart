import 'package:ebook_app/models/book_list.dart';
import 'package:ebook_app/screens/home/pages/book_details.dart';
import 'package:ebook_app/themes.dart';
import 'package:flutter/material.dart';

class TrendingBook extends StatelessWidget {
  const TrendingBook({super.key, required this.bookList});

  final BookList bookList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              BookDetail.nameRoute,
              arguments: {'imageUrl': bookList.imageUrl, 'writers': bookList.writers, 'title': bookList.title},
            );
          },
          child: Hero(
            tag: bookList.imageUrl,
            child: Container(
              margin: EdgeInsets.only(top: 12, right: 20),
              width: 110,
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(bookList.imageUrl)),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(bookList.writers, style: mediumText12.copyWith(color: greyColor)),
        Text(bookList.title, style: semiBoldText14.copyWith(color: blackColor)),
      ],
    );
  }
}
