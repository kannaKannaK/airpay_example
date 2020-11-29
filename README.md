# airpay_example
 Airpay usage with example

## Usage
Add `airpay_package` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

You can now include a airpayPackage widget in your widget tree. See the
[airpayPackage](https://pub.dev/)
widget's Dartdoc for more details on how to use the widget.


## Android Platform Views
The Airpay flutter package is a lighweight WebView is relying on
[Platform Views](https://flutter.dev/docs/development/platform-integration/platform-views) to embed
the Android’s webview within the Flutter app. By default a Virtual Display based platform view
backend is used,

### Using Airpay

For example:

```dart
import 'dart:io';

import 'package:airpay_package/airpay_package.dart';

class WebViewExample extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();

    String domainPath = '##Your Domain##';

    String kAirPaySecretKey = '##Secret Key##';

    String kAirPayUserName = '##UserName##';

    String kAirPayPassword = 'Password';

    String merchantID = '##MerchantID##';

    String successURL = 'SuccessURL';
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://flutter.dev',
    );
  }
}
```

Airpay `SurfaceAndroidWebView()` requires [API level 19](https://developer.android.com/studio/releases/platforms?hl=th#4.4). The plugin itself doesn't enforce the API level, so if you want to make the app available on devices running this API level or above, add the following to `<your-app>/android/app/build.gradle`:

```gradle
android {
    defaultConfig {
        // Required by the Flutter WebView plugin.
        minSdkVersion 19
    }
  }
```
