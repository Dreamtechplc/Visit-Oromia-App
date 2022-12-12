import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_hour/models/place.dart';

class PopularPlacesBloc extends ChangeNotifier {
  List<Place> _data = [];
  List<Place> get data => _data;

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getData() async {
    QuerySnapshot rawData;
    rawData = await firestore
        .collection('places')
        .orderBy('loves', descending: true)
        .limit(10)
        .get();

    List<DocumentSnapshot> _snap = [];
    rawData.docs.map((DocumentSnapshot document) {
      Map<String, dynamic> datas = document.data() as Map<String, dynamic>;
      _snap.add(document);
      _data.add(Place.fromFirestore(datas));
    }).toList();
    notifyListeners();
  }

  onRefresh(mounted) {
    _data.clear();
    getData();
    notifyListeners();
  }
}
