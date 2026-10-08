import "package:audioplayers/audioplayers.dart";

import "package:pomodore/di.dart";
import "package:pomodore/core/services/database/storage.dart";

class AudioService {
  Future soundIsAllowedByUserOrNot() async {
    return (await FStorage.read(FStorage.soundKey)) == "1";
  }

  void playSound(String path) async {
    if (await soundIsAllowedByUserOrNot()) {
      await getIt.get<AudioPlayer>().setSource(AssetSource(path));
      await getIt.get<AudioPlayer>().resume();
    }
  }
}
