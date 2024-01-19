import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'jsonmodel.dart';

class ThemeProvider with ChangeNotifier {
  bool theme = false;

  List<JsonModel> jsonList = [];


  Future loadJsonData(String key) async {
    jsonList.clear();

    var data = await rootBundle.loadString('asset/jsonfile.json');
    print(data);
    var parseData = jsonDecode(data);

    var response = parseData[key];

    response.forEach((element) {
      jsonList.add(JsonModel.fromJson(element));
      notifyListeners();
      // setState(() {
      //
      // });
    });
    print(parseData);

  }


  get getJsnModel{
    return jsonList;
  }





  get isDarkMethod {
    return theme;
  }

  set setDarkTheme(bool value) {
    theme = value;
    notifyListeners();
  }
}
