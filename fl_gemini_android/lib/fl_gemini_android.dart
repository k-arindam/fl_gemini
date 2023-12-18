import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:fl_gemini_platform_interface/fl_gemini_platform_interface.dart';

class FlGeminiAndroid extends FlGeminiPlatform {
  static void registerWith() {
    FlGeminiPlatform.instance = FlGeminiAndroid();
  }

  @visibleForTesting
  final methodChannel = const MethodChannel('com.karindam.fl_gemini_client');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
