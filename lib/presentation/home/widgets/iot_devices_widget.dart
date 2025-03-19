import 'package:flutter/material.dart';
import 'package:iotools/core/theme/fonts.dart';

class IoTDivecesWidget extends StatelessWidget {
  const IoTDivecesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      sliver: SliverGrid.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 156,
            height: 156,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.cloud),
                Row(
                  children: [
                    Text('ВКЛ', style: AppFonts.getWideRegular(size: 28)),
                    Spacer(),
                    Switch.adaptive(
                      value: true,
                      onChanged: (value) {},
                      activeColor: theme.colorScheme.primary,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Влажность',
                      style: AppFonts.getCompactMedium(
                        size: 16,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'Холодный цех',
                      style: AppFonts.getCompactMedium(size: 18),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
