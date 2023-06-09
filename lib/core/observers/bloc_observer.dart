import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/utils/debug_print.dart";

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);

    dPrint("onEvent -- ${bloc.runtimeType}, $event");
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    dPrint("onCreate -- ${bloc.runtimeType}");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    dPrint("onChange -- ${bloc.runtimeType}, $change");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    dPrint("onError -- ${bloc.runtimeType}, $error");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    dPrint("onClose -- ${bloc.runtimeType}");
  }
}
