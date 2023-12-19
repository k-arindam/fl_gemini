import 'dart:convert';
import 'dart:io';

import 'package:fl_gemini_client/src/common/constants.dart';
import 'package:fl_gemini_client/src/enums/gemini_model.dart';
import 'package:fl_gemini_client/src/enums/message_type.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

mixin ApiService {
  static const Map<String, String> _defaultHeaders = {
    HttpHeaders.contentTypeHeader: "application/json",
  };

  @protected
  Future<dynamic> post({
    required GeminiModel model,
    required MessageType type,
    required String key,
    required String input,
  }) async {
    final uri = Uri.https(
      Constants.kBaseUrl,
      "${Constants.kVersionPath}/${model.path}:${type.value}",
      {
        'key': key,
      },
    );

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
      final resp = await http.post(
        uri,
        body: jsonEncode(payload),
        headers: _defaultHeaders,
      );

      if (resp.statusCode == 200 || resp.statusCode == 201) {
        return jsonDecode(resp.body);
      }

      throw Exception(resp.body);
    } catch (e) {
      rethrow;
    }
  }
}
