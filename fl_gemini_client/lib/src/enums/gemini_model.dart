enum GeminiModel {
  geminiPro("gemini-pro"),
  geminiProVision("gemini-pro-vision");

  const GeminiModel(this._value);
  final String _value;

  String get path => _value;
}
