// import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import './amazon_api_class.dart';

class ConfigLoader {
  Future<AmazonTest> logConfig() async {
    print("This print is displayed when I enter the function");
    final cfg = await rootBundle.loadString("assets/files/api.json");
    Map<String, dynamic> jsonResult = json.decode(cfg);
    print(jsonResult);
    return AmazonTest.fromJson(jsonResult);
  }
}
