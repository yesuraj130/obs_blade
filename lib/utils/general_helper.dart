import 'package:mobx/mobx.dart';

import '../models/enums/log_level.dart';
import '../types/classes/api/scene_item.dart';

class GeneralHelper {
  static void advLog(
    Object? obj, {
    LogLevel level = LogLevel.Info,
    bool includeInLogs = false,
  }) {
    String inLog = includeInLogs ? '[ON]' : '[OFF]';
    // ignore: avoid_print
    print(obj == null
        ? '${LogLevel.Warning.prefix}$inLog ${obj.runtimeType} is null!'
        : '${level.prefix}$inLog $obj');
  }
}

class ObservableSceneItems {
  ObservableSceneItems(
    this.sceneName, {
    required this.sceneItems,
  });
  String sceneName;
  ObservableList<SceneItem> sceneItems;
}
