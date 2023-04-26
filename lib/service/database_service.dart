import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});

  //reference for collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  // final CollectionReference groupCollection =
  //     FirebaseFirestore.instance.collection("groups");

  //saving the userdata
  Future savingUserData(String username, String password) async {
    return await userCollection.doc(uid).set({
      "username": username,
      "password": password,
    });
  }

  //getting user data
  Future gettingData(String username) async {
    QuerySnapshot snapshot =
        await userCollection.where("username", isEqualTo: username).get();
    return snapshot;
  }
}
