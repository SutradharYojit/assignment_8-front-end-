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
    apiKey: 'AIzaSyB4veaDszDGdvfC4rDUZWmM3ixmLcmSwRY',
    appId: '1:409760966564:web:ec615f8c65fc8b6bab8331',
    messagingSenderId: '409760966564',
    projectId: 'assignment8-e078a',
    authDomain: 'assignment8-e078a.firebaseapp.com',
    storageBucket: 'assignment8-e078a.appspot.com',
    measurementId: 'G-8F06ZHZFF4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAVHvte_YvGg3Zc7xAH5Nq18ysF2ekDBP4',
    appId: '1:409760966564:android:cf02016e4784dc38ab8331',
    messagingSenderId: '409760966564',
    projectId: 'assignment8-e078a',
    storageBucket: 'assignment8-e078a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIYFPCswCxgbagmYSlktOEz9PZGia520c',
    appId: '1:409760966564:ios:7f047aa24ae25330ab8331',
    messagingSenderId: '409760966564',
    projectId: 'assignment8-e078a',
    storageBucket: 'assignment8-e078a.appspot.com',
    iosBundleId: 'com.example.assignment8',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBIYFPCswCxgbagmYSlktOEz9PZGia520c',
    appId: '1:409760966564:ios:2fed6eba64bfcd3dab8331',
    messagingSenderId: '409760966564',
    projectId: 'assignment8-e078a',
    storageBucket: 'assignment8-e078a.appspot.com',
    iosBundleId: 'com.example.assignment8.RunnerTests',
  );
}
