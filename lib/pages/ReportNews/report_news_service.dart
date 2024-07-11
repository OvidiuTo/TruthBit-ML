import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:truth_bit/pages/TopNews/top_news_model.dart';

class ReportNewsService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  Future<void> reportArticle(
    Article article,
    String reason,
    String reportType,
  ) async {
    Map<String, dynamic> reportData = {
      'article': article.toMap(),
      'reason': reason,
      'reportType': reportType,
      'reporterId': firebaseAuth.currentUser!.uid,
    };
    await firebaseFirestore.collection('reported_articles').add(reportData);
  }
}
