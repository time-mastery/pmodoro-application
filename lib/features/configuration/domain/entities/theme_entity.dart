import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeEntity extends Equatable {

  final String title;
  final ThemeData theme;

  const ThemeEntity(this.title, this.theme);

  @override
  List<Object?> get props => [title, theme];
}
