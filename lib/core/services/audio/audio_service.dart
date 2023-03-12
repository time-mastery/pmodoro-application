import "package:audioplayers/audioplayers.dart";

import "../../../di.dart";
import "../database/storage.dart";

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
