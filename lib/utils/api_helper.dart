import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapi/screens/homescreen/model/home_model.dart';

class ApiHelper {
  HomeModel? homeModel;
  Future<HomeModel?> newsApiHelper({String? contry,String? business}) async {
    String? link =
        "https://newsapi.org/v2/top-headlines?country=$contry&category=$business&apiKey=a3ce7db7ac36469b84dbc6d95dff4952";
    Uri uri=Uri.parse(link);
    var response = await http.get(uri);
    var json= jsonDecode(response.body);
    homeModel=HomeModel().newsFromJson(json);
    return homeModel;
  }
}
