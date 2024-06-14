import 'package:skynet/resources/resources.dart';

abstract class GetApplicationStatusService {
  static String currentStageDescription({required int stage}) {
    switch (stage) {
      case 0:
        return "Наряд создан и находится на рассмотрении";
      case 1:
        return "Наряд принят в работу, ожидайте звонка";
      case 2:
        return "Наряд выполнен! Просьба оставить оценку и отзыв";
      default:
        return "";
    }
  }

  static String currentStagePhoto({required int stage}) {
    switch (stage) {
      case 0:
        return Images.applicationStatusFirstStage;
      case 1:
        return Images.applicationStatusStageTwo;
      case 2:
        return Images.appliccationStatusStageThree;
      default:
        return "";
    }
  }
}
