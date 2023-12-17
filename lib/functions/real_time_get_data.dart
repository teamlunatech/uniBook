// real_time_data.dart dosyası
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/classes/Bildirim.dart';

class RealTimeData {
  static Future<void> realTimeGetData(List<Bildirim> allNots, Function(List<Bildirim>) onDataReceived) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var _notStream = await firestore
        .collection('books')
        .orderBy('price', descending: true)
        .snapshots();

    _notStream.listen((event) async {
      List<Bildirim> bildirimListesi = [];
      for (var element in event.docs) {
        var data = element.data() as Map<String, dynamic>;
        var bookName = data['bookName'] as String;
        var price = data['price'];
        var uniName = data['uniName'];
        var uid = data['user_uid']; // UID'yi al
        var userName = await getUserName(uid); // UID'yi kullanarak kullanıcı adını al
        Bildirim b = Bildirim(price, bookName, uniName, userName);
        //Bildirim b = Bildirim(price, bookName, uniName);
        bildirimListesi.add(b);
      }

      onDataReceived(bildirimListesi);
    });
  }
  static Future<String> getUserName(String userUID) async {
  try {
    DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('Users').doc(userUID).get();
    if (userSnapshot.exists) {
      String name = userSnapshot['name']; 
      debugPrint(name);
      return name;

    } else {
      return "Kullanıcı bulunamadı.";
    }
  } catch (e) {
    print("Hata: $e");
    throw Exception('Kullanıcı adı alınamadı.');
  }
}  
static Future<List<Bildirim>> searchBooks(String query) async {
  List<Bildirim> searchResults =[];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final result = await firestore
        .collection('books')
        .where('bookName', isEqualTo: query)
        .get();

    List<Future<Bildirim>> futureResults = result.docs.map((element) async {
      debugPrint('Searching for: $query');
      var data = element.data() as Map<String, dynamic>;
      var bookName = data['bookName'] as String;
      var price = data['price'];
      var uniName = data['uniName'];
      var uid = data['user_uid'];
    var userName = await getUserName(uid); // null kontrolü ekleyerek
      Bildirim b = Bildirim(price, bookName, uniName, userName);
      return b;
    }).toList();

    searchResults = await Future.wait(futureResults);
    return searchResults;
  }
  
}
