import 'package:fl_gemini_platform_interface/src/method_channel/fl_gemini_method_channel.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class FlGeminiPlatform extends PlatformInterface {
  /// Constructs a FlGeminiPlatform.
  FlGeminiPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlGeminiPlatform _instance = MethodChannelFlGemini();

  /// The default instance of [FlGeminiPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlGemini].
  static FlGeminiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlGeminiPlatform] when
  /// they register themselves.
  static set instance(FlGeminiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();
}
