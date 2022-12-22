import 'package:best_book_seller/Providers/auth_Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Globals/colors.dart';

class BestSellerBook extends StatefulWidget {
  const BestSellerBook({super.key});

  @override
  State<BestSellerBook> createState() => _BestSellerBookState();
}

class _BestSellerBookState extends State<BestSellerBook> {
  AuthProvider provider = AuthProvider();

  @override
  void initState() {
    provider.ApiCallGetList(context ,provider.getDateToFilter.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Consumer<AuthProvider>(
      builder: ((context, value, child) {
        return value.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              ))
            : value.fetchData!.isNotEmpty
                ? ListView.builder(
                    itemCount: value.fetchData!.length,
                    itemBuilder: ((context, index) {
                      return Card(
                        color: blackColorbutton,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    color: Colors.red,
                                    height: 50.0,
                                    width: 50.0,
                                    child:Image.asset("assets/images/book_image1.jpg",
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
                                          value.fetchData![index]
                                              .bookDetails![0].title
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                            value.fetchData![index]
                                                .bookDetails![0].description
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
                  )
                :  Center(
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
                  );
      }),
    ));
  }
}
