import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fl_gemini_web_method_channel.dart';

abstract class FlGeminiWebPlatform extends PlatformInterface {
  /// Constructs a FlGeminiWebPlatform.
  FlGeminiWebPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlGeminiWebPlatform _instance = MethodChannelFlGeminiWeb();

  /// The default instance of [FlGeminiWebPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlGeminiWeb].
  static FlGeminiWebPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlGeminiWebPlatform] when
  /// they register themselves.
  static set instance(FlGeminiWebPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
