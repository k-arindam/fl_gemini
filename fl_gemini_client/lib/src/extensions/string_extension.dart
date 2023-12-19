import 'package:collection/collection.dart';
import 'package:fl_gemini_client/src/enums/gemini_model.dart';

extension StringExtension on String {
  GeminiModel? get toGeminiModel => GeminiModel.values.firstWhereOrNull(
        (element) => element.path == this,
      );
}
