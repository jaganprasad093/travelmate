import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegistrationScreenController with ChangeNotifier {
  bool isLoading = false;
  var collectionReference = FirebaseFirestore.instance.collection("users");
  // write fn to register new user
  Future<bool> register({
    required BuildContext context,
    required String email,
    required String password,
    required String username,
    required String dob,
    required String gender,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user?.uid != null) {
        collectionReference
            .doc(credential.user!.uid)
            .set({"username": username, "dob": dob, "gender": gender});

        isLoading = false;
        notifyListeners();
        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("The password provided is too weak.")));
        isLoading = false;
        notifyListeners();
        return false;
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("The account already exists for that email.")));
        // print('The account already exists for that email.');
        isLoading = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      print(e);
      isLoading = false;
      notifyListeners();
      return false;
    }
    isLoading = false;
    notifyListeners();
    return false;
  }
}
