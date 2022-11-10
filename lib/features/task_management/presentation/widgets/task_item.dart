import 'package:flutter/material.dart';
import 'package:pomodore/core/constant/constant.dart';

import '../../../../core/utils/size_config.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    Key? key,
    required this.title,
    required this.time,
    this.color,
  }) : super(key: key);

  final String title;
  final String time;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Row(
        children: [
          const Text("09:00 AM"),
          const SizedBox(width: 20),
          Expanded(
            child: Container(
              height: SizeConfig.heightMultiplier * 11,
              decoration: BoxDecoration(
                color: color != null
                    ? color?.withOpacity(.2)
                    : AppConstant.secondaryColor.withOpacity(.07),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
