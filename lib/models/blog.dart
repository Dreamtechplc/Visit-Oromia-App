import 'package:cloud_firestore/cloud_firestore.dart';

class Blog {
  String title;
  String description;
  String thumbnailImagelUrl;
  int loves;
  String sourceUrl;
  String date;
  String timestamp;

  Blog(
      {this.title,
      this.description,
      this.thumbnailImagelUrl,
      this.loves,
      this.sourceUrl,
      this.date,
      this.timestamp});

  factory Blog.fromFirestore(Map<String, dynamic> snapshot) {
    return Blog(
      title: snapshot['title'],
      description: snapshot['description'],
      thumbnailImagelUrl: snapshot['image url'],
      loves: snapshot['loves'],
      sourceUrl: snapshot['source'],
      date: snapshot['date'],
      timestamp: snapshot['timestamp'],
    );
  }
}
