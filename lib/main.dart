import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/views/authp.dart';
import 'package:untitled2/views/fbase.dart';
import 'package:untitled2/views/userdatpage.dart';
import 'package:untitled2/views/utils.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/controllers/countroller.dart';
import 'package:untitled2/controllers/img_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => countroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => imgroller(),
        )
      ],
      child: MaterialApp(
        scaffoldMessengerKey: messengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          useMaterial3: true,
        ),
        home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var id = FirebaseAuth.instance.currentUser?.uid;
                return Scaffold(
                  backgroundColor: Colors.black,
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 300),
                          child: Text(
                            "Logged In & Saved",
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white)),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => userdp(
                                            uid: id,
                                          ),
                                        ));
                                      },
                                      child: const Text(
                                        "User List",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 23),
                                      )),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: TextButton(
                                      style: ButtonStyle(
                                          shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white)),
                                      onPressed: () {
                                        FirebaseAuth.instance.signOut();
                                      },
                                      child: const Text(
                                        "Logout",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 23),
                                      )),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return const AuthPage();
              }
            }),
      ),
    );
  }
}
