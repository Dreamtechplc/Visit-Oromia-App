import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_hour/models/place.dart';

class SearchBloc with ChangeNotifier {
  SearchBloc() {
    getRecentSearchList();
  }

  List<String> _recentSearchData = [];
  List<String> get recentSearchData => _recentSearchData;

  String _searchText = '';
  String get searchText => _searchText;

  bool _searchStarted = false;
  bool get searchStarted => _searchStarted;

  TextEditingController _textFieldCtrl = TextEditingController();
  TextEditingController get textfieldCtrl => _textFieldCtrl;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getRecentSearchList() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _recentSearchData = sp.getStringList('recent_search_data') ?? [];
    notifyListeners();
  }

  Future addToSearchList(String value) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _recentSearchData.add(value);
    await sp.setStringList('recent_search_data', _recentSearchData);
    notifyListeners();
  }

  Future removeFromSearchList(String value) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _recentSearchData.remove(value);
    await sp.setStringList('recent_search_data', _recentSearchData);
    notifyListeners();
  }

  Future<List> getData() async {
    List<Place> data = [];
    QuerySnapshot rawData = await firestore
        .collection('places')
        .orderBy('timestamp', descending: true)
        .get();

    List<DocumentSnapshot> _snap = [];

    rawData.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> datas = document.data() as Map<String, dynamic>;
      if(datas['place name'].toLowerCase().contains(_searchText.toLowerCase()) || datas['location'].toLowerCase().contains(_searchText.toLowerCase())){
        _snap.add(document);
      }
    }).toList();



    _snap.map((DocumentSnapshot document) {
      Map<String, dynamic> datas = document.data() as Map<String, dynamic>;
      data.add(Place.fromFirestore(datas));
    }).toList();



    return data;
  }

  setSearchText(value) {
    _textFieldCtrl.text = value;
    _searchText = value;
    _searchStarted = true;
    notifyListeners();
  }

  saerchInitialize() {
    _textFieldCtrl.clear();
    _searchStarted = false;
    notifyListeners();
  }
}
