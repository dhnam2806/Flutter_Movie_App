import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movieapp/data/profile_controler.dart';
import 'package:movieapp/models/user.dart';

import '../auth/auth_controller.dart';

class ProfilePages extends StatefulWidget {
  ProfilePages({super.key});

  @override
  State<ProfilePages> createState() => _ProfilePagesState();
}

class _ProfilePagesState extends State<ProfilePages> {
  final User user = FirebaseAuth.instance.currentUser!;

  final docRef = FirebaseFirestore.instance.collection("users").doc("userId");

  Future<void> _onPressed() async {
    await docRef.get().then((value) {
      print(value.data());
    });
  }

  @override
  Widget build(BuildContext context) {
    final controler = Get.put(ProfileControler());
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: controler.getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                UserModel userData = snapshot.data as UserModel;
                print(userData.name);
                print(userData.email);
                return Center(
                  child: Column(children: [
                    Text(userData.name,
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    Text(userData.email,
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    Text(userData.password,
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                  ]),
                );
              } else if (snapshot.hasError) {
                print(snapshot.error.toString());
                return Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                );
                // return const Center(
                //   child: Text("Error", style: TextStyle(fontSize: 30, color: Colors.red),),
                // );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
