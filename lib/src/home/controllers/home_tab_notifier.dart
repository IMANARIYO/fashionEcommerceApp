import 'package:ecom_t/common/utils/enums.dart';
import 'package:flutter/material.dart';

class HomeTabNotifier with ChangeNotifier {
  QueryType queryType = QueryType.all;
  String _index = 'All';
  String get index => _index;

  void setIndex(String index) {
    _index = index;

    // Map the string index to the appropriate QueryType
    switch (index.toLowerCase()) {
      case 'all':
        setQueryType(QueryType.all);
        break;
      case 'popular':
        setQueryType(QueryType.popular);
        break;
      case 'unisex':
        setQueryType(QueryType.unisex);
        break;
      case 'men':
        setQueryType(QueryType.men);
        break;
      case 'women':
        setQueryType(QueryType.women);
        break;
      case 'kids':
        setQueryType(QueryType.kids);
        break;
      default:
        setQueryType(QueryType.all); // Default case for unexpected values
    }

    notifyListeners();
  }

  void setQueryType(QueryType q) {
    queryType = q;

  }
}
