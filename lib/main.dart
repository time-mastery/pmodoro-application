import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:pomodore/core/constant/constant.dart';
import 'package:pomodore/core/router/router.dart';

void main() async {
  runApp(const MyApp());

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstant.appName,
      onGenerateRoute: AppRouter.onGenerationRouter,
      theme: AppConstant.getTheme(context),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class Body extends StatefulWidget {
//   const Body({Key? key}) : super(key: key);
//
//   @override
//   State<Body> createState() => _BodyState();
// }
//
// class _BodyState extends State<Body> {
//   Timer? _timer;
//   int _sec = 0;
//   int _max = 60 * 30;
//
//   reset() {
//     _sec = 0;
//     _timer?.cancel();
//     _timer = null;
//     setState(() {});
//   }
//
//   start() {
//     _timer ??= Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_sec < _max) {
//         setState(() {
//           _sec++;
//         });
//       } else {
//         _timer?.cancel();
//       }
//     });
//   }
//
//   formattedTime({required int timeInSecond}) {
//     int sec = timeInSecond % 60;
//     int min = (timeInSecond / 60).floor();
//     String minute = min.toString().length <= 1 ? "0$min" : "$min";
//     String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
//     return "$minute : $second";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MoveWindow(
//       child: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * .4,
//                 height: MediaQuery.of(context).size.width * .4,
//                 child: Stack(
//                   children: [
//                     Align(
//                       alignment: Alignment.center,
//                       child: SizedBox(
//                           width: MediaQuery.of(context).size.width * .4,
//                           height: MediaQuery.of(context).size.width * .4,
//                           child: CircularProgressIndicator(
//                             value: _sec / _max,
//                             color: orangeColor,
//                             backgroundColor: orangeColor.withOpacity(.2),
//                             strokeWidth: 3,
//                             semanticsValue: "sad",
//                           )),
//                     ),
//                     Align(
//                       alignment: Alignment.center,
//                       child: SizedBox(
//                         child: Text(
//                           _sec == 0 ? ":)" : formattedTime(timeInSecond: _sec),
//                           style: Theme.of(context)
//                               .textTheme
//                               .headlineLarge
//                               ?.copyWith(color: orangeColor),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   OutlinedButton(
//                       style: const ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(orangeColor),
//                         foregroundColor: MaterialStatePropertyAll(blackColor),
//                       ),
//                       onPressed: () => start(),
//                       child: const Text("Start")),
//                   const SizedBox(
//                     width: 100,
//                   ),
//                   OutlinedButton(
//                       style: const ButtonStyle(
//                         backgroundColor: MaterialStatePropertyAll(orangeColor),
//                         foregroundColor: MaterialStatePropertyAll(blackColor),
//                       ),
//                       onPressed: () => reset(),
//                       child: const Text("Reset")),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
