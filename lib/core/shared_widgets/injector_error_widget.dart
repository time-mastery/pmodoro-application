import "package:flutter/material.dart";
import "package:pomodore/core/shared_widgets/global_button.dart";

class InjectorErrorWidget extends StatelessWidget {
  const InjectorErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Center(child: Text("kir")),
          GlobalButton(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
