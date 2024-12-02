import 'package:flutter/material.dart';
import 'package:newsapp/api/api_services.dart';
import 'package:newsapp/screens/categories/models/sources_model.dart';

class SourcesProvider with ChangeNotifier {
  Sources? sources;
  bool waiting=false;
  String ?errorMessage;
  Future getSources(String categoryId) async{
    waiting =true;
    notifyListeners();
    try{
      sources=await ApiServices.getSources(categoryId);
    }
    catch(e){
      errorMessage=e.toString();
    }
    waiting=false;
    notifyListeners();
    
  }
}