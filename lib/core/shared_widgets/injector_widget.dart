import "dart:io";

import "package:bitsdojo_window/bitsdojo_window.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:pomodore/core/constant/constant.dart";
import "package:pomodore/core/observers/bloc_observer.dart";
import "package:pomodore/core/shared_widgets/injector_error_widget.dart";
import "package:pomodore/di.dart";
import "package:pomodore/features/configuration/presentation/blocs/base_bloc/base_bloc.dart";
import "package:pomodore/features/configuration/presentation/blocs/settings_bloc/settings_bloc.dart";
import "package:pomodore/features/task_management/presentation/blocs/timer_bloc/timer_bloc.dart";

class InjectorWidget extends StatefulWidget {
  const InjectorWidget({super.key, required this.child});

  final Widget child;

  @override
  State<InjectorWidget> createState() => _InjectorWidgetState();
}

class _InjectorWidgetState extends State<InjectorWidget> {
  late final Future injectFutureInstance;
  @override
  void initState() {
    super.initState();

    injectFutureInstance = inject();

    WidgetsFlutterBinding.ensureInitialized();
    Bloc.observer = MyBlocObserver();

    if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
      doWhenWindowReady(() {
        const initialSize = Size(400, 700);
        appWindow.minSize = initialSize;
        appWindow.maxSize = initialSize;
        appWindow.size = initialSize;
        appWindow.alignment = Alignment.centerRight;
        appWindow.title = AppConstant.appName;
        appWindow.show();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: injectFutureInstance,
      builder: (context, snapshot) {
        if (snapshot.hasError) return const InjectorErrorWidget();

        if (snapshot.connectionState == ConnectionState.done) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<TimerBloc>(
                create: (context) => getIt.get<TimerBloc>(),
              ),
              BlocProvider<BaseBloc>(
                create: (context) => getIt.get<BaseBloc>(),
              ),
              BlocProvider<SettingsBloc>(
                create: (context) => getIt.get<SettingsBloc>()
                  ..add(
                    InitDataFetched(),
                  ),
              ),
            ],
            child: widget.child,
          );
        }

        return Container();
      },
    );
  }
}
