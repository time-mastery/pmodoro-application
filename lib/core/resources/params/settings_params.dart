import "package:equatable/equatable.dart";

class ChangeSettingsParams extends Equatable {
  final String key;
  final bool value;

  const ChangeSettingsParams({required this.key, required this.value});

  @override
  String toString() {
    return "ChangeSettingsParams{key: $key, value: $value}";
  }

  @override
  List<Object?> get props => [key, value];
}
