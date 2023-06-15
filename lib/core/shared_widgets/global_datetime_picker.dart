// import "package:flutter/material.dart";
// import "package:flutter_bloc/flutter_bloc.dart";
// import "package:flutter_datetime_picker/flutter_datetime_picker.dart";
// import "package:pomodore/core/constant/constant.dart";
// import "package:pomodore/core/utils/responsive/size_config.dart";
// import "package:pomodore/features/configuration/presentation/blocs/settings_bloc/settings_bloc.dart";
//
// class GlobalDateTimePicker extends StatelessWidget {
//   const GlobalDateTimePicker({
//     Key? key,
//     required this.buttonTitle,
//     this.onChanged,
//     this.onConfirm,
//   }) : super(key: key);
//
//   final String buttonTitle;
//   final DateChangedCallback? onChanged, onConfirm;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<SettingsBloc, SettingsState>(
//       builder: (context, state) {
//         Locale locale = const Locale("en");
//         LocaleType localeType = LocaleType.en;
//         if (state is InitDataFetchSuccess) {
//           locale = state.locale;
//         }
//
//         if (state is ChangeLanguageSuccess) {
//           locale = state.locale;
//         }
//
//         if (locale.languageCode == "fa") {
//           localeType = LocaleType.fa;
//         } else if (locale.languageCode == "de") {
//           localeType = LocaleType.de;
//         } else {
//           localeType = LocaleType.en;
//         }
//
//         return Container(
//           height: SizeConfig.heightMultiplier * 5,
//           decoration: BoxDecoration(
//             border:
//                 Border.all(color: Theme.of(context).colorScheme.onBackground),
//             borderRadius: BorderRadius.circular(AppConstant.radius),
//           ),
//           child: TextButton(
//             onPressed: () {
//               DatePicker.showDateTimePicker(
//                 context,
//                 showTitleActions: true,
//
//                 // theme: DatePickerTheme(
//                 //   backgroundColor: Theme.of(context).colorScheme.background,
//                 //   itemStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
//                 //         color: Theme.of(context).colorScheme.onBackground,
//                 //       ),
//                 //   cancelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
//                 //         color: Theme.of(context).colorScheme.onBackground,
//                 //       ),
//                 //   doneStyle: Theme.of(context)
//                 //       .textTheme
//                 //       .titleLarge!
//                 //       .copyWith(color: Theme.of(context).colorScheme.error),
//                 // ),
//                 minTime: DateTime.now(),
//                 maxTime: DateTime.now().add(const Duration(days: 1)),
//                 onChanged: onChanged,
//                 onConfirm: onConfirm,
//                 currentTime: DateTime.now(),
//                 locale: localeType,
//               );
//             },
//             child: Text(
//               buttonTitle,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
