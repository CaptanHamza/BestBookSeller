
import 'package:best_book_seller/Globals/colors.dart';
import 'package:best_book_seller/Providers/auth_Provider.dart';
import 'package:best_book_seller/Screens/articlesearch_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'best_seller_book_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? _controller;
  AuthProvider provider = AuthProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBottomSheetDailogforArticale(context);
    });
    _controller = TabController(length: 2, vsync: this);
    _controller!.addListener(() {});
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          backgroundColor: blackColor,
          title: const Text(
            "Search",
            style: TextStyle(
              color: Colors.white54,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  _controller!.index == 0
                      ? showBottomSheetDailogforArticale(context)
                      : showBottomSheetDailog();
                },
                icon: const Icon(
                  Icons.filter_alt,
                  color: Colors.white54,
                )),
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            controller: _controller,
            tabs: const [
              Tab(
                child: Text("Articles"),
              ),
              Tab(
                child: Text("Books"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: const [
            ArticleSearchScreen(),
            BestSellerBook(),
          ],
        ),
      ),
    );
  }

// BootomSheet Book Search Screen
  void showBottomSheetDailog() {
    showModalBottomSheet(
        context: context,
        elevation: 10,
        backgroundColor: blackColor,
        // gives rounded corner to modal bottom screen
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (ctx) {
          return StatefulBuilder(builder: (BuildContext ctxctx,
              // ignore: non_constant_identifier_names
              StateSetter ModelsetState /*You can rename this!*/) {
            return Consumer<AuthProvider>(builder: ((ctxctx, value, child) {
              return SizedBox(
                height: 200,
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Filter",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: const Text(
                        "Dates",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.white24,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        value.showDatePickerDailog(ctxctx,
                            startDate: "filterDate");
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: blackColorbutton,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          value.getDateToFilter.toString(),
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: MaterialButton(
                                color: blackColorbutton,
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: MaterialButton(
                                color: yellowcolor,
                                child: const Text("Confirm"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  value.ApiCallGetList(ctxctx,
                                      value.getDateToFilter.toString());
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
          });
        });
  }

// BootomSheet Articles Screen
  void showBottomSheetDailogforArticale(BuildContext context) {
    showModalBottomSheet(
        context: context,
        elevation: 5,
        barrierColor: blackColorbutton.withOpacity(0.5),
        backgroundColor: blackColor,
        // gives rounded corner to modal bottom screen
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (ctx) {
          return StatefulBuilder(builder: (BuildContext ctxctx,
              // ignore: non_constant_identifier_names
              StateSetter ModelsetState /*You can rename this!*/) {
            return Consumer<AuthProvider>(builder: ((ctxctx, value, child) {
              return SizedBox(
                height: 370,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Filter",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: const Text(
                        "Dates",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.white24,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            value.showDatePickerDailog(ctxctx,
                                startDate: "startDate");
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: blackColorbutton,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              value.getStartDateToFilter.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        const Text("to"),
                        InkWell(
                          onTap: () {
                            value.showDatePickerDailog(ctxctx,
                                startDate: "endDate");
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: blackColorbutton,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              value.getEndDateToFilter.toString(),
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: const Text(
                        "Sort",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.white24,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio(
                                activeColor: yellowcolor,
                                value: 1,
                                groupValue: value.radioValueforSort!,
                                onChanged: (int? data) {
                                  value.setRadioValueUpdate(data!);
                                }),
                            const Text("newest"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: yellowcolor,
                                value: 2,
                                groupValue: value.radioValueforSort!,
                                onChanged: (int? data) {
                                  value.setRadioValueUpdate(data!);
                                }),
                            const Text("oldest"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                activeColor: yellowcolor,
                                value: 3,
                                groupValue: value.radioValueforSort!,
                                onChanged: (int? data) {
                                  value.setRadioValueUpdate(data!);
                                }),
                            const Text("relevance"),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 0),
                      child: const Text(
                        "FacetFields",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      indent: 10,
                      endIndent: 10,
                      color: Colors.white24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: blackColorbutton,
                            borderRadius: BorderRadius.circular(30)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: value.dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: value.items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              value.setDropdownValueUpdate(ctxctx, newValue!);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: MaterialButton(
                                color: blackColorbutton,
                                child: const Text("Cancel"),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: MaterialButton(
                                color: yellowcolor,
                                child: const Text("Confirm"),
                                onPressed: () {
                                  Navigator.pop(context);
                                  value.setPageNumberUpdate(1);
                                  value.setarticlefetchListEmpty();
                                  value.ApiCallGetArticleSearch(ctxctx,
                                      startDate: value.getStartDateToFilter,
                                      endDate: value.getEndDateToFilter,
                                      sort: value.getSortValue.toString(),
                                      facetFields:
                                          value.dropdownvalue.toString());
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
          });
        });
  }


}
