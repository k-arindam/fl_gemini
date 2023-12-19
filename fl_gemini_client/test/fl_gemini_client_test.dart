import 'package:fl_gemini_client/fl_gemini_client.dart';
import 'package:fl_gemini_client/src/models/gemini_message.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const key = "";
  test('generateOneOffResponse', () async {
    FLGeminiClient.init(key: key);

    final client = FLGeminiClient.instance;

    expect(await client.generateOneOffResponse("Hello how are you ?!?"),
        isA<GeminiMessage>());
  });
}
