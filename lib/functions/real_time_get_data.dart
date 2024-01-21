// real_time_data.dart dosyası
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_book/classes/Bildirim.dart';

class RealTimeData {
  static StreamSubscription<QuerySnapshot>? _notStreamSubscription;

  static Future<void> realTimeGetData(
      List<Bildirim> allNots, Function(List<Bildirim>) onDataReceived) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var _notStream = await firestore
        .collection('books')
        .orderBy('price', descending: true)
        .snapshots();

    _notStreamSubscription = _notStream.listen((event) async {
      List<Bildirim> bildirimListesi = [];
      for (var element in event.docs) {
        var data = element.data() as Map<String, dynamic>;
        var bookName = data['bookName'] as String;
        var price = data['price'];
        var uniName = data['uniName'];
        var uid = data['user_uid']; // UID'yi al
        var userName =
            await getUserName(uid); // UID'yi kullanarak kullanıcı adını al
        var imageUrl = data['book-image'];
        Bildirim b =
            Bildirim(price, bookName, uniName, userName, uid, imageUrl);
        //Bildirim b = Bildirim(price, bookName, uniName);
        bildirimListesi.add(b);
      }

      onDataReceived(bildirimListesi);
    });
  }

  static void cancelRealTimeSubscription() {
    _notStreamSubscription?.cancel();
  }

  static Future<String> getUserName(String userUID) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(userUID)
          .get();
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
    List<Bildirim> searchResults = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final result = await firestore
        .collection('books')
        .where('bookName', isGreaterThanOrEqualTo: query.toLowerCase())
        .where('bookName', isLessThan: query.toLowerCase() + 'z')
        .get();

    List<Future<Bildirim>> futureResults = result.docs.map((element) async {
      debugPrint('Searching for: $query');
      var data = element.data() as Map<String, dynamic>;
      var bookName = data['bookName'] as String;
      var price = data['price'];
      var uniName = data['uniName'];
      var uid = data['user_uid'];
      var userName = await getUserName(uid); // null kontrolü ekleyerek
      var imageUrl = data['book-image'];
      Bildirim b = Bildirim(price, bookName, uniName, userName, uid, imageUrl);
      return b;
    }).toList();

    searchResults = await Future.wait(futureResults);
    return searchResults;
  }

  static Future<List<Bildirim>> getFavoriteBooks() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc =
            await firestore.collection('Users').doc(user.uid).get();

        if (userDoc.exists) {
          List<String> favoriteBookNames = List<String>.from(
              (userDoc.data() as Map<String, dynamic>)['favorites'] ?? []);

          List<Bildirim> favoriteBooks = [];

          for (String bookName in favoriteBookNames) {
            // Fetch book details from the 'books' collection
            final result = await firestore
                .collection('books')
                .where('bookName', isEqualTo: bookName)
                .get();

            List<Future<Bildirim>> futureResults =
                result.docs.map((element) async {
              var data = element.data() as Map<String, dynamic>;
              var bookName = data['bookName'] as String;
              var price = data['price'];
              var uniName = data['uniName'];
              var uid = data['user_uid'];
              var userName = await getUserName(uid); // null kontrolü ekleyerek
              var imageUrl = data['book-image'];
              Bildirim b =
                  Bildirim(price, bookName, uniName, userName, uid, imageUrl);
              return b;
            }).toList();

            List<Bildirim> booksForName = await Future.wait(futureResults);
            favoriteBooks.addAll(booksForName);
          }

          return favoriteBooks;
        }
      }
      return [];
    } catch (e) {
      print('Hata: $e');
      return [];
    }
  }

  Future<void> addFavoriteBook(String bookId) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      final User? user = FirebaseAuth.instance.currentUser;
      debugPrint(user?.uid);
      debugPrint(bookId);
      await firestore.collection('Users').doc(user?.uid).update({
        'favorites': FieldValue.arrayUnion([bookId]),
      });
    } catch (e) {
      print('Hata: $e');
    }
  }

  static Future<List<Bildirim>> getIlanlarim() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<Bildirim> ilanlarim = [];
    String currentUserID;

    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      currentUserID = user.uid;
    } else {
      throw Exception("Kullanıcı oturum açmamış");
    }

    try {
      QuerySnapshot ilanlarSnapshot = await firestore.collection('books').get();

      for (QueryDocumentSnapshot ilanSnapshot in ilanlarSnapshot.docs) {
        var data = ilanSnapshot.data() as Map<String, dynamic>;
        var userUID = data['user_uid'] as String;

        if (userUID == currentUserID) {
          var bookName = data['bookName'] as String;
          var price = data['price'];
          var uniName = data['uniName'];
          var userName = await getUserName(userUID);
          var imageUrl = data['book-image'];
          Bildirim ilan =
              Bildirim(price, bookName, uniName, userName, userUID, imageUrl);
          ilanlarim.add(ilan);
        }
      }

      // for (var ilan in ilanlarim) {
      //   print("Kitap Adı: ${ilan.BookName}");
      //   print("Fiyat: ${ilan.price}");
      //   print("Üniversite: ${ilan.uniName}");
      //   print("Satıcı: ${ilan.userName}");
      //   print("-------------");
      // }

      return ilanlarim;
    } catch (e) {
      print("Hata: $e");
      throw Exception('İlanlar alınamadı.');
    }
  }

  static Future<void> deleteBooksByTitle(String bookName) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // Belirtilen kitap ismine sahip olan tüm kayıtları getir
      QuerySnapshot result = await firestore
          .collection('books')
          .where('bookName', isEqualTo: bookName)
          .get();

      // Her bir kaydı sil
      for (QueryDocumentSnapshot document in result.docs) {
        await document.reference.delete();
        print('Kitap silindi: ${document.data()}');
      }
    } catch (e) {
      print('Hata: $e');
      throw Exception('Kitaplar silinemedi.');
    }
  }
}
