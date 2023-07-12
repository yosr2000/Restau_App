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
    apiKey: 'AIzaSyBGOXn4q1GDMYBQuLHBRBadlQNJXwCArXE',
    appId: '1:170382744315:web:0da74998c69d6bf1f8ae5e',
    messagingSenderId: '170382744315',
    projectId: 'cafe-resto-c3cbd',
    authDomain: 'cafe-resto-c3cbd.firebaseapp.com',
    storageBucket: 'cafe-resto-c3cbd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiONIfrqgQYTHCh8ft8jWDx6Gereo471w',
    appId: '1:170382744315:android:8799ac926a615b05f8ae5e',
    messagingSenderId: '170382744315',
    projectId: 'cafe-resto-c3cbd',
    storageBucket: 'cafe-resto-c3cbd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCELOjC24iwtv6d5xo4RDs-R4v1ZxoQ2to',
    appId: '1:170382744315:ios:1e957bcc9d372fddf8ae5e',
    messagingSenderId: '170382744315',
    projectId: 'cafe-resto-c3cbd',
    storageBucket: 'cafe-resto-c3cbd.appspot.com',
    iosClientId: '170382744315-f1b84084uidfggfiffbbsbrd1mt2u5rh.apps.googleusercontent.com',
    iosBundleId: 'com.example.cafeRestaut',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCELOjC24iwtv6d5xo4RDs-R4v1ZxoQ2to',
    appId: '1:170382744315:ios:d78e097c04b481a9f8ae5e',
    messagingSenderId: '170382744315',
    projectId: 'cafe-resto-c3cbd',
    storageBucket: 'cafe-resto-c3cbd.appspot.com',
    iosClientId: '170382744315-77m0ofgs4pmthi0c02au8i41uv3v6nln.apps.googleusercontent.com',
    iosBundleId: 'com.example.cafeRestaut.RunnerTests',
  );
}
