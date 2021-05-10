import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection('rest')
        .where('serch',
        arrayContains: searchField.substring(0, 1).toUpperCase()
        //isEqualTo: searchField.substring(0, 1).toUpperCase()

    )
        .get().toString();
  }
}
