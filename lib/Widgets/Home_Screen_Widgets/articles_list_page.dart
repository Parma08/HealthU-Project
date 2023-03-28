import 'package:fiteness_x/Widgets/Home_Screen_Widgets/articles_info_screen.dart';
import 'package:fiteness_x/modals/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ArticlesListScreen extends StatelessWidget {
  const ArticlesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF92A3FD),
        elevation: 0,
        title: Text(
          'Articles',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top +
                  AppBar().preferredSize.height),
          child: ListView.builder(
            itemBuilder: (_, index) {
              return Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ArticleInfoScreen(articleIndex: index);
                    }));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(158, 158, 158, 0.3),
                              blurRadius: 5)
                        ],
                        color: Colors.white),
                    width: MediaQuery.of(context).size.width * 0.90,
                    height: 100,
                    child: LayoutBuilder(
                      builder: (_, constraints) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: constraints.maxWidth * 0.7,
                                  child: Text(
                                    ARTICLES[index]['heading'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: Icon(
                                Icons.arrow_circle_right_outlined,
                                color: Color(0xFFC58BF2),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            },
            itemCount: ARTICLES.length,
          )),
    );
  }
}
