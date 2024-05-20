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
    apiKey: 'AIzaSyBqud9kY-o3Cf6pBfhXjPE6_Xyjy8pvrq0',
    appId: '1:884504166756:web:161b8b046667b123833a71',
    messagingSenderId: '884504166756',
    projectId: 'travelmate-d5b06',
    authDomain: 'travelmate-d5b06.firebaseapp.com',
    storageBucket: 'travelmate-d5b06.appspot.com',
    measurementId: 'G-10BNB9J00N',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAmQRowG4rxUGsOubVywVnWv-fhnvHlmV4',
    appId: '1:884504166756:android:4644f270daa872c3833a71',
    messagingSenderId: '884504166756',
    projectId: 'travelmate-d5b06',
    storageBucket: 'travelmate-d5b06.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB903mjajOmnEhuT-CtpO2gXW1c5B_YaBw',
    appId: '1:884504166756:ios:99c168abc7b91984833a71',
    messagingSenderId: '884504166756',
    projectId: 'travelmate-d5b06',
    storageBucket: 'travelmate-d5b06.appspot.com',
    iosBundleId: 'com.example.travelmate',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB903mjajOmnEhuT-CtpO2gXW1c5B_YaBw',
    appId: '1:884504166756:ios:99c168abc7b91984833a71',
    messagingSenderId: '884504166756',
    projectId: 'travelmate-d5b06',
    storageBucket: 'travelmate-d5b06.appspot.com',
    iosBundleId: 'com.example.travelmate',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBqud9kY-o3Cf6pBfhXjPE6_Xyjy8pvrq0',
    appId: '1:884504166756:web:dc68117b3d704bf9833a71',
    messagingSenderId: '884504166756',
    projectId: 'travelmate-d5b06',
    authDomain: 'travelmate-d5b06.firebaseapp.com',
    storageBucket: 'travelmate-d5b06.appspot.com',
    measurementId: 'G-N77JSGJG0S',
  );
}
