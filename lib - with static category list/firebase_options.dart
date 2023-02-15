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
    apiKey: 'AIzaSyDSCEAObYTWYb61-in3-LMX9DNEwz1Ny2g',
    appId: '1:234831945453:web:4e99d3fff317428b0036e4',
    messagingSenderId: '234831945453',
    projectId: 'khurrammarket',
    authDomain: 'khurrammarket.firebaseapp.com',
    storageBucket: 'khurrammarket.appspot.com',
    measurementId: 'G-64X3BFNGTD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDGAUxSCMeR5aBqaEZTPWx61yZEpSAvtUI',
    appId: '1:234831945453:android:0642580e690758c50036e4',
    messagingSenderId: '234831945453',
    projectId: 'khurrammarket',
    storageBucket: 'khurrammarket.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBHw4fYsC4IKPv3umU-xjustJWjxV1K_g0',
    appId: '1:234831945453:ios:39c6454842d985aa0036e4',
    messagingSenderId: '234831945453',
    projectId: 'khurrammarket',
    storageBucket: 'khurrammarket.appspot.com',
    androidClientId: '234831945453-8eeuve5oidt3ns4i87jaj4djnpp5oltm.apps.googleusercontent.com',
    iosClientId: '234831945453-epsrm24rcik2uuqbraiq0o2u93vk6fv6.apps.googleusercontent.com',
    iosBundleId: 'com.example.khurramStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBHw4fYsC4IKPv3umU-xjustJWjxV1K_g0',
    appId: '1:234831945453:ios:39c6454842d985aa0036e4',
    messagingSenderId: '234831945453',
    projectId: 'khurrammarket',
    storageBucket: 'khurrammarket.appspot.com',
    androidClientId: '234831945453-8eeuve5oidt3ns4i87jaj4djnpp5oltm.apps.googleusercontent.com',
    iosClientId: '234831945453-epsrm24rcik2uuqbraiq0o2u93vk6fv6.apps.googleusercontent.com',
    iosBundleId: 'com.example.khurramStore',
  );
}
