import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iotools/core/router/router.gr.dart';
import 'package:iotools/core/theme/fonts.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Предприятие', style: AppFonts.getTextMedium(size: 24)),
            GestureDetector(
              onTap: () {
                context.router.push(SensorAlertRoute());
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,

                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.notification_important_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
