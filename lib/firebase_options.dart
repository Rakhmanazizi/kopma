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
    apiKey: 'AIzaSyBhv1cPXQsnf6utFzaJ9umnQT3kWRivchQ',
    appId: '1:469014140224:web:76b87785c0bf68741f96a5',
    messagingSenderId: '469014140224',
    projectId: 'kopma-uin-suka-2003',
    authDomain: 'kopma-uin-suka-2003.firebaseapp.com',
    storageBucket: 'kopma-uin-suka-2003.appspot.com',
    measurementId: 'G-E3895BSQ22',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAb3_0Y7tQNR4NFQZ-Ytun5zSdrvy-4a6s',
    appId: '1:469014140224:android:4f782f274475568f1f96a5',
    messagingSenderId: '469014140224',
    projectId: 'kopma-uin-suka-2003',
    storageBucket: 'kopma-uin-suka-2003.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCIxsW2BezOuxLHdECvpyTJSKYaY2XD9T0',
    appId: '1:469014140224:ios:f950f7a264219f6b1f96a5',
    messagingSenderId: '469014140224',
    projectId: 'kopma-uin-suka-2003',
    storageBucket: 'kopma-uin-suka-2003.appspot.com',
    iosBundleId: 'com.example.kopma',
  );
}

const iOSClientId = 'your-client-id.apps.googleusercontent.com';
const webClientId = '469014140224-hjdcn6a08jb8hcfcph3vf8mnd9epgfrj.apps.googleusercontent.com';
const androidClientId = 'your-client-id.apps.googleuserconten.com';

String get googleClientId {
  return switch (defaultTargetPlatform) {
    TargetPlatform.iOS || TargetPlatform.macOS => iOSClientId,
    _ => webClientId,
  };
}
