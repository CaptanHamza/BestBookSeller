// ignore: file_names
import 'dart:convert';
import 'dart:developer';
import 'package:best_book_seller/CommonWidget/utils.dart';
import 'package:best_book_seller/Models/article_search_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../Models/best_seller_book_model.dart';

class AuthProvider extends ChangeNotifier {
  // Dowp Down Value
  var items = [
    '',
    'day_of_week',
    'document_type',
    'ingredients',
    'news_desk',
    'pub_month',
    'pub_year',
    'section_name',
    'source',
    'subsection_name',
    'type_of_material'
  ];

  String _dropdownvalue = "";
  String get dropdownvalue => _dropdownvalue;

  String? _getDateToFilter;
  String? get getDateToFilter => _getDateToFilter.toString();

  String? _getStartDateToFilter;
  String? get getStartDateToFilter => _getStartDateToFilter.toString();

  String? _getEndDateToFilter;
  String? get getEndDateToFilter => _getEndDateToFilter.toString();

  String? _getSortValue = "";
  String? get getSortValue => _getSortValue;

  int? _radioValueforSort = 0;
  int? get radioValueforSort => _radioValueforSort;

  List<Results>? _fetchData = [];
  List<Results>? get fetchData => _fetchData;

  List<Docs>? _fetchArticleData = [];
  List<Docs>? get fetchArticleData => _fetchArticleData;

  bool? _isLoading = false;
  int _numberOfPage = 1;

  int get numberOfPage => _numberOfPage;

  bool? get isLoading => _isLoading;

// update Sort Radio button Info
  setRadioValueUpdate(int value) {
    _radioValueforSort = value;
    if (value == 1) {
      _getSortValue = "newest";
    } else if (value == 2) {
      _getSortValue = "oldest";
    } else if (value == 3) {
      _getSortValue = "relevance";
    } else {
      _getSortValue = "";
    }
    notifyListeners();
  }

// update FacetFields  Dropdown Value
  setDropdownValueUpdate(BuildContext context, String value) {
    _dropdownvalue = value;
    notifyListeners();
  }

// Provider Constuctor
  AuthProvider() {
    initalDateTime();
  }

// Set Defalut Value when Page Load
  initalDateTime() {
    DateTime? getCurrentDateTime = DateTime.now();
    _getDateToFilter =
        DateFormat("yyyy-MM-dd").format(getCurrentDateTime).toString();
    _getStartDateToFilter =
        DateFormat("yyyy-MM-dd").format(getCurrentDateTime).toString();
    _getEndDateToFilter =
        DateFormat("yyyy-MM-dd").format(getCurrentDateTime).toString();
    notifyListeners();
  }

// Date Picker Dailog and Set Value
  Future<void> showDatePickerDailog(BuildContext context,
      {String? startDate}) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      if (startDate == "startDate") {
        _getStartDateToFilter =
            DateFormat("yyyy-MM-dd").format(picked).toString();
        notifyListeners();
      } else if (startDate == "endDate") {
        String checkDate = DateFormat("yyyy-MM-dd").format(picked).toString();

        DateTime dat1 = DateTime.parse(checkDate);
        DateTime dat2 = DateTime.parse(_getStartDateToFilter!);

        if (dat2.day < dat1.day) {
          _getEndDateToFilter =
              DateFormat("yyyy-MM-dd").format(picked).toString();
          notifyListeners();
        } else {
          alertDialog(context, "End Date less than Start Date");
        }
      } else if (startDate == "filterDate") {
        _getDateToFilter = DateFormat("yyyy-MM-dd").format(picked).toString();
        notifyListeners();
      }
    }
  }

  // Update Page Number in Lasy Loading
  setPageNumberUpdate(int page) {
    _numberOfPage = page;
    notifyListeners();
  }

// Update Loading Value
  setLoading(bool? load) {
    _isLoading = load;
    notifyListeners();
  }

// Update Book List
  setfetchBookListEmpty() {
    _fetchData = [];
    notifyListeners();
  }

// Update Article List
  setarticlefetchListEmpty() {
    _fetchArticleData = [];
    notifyListeners();
  }

