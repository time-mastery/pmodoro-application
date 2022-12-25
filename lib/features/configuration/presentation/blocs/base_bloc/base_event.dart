part of 'base_bloc.dart';

abstract class BaseEvent extends Equatable {
  const BaseEvent();
}

class PageIndexChanged extends BaseEvent {
  final int index;

  PageIndexChanged(this.index);

  @override
  List<Object?> get props => [index];
}
