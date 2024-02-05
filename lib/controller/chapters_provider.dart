import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../model/all_chapters_model.dart';

class ChaptersProvider extends ChangeNotifier {

  List<AllchaptersModel> chlist = [];
  int? toggleIndex;
  bool showMore = false;

  void getdata() async {
    var filedata = await rootBundle.loadString("lib/utils/jsons/all_chapters.json");
    jsonDecode(filedata);
    chlist = allchaptersModelFromJson(filedata);
    notifyListeners();
  }

  void setToogleIndex(int? val) {
      toggleIndex = val;
      notifyListeners();
  }


  void showmore(){
    showMore = true;
    notifyListeners();
  }

  void showless(){
    showMore = false;
    notifyListeners();
  }
}