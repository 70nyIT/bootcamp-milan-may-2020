import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diarybootcamp/models/annotation.dart';
import 'package:hive/hive.dart';

abstract class AnnotationRepository {
  Future<List<Annotation>> getAllNotes();
  List<Annotation> getAllLocalNotes();
  Stream<List<Annotation>> getAllNotesStream();
  Future<void> addAnnotation(Annotation annotation);
  Future<void> deleteAnnotation(Annotation annotation);
}

class AnnotationRepositoryImpl extends AnnotationRepository {
  static final _firestore = Firestore.instance;
  static final _collectionNotes = _firestore.collection('notes');

  final Box<Annotation> boxAnnotations;

  AnnotationRepositoryImpl(this.boxAnnotations) {
    _firestore.settings(persistenceEnabled: false);
  }

  Future<List<Annotation>> getAllNotes() async {
    try {
      final query = await _collectionNotes.getDocuments();
      return query.documents
          .map((doc) => Annotation.fromFirebaseDoc(doc))
          .toList();
    } catch (ex) {
      return boxAnnotations.values.toList();
    }
  }

  @override
  Future<void> addAnnotation(Annotation annotation) async {
    await _collectionNotes.document(annotation.id).setData(annotation.toMap());
    boxAnnotations.put(annotation.id, annotation);
  }

  @override
  Future<void> deleteAnnotation(Annotation annotation) async {
    try {
      await boxAnnotations.delete(annotation.id);
      await _collectionNotes.document(annotation.id).delete();
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Stream<List<Annotation>> getAllNotesStream() {
    try {
      return _collectionNotes
          .where('date', isGreaterThan: DateTime.now())
          .snapshots()
          .map((snap) => snap.documents.map((doc) {
                final annotation = Annotation.fromFirebaseDoc(doc);
                boxAnnotations.put(annotation.id, annotation);
                return annotation;
              }).toList());
    } catch (ex) {
      print(ex);
      return Future.value(boxAnnotations.values.toList()).asStream();
    }
  }

  @override
  List<Annotation> getAllLocalNotes() {
    return boxAnnotations.values.toList();
  }
}
