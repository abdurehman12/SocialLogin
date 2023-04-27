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
    apiKey: 'AIzaSyC3jncOqXzhWrh-fM5u9B6_wdYVO2U08EU',
    appId: '1:342802674902:web:f067b9184b8d1ce6110577',
    messagingSenderId: '342802674902',
    projectId: 'socialsignup-36839',
    authDomain: 'socialsignup-36839.firebaseapp.com',
    storageBucket: 'socialsignup-36839.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyANqo-WoQ2hi5JveE1c4rIe9l-80tyAQKg',
    appId: '1:342802674902:android:8c454ea7fcef8484110577',
    messagingSenderId: '342802674902',
    projectId: 'socialsignup-36839',
    storageBucket: 'socialsignup-36839.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB2wKF1aPmbcyFCAMIVCuou77qOYlUzWYI',
    appId: '1:342802674902:ios:8614b73125301c95110577',
    messagingSenderId: '342802674902',
    projectId: 'socialsignup-36839',
    storageBucket: 'socialsignup-36839.appspot.com',
    iosClientId: '342802674902-0pkqc8b1q6k7hgmaau5h7ta0am5esvt8.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialsignup',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB2wKF1aPmbcyFCAMIVCuou77qOYlUzWYI',
    appId: '1:342802674902:ios:8614b73125301c95110577',
    messagingSenderId: '342802674902',
    projectId: 'socialsignup-36839',
    storageBucket: 'socialsignup-36839.appspot.com',
    iosClientId: '342802674902-0pkqc8b1q6k7hgmaau5h7ta0am5esvt8.apps.googleusercontent.com',
    iosBundleId: 'com.example.socialsignup',
  );
}
