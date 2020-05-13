import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diarybootcamp/models/annotation.dart';

abstract class AnnotationRepository {
  Future<List<Annotation>> getAllNotes();
  Stream<List<Annotation>> getAllNotesStream();
  Future<void> addAnnotation(Annotation annotation);
  Future<void> deleteAnnotation(Annotation annotation);
}

class AnnotationRepositoryImpl extends AnnotationRepository {
  static final _firestore = Firestore.instance;
  static final _collectionNotes = _firestore.collection('notes');

  Future<List<Annotation>> getAllNotes() async {
    final query = await _collectionNotes.getDocuments();
    return query.documents
        .map((doc) => Annotation.fromFirebaseDoc(doc))
        .toList();
  }

  @override
  Future<void> addAnnotation(Annotation annotation) async {
    await _collectionNotes.document(annotation.id).setData(annotation.toMap());
  }

  @override
  Future<void> deleteAnnotation(Annotation annotation) async {
    await _collectionNotes.document(annotation.id).delete();
  }

  @override
  Stream<List<Annotation>> getAllNotesStream() {
    return _collectionNotes.snapshots().map((snap) =>
        snap.documents.map((doc) => Annotation.fromFirebaseDoc(doc)).toList());
  }
}
