// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import './amazon_api_class.dart';
import './amazon_one_product_review.dart';

class ConfigLoader {
  Future<AmazonTest> logConfig() async {
    print("This print is displayed when I enter the function");
    final cfg = await rootBundle.loadString("assets/files/api.json");
    Map<String, dynamic> jsonResult = json.decode(cfg);
    print(jsonResult);
    return AmazonTest.fromJson(jsonResult);
  }

  Future<SingleProdctReview> loadReview() async {
    print("This print is displayed when I enter review function");
    final cfg =
        await rootBundle.loadString('assets/files/api_single_review.json');
    Map<String, dynamic> jsonResult = json.decode(cfg);
    print(jsonResult);
    return SingleProdctReview.fromJson(jsonResult);
  }
}
