library fl_gemini_client;

import 'dart:io';

import 'package:fl_gemini_android/fl_gemini_android.dart';
import 'package:fl_gemini_ios/fl_gemini_ios.dart';
import 'package:fl_gemini_platform_interface/fl_gemini_platform_interface.dart';

export 'package:fl_gemini_android/fl_gemini_android.dart' show FlGeminiAndroid;
export 'package:fl_gemini_ios/fl_gemini_ios.dart' show FlGeminiIos;

class FLGeminiClient {
  static final _shared = FLGeminiClient._();
  FLGeminiClient._();

  factory FLGeminiClient() => _shared;

  final _platformInterface = FlGeminiPlatform.instance;

  Future<String?> getPlatformVersion() {
    return _platformInterface.getPlatformVersion();
  }

  static Future<void> init() async {
    if (Platform.isAndroid) {
      FlGeminiAndroid.registerWith();
    }

    if (Platform.isIOS) {
      FlGeminiIos.registerWith();
    }
  }
}
