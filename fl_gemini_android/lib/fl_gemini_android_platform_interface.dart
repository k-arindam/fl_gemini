import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fl_gemini_android_method_channel.dart';

abstract class FlGeminiAndroidPlatform extends PlatformInterface {
  /// Constructs a FlGeminiAndroidPlatform.
  FlGeminiAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlGeminiAndroidPlatform _instance = MethodChannelFlGeminiAndroid();

  /// The default instance of [FlGeminiAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlGeminiAndroid].
  static FlGeminiAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlGeminiAndroidPlatform] when
  /// they register themselves.
  static set instance(FlGeminiAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
