import 'package:fl_gemini_client/src/enums/message_entity.dart';

class GeminiMessage {
  final MessageEntity entity;
  final List<String> parts;

  const GeminiMessage({
    required this.entity,
    required this.parts,
  });

  factory GeminiMessage.fromJson(Map json) {
    return GeminiMessage(
      entity: MessageEntity.values
          .firstWhere((element) => element.name == json["role"]),
      parts: (json["parts"] as List).map((e) => e['text'] as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'role': entity.name,
      'parts': parts.map((e) => {'text': e}).toList(),
    };
  }
}
