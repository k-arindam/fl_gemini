import 'dart:io';
import 'dart:typed_data';

import 'package:fl_gemini_android/fl_gemini_android.dart';
import 'package:fl_gemini_client/src/enums/gemini_model.dart';
import 'package:fl_gemini_client/src/enums/message_type.dart';
import 'package:fl_gemini_client/src/models/gemini_message.dart';
import 'package:fl_gemini_client/src/services/api_service.dart';
import 'package:fl_gemini_ios/fl_gemini_ios.dart';
import 'package:fl_gemini_platform_interface/fl_gemini_platform_interface.dart';
import 'package:flutter/foundation.dart';

class FLGeminiClient with ApiService {
  static final _shared = FLGeminiClient._();
  FLGeminiClient._();

  factory FLGeminiClient() => _shared;

  // MEMBERS
  static late final String _apiKey;
  final _platformInterface = FlGeminiPlatform.instance;

  // METHODS
  Future<GeminiMessage?> generateOneOffResponse(
    String input, {
    Uint8List? image,
  }) async {
    if (input.isEmpty) return null;
    final withImage = image != null;

    final payload = {
      "contents": [
        {
          "parts": [
            {
              "text": input,
            },
          ],
        },
      ],
    };

    try {
      final resp = await post(
        model: withImage ? GeminiModel.geminiProVision : GeminiModel.geminiPro,
        type: MessageType.oneOff,
        key: _apiKey,
        payload: payload,
      );

      return GeminiMessage.fromJson(resp["candidates"][0]["content"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<GeminiMessage?> generateOneOffResponseWithContext(String input,
      {List<GeminiMessage> context = const []}) async {
    if (input.isEmpty) return null;

    final payload = {
      "contents": [
        ...context
            .map((e) => {
                  "role": e.entity.name,
                  "parts": e.toJson()["parts"],
                })
            .toList(),
        {
          "role": "user",
          "parts": [
            {
              "text": input,
            },
          ],
        },
      ],
    };

    try {
      final resp = await post(
        model: GeminiModel.geminiPro,
        type: MessageType.oneOff,
        key: _apiKey,
        payload: payload,
      );

      return GeminiMessage.fromJson(resp["candidates"][0]["content"]);
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getPlatformVersion() {
    return _platformInterface.getPlatformVersion();
  }

  static Future<void> init({required String key}) async {
    if (Platform.isAndroid) {
      FlGeminiAndroid.registerWith();
    }

    if (Platform.isIOS) {
      FlGeminiIos.registerWith();
    }

    _apiKey = key;
  }

  // GETTERS
  static FLGeminiClient get instance => _shared;

  // SETTERS
}
