import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'Firebase Web options not configured. Run on iOS/Android/macOS or provide web options.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        throw UnsupportedError(
          'This platform is not supported for Firebase in this app.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAsySaFcU4sDCzS8WWJXDuttn86UZttjyM',
    appId: '1:487442026962:android:9f018f293b11d4f012380b',
    messagingSenderId: '487442026962',
    projectId: 'pizza-delivery-93d8c',
    storageBucket: 'pizza-delivery-93d8c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAW_BVWtZuTI-c9eYp7op2YHE6BMZYgetk',
    appId: '1:487442026962:ios:e98590d67650899a12380b',
    messagingSenderId: '487442026962',
    projectId: 'pizza-delivery-93d8c',
    storageBucket: 'pizza-delivery-93d8c.firebasestorage.app',
    iosBundleId: 'com.example.flutterPizzaApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAW_BVWtZuTI-c9eYp7op2YHE6BMZYgetk',
    appId: '1:487442026962:ios:e98590d67650899a12380b',
    messagingSenderId: '487442026962',
    projectId: 'pizza-delivery-93d8c',
    storageBucket: 'pizza-delivery-93d8c.firebasestorage.app',
    iosBundleId: 'com.example.flutterPizzaApp',
  );
}
