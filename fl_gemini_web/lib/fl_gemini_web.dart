
import 'fl_gemini_web_platform_interface.dart';

class FlGeminiWeb {
  Future<String?> getPlatformVersion() {
    return FlGeminiWebPlatform.instance.getPlatformVersion();
  }
}
