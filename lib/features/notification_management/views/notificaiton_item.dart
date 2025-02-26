import "package:flutter/material.dart";
import "package:pomodore/core/extensions/sized_box_extension.dart";
import "package:pomodore/core/utils/responsive/size_config.dart";

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: SizeConfig.heightMultiplier * 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Container(
              height: SizeConfig.widthMultiplier * 20,
              width: SizeConfig.widthMultiplier * 20,
              decoration: BoxDecoration(
                color: color.withOpacity(.08),
                shape: BoxShape.circle,
              ),
              child: Icon(icon),
            ),
            (SizeConfig.widthMultiplier * 5).spaceW(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  10.spaceH(),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
