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
    // getUsers();
    // getUserById();
    // createUser();
    // updateUser();
    deleteUser();
    super.initState();
  }

  // getUsers() async {
  //   final querySnapshot = await usersCollectionRef.get();
  // }

  createUser() {
    usersCollectionRef
        .doc('asdfasdf')
        .set({'username': 'heheBoi', 'postCount': 69, 'isAdmin': false});
  }

  updateUser() async {
    final docRef = await usersCollectionRef.doc('asdfasdf').get();
    if (docRef.exists) {
      docRef.reference
          .update({'username': 'YOYOBoi', 'postCount': 69, 'isAdmin': false});
    }
  }

  deleteUser() async {
    final docRef = await usersCollectionRef.doc('asdfasdf').get();
    if (docRef.exists) {
      docRef.reference.delete();
    }
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
      body: StreamBuilder(
        stream: usersCollectionRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return circularProgress(context);
          }
          final users = snapshot.data.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(users[index]['username']);
            },
          );
        },
      ),
    );
  }
}
