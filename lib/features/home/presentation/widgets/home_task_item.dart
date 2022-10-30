import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pomodore/core/widgets/my_button.dart';

import '../../../../core/constant/constant.dart';
import '../../../../core/utils/size_config.dart';

class HomeTaskItem extends StatelessWidget {
  const HomeTaskItem({Key? key, required this.title, required this.time})
      : super(key: key);

  final String title;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: SizeConfig.widthMultiplier * 85,
        height: SizeConfig.heightMultiplier * 12,
        decoration: BoxDecoration(
          color: AppConstant.cyanColor.withOpacity(.07),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Material(
              color: AppConstant.pinkColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(11.0),
                child: Icon(
                  Ionicons.ice_cream,
                  color: AppConstant.blackColor,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
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
                    "$time Minutes",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            MyButton(
              width: SizeConfig.widthMultiplier * 14,
              height: SizeConfig.widthMultiplier * 14,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1000),
              ),
              backgroundColor: AppConstant.purpleColor,
              child: const Icon(
                Icons.play_arrow,
                color: AppConstant.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
