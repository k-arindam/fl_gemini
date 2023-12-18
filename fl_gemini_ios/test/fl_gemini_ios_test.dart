// import 'package:flutter_test/flutter_test.dart';
// import 'package:fl_gemini_ios/fl_gemini_ios.dart';
// import 'package:fl_gemini_ios/fl_gemini_ios_platform_interface.dart';
// import 'package:fl_gemini_ios/fl_gemini_ios_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockFlGeminiIosPlatform
//     with MockPlatformInterfaceMixin
//     implements FlGeminiIosPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final FlGeminiIosPlatform initialPlatform = FlGeminiIosPlatform.instance;

//   test('$MethodChannelFlGeminiIos is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelFlGeminiIos>());
//   });

//   test('getPlatformVersion', () async {
//     FlGeminiIos flGeminiIosPlugin = FlGeminiIos();
//     MockFlGeminiIosPlatform fakePlatform = MockFlGeminiIosPlatform();
//     FlGeminiIosPlatform.instance = fakePlatform;

//     expect(await flGeminiIosPlugin.getPlatformVersion(), '42');
//   });
// }
