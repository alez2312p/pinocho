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
    apiKey: 'AIzaSyBVdwYUsX_HgPoWncCNQBHIpxGkKESa5uM',
    appId: '1:445857147004:web:323ea6e9e90aac57d881f9',
    messagingSenderId: '445857147004',
    projectId: 'pinocho-a3987',
    authDomain: 'pinocho-a3987.firebaseapp.com',
    storageBucket: 'pinocho-a3987.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDM4Nu6Az5Jjh3DIqdLiuqarMul1fm3Ni8',
    appId: '1:445857147004:android:15f68a766dedcc26d881f9',
    messagingSenderId: '445857147004',
    projectId: 'pinocho-a3987',
    storageBucket: 'pinocho-a3987.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQGdIKzgvq9ygqV1Ci77xkuWlyKWFnq3w',
    appId: '1:445857147004:ios:d6afe5464a451f3fd881f9',
    messagingSenderId: '445857147004',
    projectId: 'pinocho-a3987',
    storageBucket: 'pinocho-a3987.appspot.com',
    iosBundleId: 'com.example.pinocho',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQGdIKzgvq9ygqV1Ci77xkuWlyKWFnq3w',
    appId: '1:445857147004:ios:f64501e7853785c4d881f9',
    messagingSenderId: '445857147004',
    projectId: 'pinocho-a3987',
    storageBucket: 'pinocho-a3987.appspot.com',
    iosBundleId: 'com.example.pinocho.RunnerTests',
  );
}
