import 'package:cloud_firestore/cloud_firestore.dart';

class Annotation {
  final String id;
  final String text;
  final DateTime dateTime;

  Annotation(this.id, this.text, this.dateTime);

  factory Annotation.fromFirebaseDoc(DocumentSnapshot documentSnapshot) {
    final map = documentSnapshot.data;
    final id = map['id'];
    final text = map['text'];
    final dateTime = (map['date'] as Timestamp)?.toDate();
    return Annotation(id, text, dateTime);
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['id'] = this.id;
    map['text'] = this.text;
    map['date'] = this.dateTime;
    return map;
  }
}
