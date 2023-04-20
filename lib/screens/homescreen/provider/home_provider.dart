import 'package:flutter/material.dart';
import 'package:newsapi/screens/homescreen/model/home_model.dart';
import 'package:newsapi/utils/api_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeProvider extends ChangeNotifier
{
  HomeModel? homeModel;
  // bool anim=false;
  String country='us';
  String buisness='sport';
  String dropdownvalue = 'United State';
  String dropdownvalue2 = 'education';

  void Dropdownvalue(String value)
  {
    dropdownvalue=value;
    notifyListeners();
  }
  void Dropdownvalue2(String value)
  {
    dropdownvalue2=value;
    notifyListeners();
  }

  void ChangeCountry(String name)
  {
    country=name;
    notifyListeners();
  }
  void ChangeBusiness(String name)
  {
    buisness=name;
    notifyListeners();
  }
  // void animChange()
  // {
  //   anim=!anim;
  //   notifyListeners();
  // }
   Future<HomeModel?> newsJsonParsing({String? contry,String? business})
   async {
     ApiHelper apiHelper=ApiHelper();
     homeModel =await apiHelper.newsApiHelper(contry:contry,business: business);
     return homeModel;
   }
   int i=0;
   void ChangeIndex(int index)
   {
     i=index;
     notifyListeners();
   }
   WebViewController? webViewController;
   void initweb()
   {
     webViewController=WebViewController();
     webViewController!.loadRequest(Uri.parse('${homeModel!.articles![i].url}'));
     notifyListeners();
   }
   int webindex=0;
   void webIndex(int index)
   {
     webindex=index;
     notifyListeners();
   }
}