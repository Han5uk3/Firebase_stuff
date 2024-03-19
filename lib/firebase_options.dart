// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCpRwXP5XqwOueSYG45Pssa-kTUY0c1agQ',
    appId: '1:870210838239:web:d5ca869bf927af6a54936a',
    messagingSenderId: '870210838239',
    projectId: 'flutterbasics-a38c7',
    authDomain: 'flutterbasics-a38c7.firebaseapp.com',
    storageBucket: 'flutterbasics-a38c7.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4qbbp8Xrt44V8HpFAorm6TqM4MRXWgQg',
    appId: '1:870210838239:android:c182296c117d6ce054936a',
    messagingSenderId: '870210838239',
    projectId: 'flutterbasics-a38c7',
    storageBucket: 'flutterbasics-a38c7.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAVSYW9oOSb8WA6LpLZg6Az3GuhoEGxnSI',
    appId: '1:870210838239:ios:aec994c743fbf3c954936a',
    messagingSenderId: '870210838239',
    projectId: 'flutterbasics-a38c7',
    storageBucket: 'flutterbasics-a38c7.appspot.com',
    iosBundleId: 'com.example.untitled2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAVSYW9oOSb8WA6LpLZg6Az3GuhoEGxnSI',
    appId: '1:870210838239:ios:4367ec631629130854936a',
    messagingSenderId: '870210838239',
    projectId: 'flutterbasics-a38c7',
    storageBucket: 'flutterbasics-a38c7.appspot.com',
    iosBundleId: 'com.example.untitled2.RunnerTests',
  );
}