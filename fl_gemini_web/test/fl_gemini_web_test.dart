import 'package:flutter_test/flutter_test.dart';
import 'package:fl_gemini_web/fl_gemini_web.dart';
import 'package:fl_gemini_web/fl_gemini_web_platform_interface.dart';
import 'package:fl_gemini_web/fl_gemini_web_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlGeminiWebPlatform
    with MockPlatformInterfaceMixin
    implements FlGeminiWebPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlGeminiWebPlatform initialPlatform = FlGeminiWebPlatform.instance;

  test('$MethodChannelFlGeminiWeb is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlGeminiWeb>());
  });

  test('getPlatformVersion', () async {
    FlGeminiWeb flGeminiWebPlugin = FlGeminiWeb();
    MockFlGeminiWebPlatform fakePlatform = MockFlGeminiWebPlatform();
    FlGeminiWebPlatform.instance = fakePlatform;

    expect(await flGeminiWebPlugin.getPlatformVersion(), '42');
  });
}
