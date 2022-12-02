import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/constant/constant.dart';

import '../../../../core/utils/size_config.dart';

class TimerTask extends StatelessWidget {
  const TimerTask(
      {Key? key,
      required this.title,
      required this.count,
      required this.targetCount,
      required this.totalTime})
      : super(key: key);

  final String title;
  final double totalTime;
  final int count;
  final int targetCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.widthMultiplier * 85,
      height: SizeConfig.heightMultiplier * 11,
      decoration: BoxDecoration(
        color: AppConstant.secondaryColor.withOpacity(.07),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Material(
            color: AppConstant.swatchColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(11.0),
              child: Icon(
                Ionicons.ice_cream,
                color: AppConstant.scaffoldColor,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 2,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "$totalTime Minutes",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Text(
            "$count / $targetCount",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
