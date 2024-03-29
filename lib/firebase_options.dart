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
    apiKey: 'AIzaSyBjyFkmWQqnbob_fMoJEo_-aCjLlvP0Ruw',
    appId: '1:962997820669:web:7cdaa2d090e955f3d4f294',
    messagingSenderId: '962997820669',
    projectId: 'avdtest-a1d8b',
    authDomain: 'avdtest-a1d8b.firebaseapp.com',
    storageBucket: 'avdtest-a1d8b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCw2K-vjfOHhtrD6nMv0G2OTbZYEBeWtVs',
    appId: '1:962997820669:android:b7920d9da60fa6e6d4f294',
    messagingSenderId: '962997820669',
    projectId: 'avdtest-a1d8b',
    storageBucket: 'avdtest-a1d8b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfsNTp_m4QbgIySEUSytMc5D6OpIODrYc',
    appId: '1:962997820669:ios:13b008b7ffe05508d4f294',
    messagingSenderId: '962997820669',
    projectId: 'avdtest-a1d8b',
    storageBucket: 'avdtest-a1d8b.appspot.com',
    iosBundleId: 'com.example.secondApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfsNTp_m4QbgIySEUSytMc5D6OpIODrYc',
    appId: '1:962997820669:ios:ba8d4e0a672e94cad4f294',
    messagingSenderId: '962997820669',
    projectId: 'avdtest-a1d8b',
    storageBucket: 'avdtest-a1d8b.appspot.com',
    iosBundleId: 'com.example.secondApp.RunnerTests',
  );
}
