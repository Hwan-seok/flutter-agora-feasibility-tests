import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:get/get.dart';

class BeautifyController extends GetxController {
  Rx<LighteningContrastLevel> lighteningContrastLevel =
      LighteningContrastLevel.Low.obs;
  RxDouble lighteningLevel = 0.0.obs;
  RxDouble smoothnessLevel = 0.0.obs;
  RxDouble rednessLevel = 0.0.obs;

  RxBool beautified = false.obs;

  RtcEngine engine;
  @override
  void onInit() {
    ever(lighteningContrastLevel, (newLighteningContrastLevel) {
      engine.setBeautyEffectOptions(
        true,
        BeautyOptions(lighteningContrastLevel: newLighteningContrastLevel),
      );
    });
    ever(lighteningLevel, (newLighteningLevel) {
      engine.setBeautyEffectOptions(
        true,
        BeautyOptions(lighteningLevel: newLighteningLevel),
      );
    });
    ever(smoothnessLevel, (newSmoothnessLevel) {
      engine.setBeautyEffectOptions(
        true,
        BeautyOptions(smoothnessLevel: newSmoothnessLevel),
      );
    });
    ever(rednessLevel, (newRednessLevel) {
      engine.setBeautyEffectOptions(
        true,
        BeautyOptions(rednessLevel: newRednessLevel),
      );
    });
    ever(beautified, (newBeautified) {
      engine.setBeautyEffectOptions(newBeautified, BeautyOptions());
    });
    super.onInit();
  }
}
