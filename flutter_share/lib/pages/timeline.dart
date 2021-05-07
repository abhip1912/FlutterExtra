import 'package:flutter/material.dart';
import 'package:flutter_share/widgets/header.dart';
import 'package:flutter_share/widgets/progress.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final usersCollectionRef = FirebaseFirestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  void initState() {
    getUsers();
    // getUserById();
    super.initState();
  }

  getUsers() async {
    final querySnapshot = await usersCollectionRef
        .orderBy('postCount', descending: true)
        .limit(5)
        .get();
    querySnapshot.docs.forEach(
        (docSnapshot) => print("${docSnapshot.id} => ${docSnapshot.data()}"));
  }

  getUserById() async {
    final docRef = usersCollectionRef.doc('UIKlxFmxr0j2Dvjzh7mE');
    final docSnapshot = await docRef.get();
    print(docSnapshot.data());
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context),
      body: linearProgress(context),
    );
  }
}
