import 'package:ebook_app/models/book_list.dart';
import 'package:ebook_app/screens/home/components/recent_book.dart';
import 'package:ebook_app/screens/home/components/trending_book.dart';
import 'package:ebook_app/themes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> _categories = ['All Books', 'Comic', 'Novel', 'Manga', 'Fairy Tales', 'Drama', 'Romance', 'Advanture'];
int _isSelected = 0;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('assets/images/profile-pic.png')),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hallo Shanum!', style: semiBoldText16),
                Text('Good Morning', style: semiBoldText14.copyWith(color: greyColor)),
              ],
            ),
            Spacer(),
            Image.asset('assets/icons/icon-menu.png', width: 18),
          ],
        ),
      );
    }

    Widget searchField() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Find Your Favorite Book',
            hintStyle: mediumText12.copyWith(color: greyColor),
            fillColor: greyColorSearchField,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            isCollapsed: true,
            contentPadding: EdgeInsets.all(18),
            suffixIcon: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: greenColor, borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Icon(Icons.search_rounded, color: whiteColor),
              ),
            ),
          ),
        ),
      );
    }

    Widget recentBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            RecentBook(imageBook: 'assets/images/recentbook_1.png', title: 'The Magic'),
            SizedBox(width: 20),
            RecentBook(imageBook: 'assets/images/recentbook_2.png', title: 'The Martial'),
          ],
        ),
      );
    }

    Widget categories(int index) {
      // GestureDetector /inkWell
      // inkWell menyebabkan adanya bayangan ketika diklik
      return GestureDetector(
        onTap: () {
          setState(() {
            _isSelected = index;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 30, right: 12),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: BoxDecoration(
            color: _isSelected == index ? greenColor : transParentColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            _categories[index],
            style: semiBoldText14.copyWith(color: _isSelected == index ? whiteColor : greyColor),
          ),
        ),
      );
    }

    Widget listCategories() {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        child: Row(children: _categories.asMap().entries.map((MapEntry map) => categories(map.key)).toList()),
      );
    }

    Widget trendingBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children:
              bookLists.asMap().entries.map((MapEntry map) => TrendingBook(bookList: bookLists[map.key])).toList(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                SizedBox(height: 30),
                searchField(),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text('Recent Book', style: semiBoldText16.copyWith(color: blackColor)),
                ),
                SizedBox(height: 12),
                recentBook(),
              ],
            ),
          ),
          listCategories(),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 30),
            child: Text('Trendign Now', style: semiBoldText16.copyWith(color: blackColor)),
          ),
          trendingBook(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
