import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'annotation.g.dart';

@HiveType(typeId: 0)
class Annotation {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String text;
  @HiveField(2)
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
