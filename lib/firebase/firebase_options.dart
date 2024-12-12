
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyBnCLdSlRbW520wMBsB8e4Tm5cDHzwB-II',
      appId: '1:1036232789700:android:210d8b765024d693f74391',
      messagingSenderId: '1036232789700',
      projectId: 'student-ae63a',
      storageBucket: 'student-ae63a.firebasestorage.app',
      databaseURL:
      'https://student-ae63a-default-rtdb.firebaseio.com/');

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: 'AIzaSyBnCLdSlRbW520wMBsB8e4Tm5cDHzwB-II',
      appId: '1:1036232789700:android:210d8b765024d693f74391',
      messagingSenderId: '1036232789700',
      projectId: 'student-ae63a',
      storageBucket: 'student-ae63a.firebasestorage.app',
      iosBundleId: 'com.aysha.student_info',
      databaseURL:
      'https://student-ae63a-default-rtdb.firebaseio.com/');
}