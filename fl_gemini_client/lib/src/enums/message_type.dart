enum MessageType {
  oneOff("generateContent"),
  continuous("streamGenerateContent");

  const MessageType(this._value);
  final String _value;

  String get value => _value;
}
