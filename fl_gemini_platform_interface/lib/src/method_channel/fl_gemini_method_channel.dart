import 'package:fl_gemini_platform_interface/src/platform_interface/fl_gemini_platform.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [FlGeminiPlatform] that uses method channels.
class MethodChannelFlGemini extends FlGeminiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.karindam.fl_gemini_client');

  @override
  Future<String?> getPlatformVersion() async {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
