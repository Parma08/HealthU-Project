import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ArticleInfoScreen extends StatelessWidget {
  int articleIndex;
  ArticleInfoScreen({required this.articleIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF92A3FD),
        elevation: 0,
        title: Text(
          ARTICLES[articleIndex]['heading'],
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: MediaQuery.of(context).size.height -
            (MediaQuery.of(context).padding.top +
                AppBar().preferredSize.height),
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                ARTICLES[articleIndex]['heading'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text(ARTICLES[articleIndex]['subheading'],
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50),
              child: Text(ARTICLES[articleIndex]['content'],
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1D1617),
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
