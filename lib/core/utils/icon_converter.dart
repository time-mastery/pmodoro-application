import "package:flutter/widgets.dart";
import "package:ionicons/ionicons.dart";

class IconConverter {
  static final Map icons = {
    "alarm_outline": Ionicons.alarmOutline,
    "bed_outline": Ionicons.bedOutline,
    "book_outline": Ionicons.bookOutline,
    "car_sport_outline": Ionicons.carSportOutline,
    "code_download_outline": Ionicons.codeDownloadOutline,
    "document_lock_outline": Ionicons.documentLockOutline,
    "film_outline": Ionicons.filmOutline,
    "game_controller_outline": Ionicons.gameControllerOutline,
    "headset_outline": Ionicons.headsetOutline,
    "home_outline": Ionicons.homeOutline,
    "library_outline": Ionicons.libraryOutline,
    "list_outline": Ionicons.listOutline,
    "moon_outline": Ionicons.moonOutline,
    "musical_notes_outline": Ionicons.musicalNotesOutline,
    "notifications_circle_outline": Ionicons.notificationsCircleOutline,
    "open_outline": Ionicons.openOutline,
    "school_outline": Ionicons.schoolOutline,
    "shirt_outline": Ionicons.shirtOutline,
    "telescope_outline": Ionicons.telescopeOutline,
    "terminal_outline": Ionicons.terminalOutline,
    "today_outline": Ionicons.todayOutline,
    "walk_outline": Ionicons.walkOutline,
    "wallet_outline": Ionicons.walletOutline
  };

  static String findKeyByValue(IconData value) {
    var entry = icons.entries.firstWhere(
      (entry) => entry.value == value,
    );
    return entry.key;
  }
}
