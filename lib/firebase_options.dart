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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB34i_AXqNNOGyrg-_jhJN30ju6zu3edI8',
    appId: '1:186682096723:web:8e400ec21b79d5c58f5aa6',
    messagingSenderId: '186682096723',
    projectId: 'fitnessapp-7ff63',
    authDomain: 'fitnessapp-7ff63.firebaseapp.com',
    storageBucket: 'fitnessapp-7ff63.appspot.com',
    measurementId: 'G-X3GYHY076L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBY9XsOH3a9Zb4KI5Q8T8fkLKmaM-yawhw',
    appId: '1:186682096723:android:3fd8aaa856f568c28f5aa6',
    messagingSenderId: '186682096723',
    projectId: 'fitnessapp-7ff63',
    storageBucket: 'fitnessapp-7ff63.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDIIT7T6htZS8_Y_ytLZ5wFjKUiNoO8mO4',
    appId: '1:186682096723:ios:84cb9a76f7e1afcd8f5aa6',
    messagingSenderId: '186682096723',
    projectId: 'fitnessapp-7ff63',
    storageBucket: 'fitnessapp-7ff63.appspot.com',
    iosClientId: '186682096723-p420pvcs41t1na7u2mo7rpuu4i7nh0el.apps.googleusercontent.com',
    iosBundleId: 'com.onatcipli.networkUpp',
  );
}
