import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fl_gemini_web_platform_interface.dart';

/// An implementation of [FlGeminiWebPlatform] that uses method channels.
class MethodChannelFlGeminiWeb extends FlGeminiWebPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fl_gemini_web');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
