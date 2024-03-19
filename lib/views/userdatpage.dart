import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class userdp extends StatelessWidget {
  const userdp({super.key, required this.uid});
  final String? uid;

  @override
  Widget build(BuildContext context) {
    List data = [];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          "Users",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection("Users").get(),
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            if (!snapshot.hasData || snapshot.data == null) {
              return Text(
                "No data available",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ); // Or any other appropriate widget
            }
            data = snapshot.data!.docs.reversed.toList(growable: true);

            return SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemCount: data.reversed.length,
                    itemBuilder: (context, index) {
                      var user = FirebaseAuth.instance.currentUser;
                      return user?.email?.compareTo(data[index]["Email"]) == 0
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ListTile(
                                  tileColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  title: Text(
                                    data[index]["Name"],
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: const Text(
                                    "Currently logged in",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )))
                          : Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: ListTile(
                                tileColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                title: Text(
                                  "Name : ${data[index]["Name"]}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email : ${data[index]["Email"]}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Age : ${data[index]["Age"]}",
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }));
          }),
    );
  }
}
