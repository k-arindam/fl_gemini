import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'fl_gemini_ios_platform_interface.dart';

/// An implementation of [FlGeminiIosPlatform] that uses method channels.
class MethodChannelFlGeminiIos extends FlGeminiIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fl_gemini_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
