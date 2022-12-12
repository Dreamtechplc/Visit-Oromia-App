import 'package:cloud_firestore/cloud_firestore.dart';

class StateModel {
  String name;
  String thumbnailUrl;
  String timestamp;

  StateModel({this.name, this.thumbnailUrl, this.timestamp});

  factory StateModel.fromFirestore(Map<String, dynamic> d) {
    return StateModel(
      name: d['name'],
      thumbnailUrl: d['thumbnail'],
      timestamp: d['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'thumbnail': thumbnailUrl, 'timestamp': timestamp};
  }
}
