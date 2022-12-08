import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  final int? id;
  final String title;

  const CategoryEntity({this.id, required this.title});

  @override
  List<Object?> get props => [id, title];
}
