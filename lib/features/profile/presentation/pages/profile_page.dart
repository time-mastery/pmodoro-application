import 'package:flutter/material.dart';
import 'package:pomodore/core/widgets/base_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Profile"),
    );
  }
}
