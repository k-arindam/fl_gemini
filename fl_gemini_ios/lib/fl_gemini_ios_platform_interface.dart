import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fl_gemini_ios_method_channel.dart';

abstract class FlGeminiIosPlatform extends PlatformInterface {
  /// Constructs a FlGeminiIosPlatform.
  FlGeminiIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlGeminiIosPlatform _instance = MethodChannelFlGeminiIos();

  /// The default instance of [FlGeminiIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlGeminiIos].
  static FlGeminiIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlGeminiIosPlatform] when
  /// they register themselves.
  static set instance(FlGeminiIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
