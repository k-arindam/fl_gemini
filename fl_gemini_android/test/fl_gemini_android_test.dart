import 'package:flutter_test/flutter_test.dart';
import 'package:fl_gemini_android/fl_gemini_android.dart';
import 'package:fl_gemini_android/fl_gemini_android_platform_interface.dart';
import 'package:fl_gemini_android/fl_gemini_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlGeminiAndroidPlatform
    with MockPlatformInterfaceMixin
    implements FlGeminiAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlGeminiAndroidPlatform initialPlatform = FlGeminiAndroidPlatform.instance;

  test('$MethodChannelFlGeminiAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlGeminiAndroid>());
  });

  test('getPlatformVersion', () async {
    FlGeminiAndroid flGeminiAndroidPlugin = FlGeminiAndroid();
    MockFlGeminiAndroidPlatform fakePlatform = MockFlGeminiAndroidPlatform();
    FlGeminiAndroidPlatform.instance = fakePlatform;

    expect(await flGeminiAndroidPlugin.getPlatformVersion(), '42');
  });
}
