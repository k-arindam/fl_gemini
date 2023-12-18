
import 'fl_gemini_android_platform_interface.dart';

class FlGeminiAndroid {
  Future<String?> getPlatformVersion() {
    return FlGeminiAndroidPlatform.instance.getPlatformVersion();
  }
}
