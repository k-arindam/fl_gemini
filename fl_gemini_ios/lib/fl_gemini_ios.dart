
import 'fl_gemini_ios_platform_interface.dart';

class FlGeminiIos {
  Future<String?> getPlatformVersion() {
    return FlGeminiIosPlatform.instance.getPlatformVersion();
  }
}
