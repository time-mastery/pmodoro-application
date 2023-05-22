import "package:ionicons/ionicons.dart";

class IconConverter {
  static final Map icons = {
    "alarm_outline": Ionicons.alarm_outline,
    "bed_outline": Ionicons.bed_outline,
    "book_outline": Ionicons.book_outline,
    "car_sport_outline": Ionicons.car_sport_outline,
    "code_download_outline": Ionicons.code_download_outline,
    "document_lock_outline": Ionicons.document_lock_outline,
    "film_outline": Ionicons.film_outline,
    "game_controller_outline": Ionicons.game_controller_outline,
    "headset_outline": Ionicons.headset_outline,
    "home_outline": Ionicons.home_outline,
    "library_outline": Ionicons.library_outline,
    "list_outline": Ionicons.list_outline,
    "moon_outline": Ionicons.moon_outline,
    "musical_notes_outline": Ionicons.musical_notes_outline,
    "notifications_circle_outline": Ionicons.notifications_circle_outline,
    "open_outline": Ionicons.open_outline,
    "school_outline": Ionicons.school_outline,
    "shirt_outline": Ionicons.shirt_outline,
    "telescope_outline": Ionicons.telescope_outline,
    "terminal_outline": Ionicons.terminal_outline,
    "today_outline": Ionicons.today_outline,
    "walk_outline": Ionicons.walk_outline,
    "wallet_outline": Ionicons.wallet_outline
  };

  static String findKeyByValue(Ionicons value) {
    var entry = icons.entries.firstWhere(
      (entry) => entry.value == value,
    );
    return entry.key;
  }
}
