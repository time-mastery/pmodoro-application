part of 'base_bloc.dart';

abstract class BaseState extends Equatable {
  const BaseState();
}

class PageChangeSuccess extends BaseState {
  final int index;

  PageChangeSuccess(this.index);

  @override
  List<Object?> get props => [index];
}