//Api Call For Get Book List
  // ignore: non_constant_identifier_names
  Future<void>? ApiCallGetList(BuildContext context, String currentDate) async {
    setLoading(true);
    if (!await InternetConnectionChecker().hasConnection) {
      Fluttertoast.showToast(
        msg: "Internet Connection Error",
        gravity: ToastGravity.BOTTOM,
      );
      setLoading(false);
    } else {
      try {
        var response = await http.get(Uri.parse(
            "https://api.nytimes.com/svc/books/v3/lists.json?api-key=AfvoHdXXLYAvMnKUiq137EtEXGTlUhrJ&list=hardcover-fiction&bestsellers-date=$currentDate"));

        if (response.statusCode == 200) {
          setLoading(false);
          Map<String, dynamic> responseData = jsonDecode(response.body);
          BestSellerBookModel bestSellerBookModel =
              BestSellerBookModel.fromJson(responseData);

          setfetchBookListEmpty();

          log(response.body.toString());

          if (bestSellerBookModel.results!.isNotEmpty) {
            for (var item in bestSellerBookModel.results!) {
              _fetchData!.add(item);
              notifyListeners();
            }
          } else {
            setLoading(false);
            setfetchBookListEmpty();
          }
          setLoading(false);
        } else if (response.statusCode == 400) {
          setLoading(false);
          setfetchBookListEmpty();
          Map<String, dynamic> responseData = jsonDecode(response.body);
          // ignore: use_build_context_synchronously
          alertDialog(context, responseData['errors'][0]);
        } else if (response.statusCode == 401) {
          setLoading(false);
          setfetchBookListEmpty();
          Map<String, dynamic> responseData = jsonDecode(response.body);
          // ignore: use_build_context_synchronously
          alertDialog(context, responseData['fault']['faultstring']);
        }
      } catch (e) {
        setfetchBookListEmpty();
        setLoading(false);
        alertDialog(context, e.toString());
      }
    }
  }

// Api Call for Article List
  // ignore: non_constant_identifier_names
  Future<void> ApiCallGetArticleSearch(BuildContext context,
      {String? startDate,
      String? endDate,
      String? facetFields,
      String? sort}) async {
    setLoading(true);

    if (!await InternetConnectionChecker().hasConnection) {
      Fluttertoast.showToast(
        msg: "Internet Connection Error",
        gravity: ToastGravity.BOTTOM,
      );
      setLoading(false);
    } else {
      try {
        var response = await http.get(Uri.parse(
            "https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=AfvoHdXXLYAvMnKUiq137EtEXGTlUhrJ&begin_date=$startDate&end_date=$endDate&page=$_numberOfPage&facet_filter=true&facet_fields=$facetFields&sort=$sort"));

        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = jsonDecode(response.body);
          ArticleSearchModel articleSearchModel =
              ArticleSearchModel.fromJson(responseData);

          // log(response.body.toString());
          if (articleSearchModel.response!.docs!.isNotEmpty) {
            setPageNumberUpdate(_numberOfPage + 1);

            for (var item in articleSearchModel.response!.docs!) {
              _fetchArticleData!.add(item);
              notifyListeners();
            }
          } else {
            setLoading(false);
            setarticlefetchListEmpty();
          }
          setLoading(false);
        } else if (response.statusCode == 400) {
          setLoading(false);
          setarticlefetchListEmpty();
          setPageNumberUpdate(1);
          Map<String, dynamic> responseData = jsonDecode(response.body);
          // ignore: use_build_context_synchronously
          alertDialog(context, responseData['errors'][0]);
        } else if (response.statusCode == 401) {
          setLoading(false);
          setfetchBookListEmpty();
          Map<String, dynamic> responseData = jsonDecode(response.body);
          // ignore: use_build_context_synchronously
          alertDialog(context, responseData['fault']['faultstring']);
        }
      } catch (e) {
        setLoading(false);
        setPageNumberUpdate(1);
        setarticlefetchListEmpty();
        alertDialog(context, e.toString());
      }
    }
  }

// Api Call for Article More Data Load
  // ignore: non_constant_identifier_names
  Future<void> ApiCallGetArticleSearchForMoreData(BuildContext context,
      {String? startDate,
      String? endDate,
      String? facetFields,
      String? sort}) async {
    if (!await InternetConnectionChecker().hasConnection) {
      Fluttertoast.showToast(
        msg: "Internet Connection Error",
        gravity: ToastGravity.BOTTOM,
      );
    } else {
      try {
        var response = await http.get(Uri.parse(
            "https://api.nytimes.com/svc/search/v2/articlesearch.json?api-key=AfvoHdXXLYAvMnKUiq137EtEXGTlUhrJ&begin_date=$startDate&end_date=$endDate&page=$_numberOfPage&facet_filter=true&facet_fields=$facetFields&sort=$sort"));

        if (response.statusCode == 200) {
          Map<String, dynamic> responseData = jsonDecode(response.body);
          ArticleSearchModel articleSearchModel =
              ArticleSearchModel.fromJson(responseData);

          // log(response.body.toString());
          if (articleSearchModel.response!.docs!.isNotEmpty) {
            setPageNumberUpdate(_numberOfPage + 1);

            for (var item in articleSearchModel.response!.docs!) {
              _fetchArticleData!.add(item);
              notifyListeners();
            }
          }
        } else if (response.statusCode == 400) {
          Map<String, dynamic> responseData = jsonDecode(response.body);
          // ignore: use_build_context_synchronously
          alertDialog(context, responseData['errors'][0]);
        } else if (response.statusCode == 401) {
          Map<String, dynamic> responseData = jsonDecode(response.body);
          // ignore: use_build_context_synchronously
          alertDialog(context, responseData['fault']['faultstring']);
        }
      } catch (e) {
        alertDialog(context, e.toString());
      }
    }
  }
}
