// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyDhEU-rjrZY60GNrlEf2hIxSfllwtNywKk',
    appId: '1:732342335691:web:cbe8ef507b9f7db6c4c34e',
    messagingSenderId: '732342335691',
    projectId: 'appointmen-web',
    authDomain: 'appointmen-web.firebaseapp.com',
    storageBucket: 'appointmen-web.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSicdZJ46ENZNXMT0WCYJTkIiqcPNMONo',
    appId: '1:732342335691:android:da18187248934bcbc4c34e',
    messagingSenderId: '732342335691',
    projectId: 'appointmen-web',
    storageBucket: 'appointmen-web.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEhgr6VIyfab54dXElms1bmoRbMdazAVI',
    appId: '1:732342335691:ios:bd64cebdfc85cde3c4c34e',
    messagingSenderId: '732342335691',
    projectId: 'appointmen-web',
    storageBucket: 'appointmen-web.firebasestorage.app',
    iosBundleId: 'com.example.appointmentAppFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEhgr6VIyfab54dXElms1bmoRbMdazAVI',
    appId: '1:732342335691:ios:bd64cebdfc85cde3c4c34e',
    messagingSenderId: '732342335691',
    projectId: 'appointmen-web',
    storageBucket: 'appointmen-web.firebasestorage.app',
    iosBundleId: 'com.example.appointmentAppFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDhEU-rjrZY60GNrlEf2hIxSfllwtNywKk',
    appId: '1:732342335691:web:ff2f8449beb6ccadc4c34e',
    messagingSenderId: '732342335691',
    projectId: 'appointmen-web',
    authDomain: 'appointmen-web.firebaseapp.com',
    storageBucket: 'appointmen-web.firebasestorage.app',
  );
}
