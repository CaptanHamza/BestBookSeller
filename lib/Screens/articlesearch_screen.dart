import 'package:best_book_seller/Globals/colors.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:provider/provider.dart';
import '../Providers/auth_Provider.dart';

class ArticleSearchScreen extends StatefulWidget {
  const ArticleSearchScreen({super.key});

  @override
  State<ArticleSearchScreen> createState() => _ArticleSearchScreenState();
}

class _ArticleSearchScreenState extends State<ArticleSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: blackColor,
      body: Consumer<AuthProvider>(
        builder: (context, value, child) {
          return value.isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : value.fetchArticleData!.isEmpty
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/serach.png"),
                        const SizedBox(height: 5,),
                        const Text("No Record Found",
                        style: TextStyle(color: Colors.white54),
                        ),
                      ],
                    ),
                  )
                  : LazyLoadScrollView(
                      scrollOffset: 10,
                      onEndOfPage: () {
                        value.ApiCallGetArticleSearchForMoreData( context,
                            startDate: value.getStartDateToFilter,
                            endDate: value.getEndDateToFilter,
                            sort: value.getSortValue.toString(),
                            facetFields: value.dropdownvalue.toString());
                      },
                      child: ListView.builder(
                        itemCount: value.fetchArticleData!.length,
                        itemBuilder: ((context, index) {
                          return Card(
                            color: blackColorbutton,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        height: 50.0,
                                        width: 50.0,
                                        color: Colors.red,
                                         child:Image.asset("assets/images/book_image2.jpg",
                                    fit: BoxFit.cover,
                                    )
                                      ),
                                      const SizedBox(width: 8.0),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.fetchArticleData![index]
                                                  .sectionName
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                                value.fetchArticleData![index]
                                                    .newsDesk
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white60,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                )),
                                            Text(
                                                value.fetchArticleData![index]
                                                    .pubDate
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white60,
                                                  fontWeight: FontWeight.normal,
                                                  fontSize: 12,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    );
        },
      ),
    );
  }
}
