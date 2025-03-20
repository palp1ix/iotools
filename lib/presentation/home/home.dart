import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iotools/bloc/detectors/detectors_bloc.dart';
import 'package:iotools/core/router/router.gr.dart';
import 'package:iotools/core/theme/fonts.dart';
import 'package:iotools/presentation/home/widgets/home_appbar.dart';
import 'package:iotools/presentation/home/widgets/iot_devices_widget.dart';
import 'package:iotools/presentation/shared/advanced_button.dart';
import 'package:iotools/presentation/shared/chart.dart';
import 'package:iotools/presentation/shared/primary_button.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DetectorsBloc detectorsBloc;
  @override
  void initState() {
    detectorsBloc = context.read<DetectorsBloc>();
    detectorsBloc.add(GetDetectors());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            HomeAppBar(),
            SliverGap(30),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,

                  borderRadius: BorderRadius.circular(15),
                ),
                child: LineChartStable(),
              ),
            ),
            SliverGap(15),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    AdvancedButton(
                      text: 'Все помещения',
                      icon: Icon(Icons.factory),
                      onPressed: () {
                        context.router.push(RoomsRoute());
                      },
                    ),
                    Gap(15),
                    AdvancedButton(
                      text: 'Все устройства',
                      icon: Icon(Icons.device_hub),
                    ),
                  ],
                ),
              ),
            ),
            SliverGap(30),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Устройства',
                  style: AppFonts.getTextMedium(size: 22),
                ),
              ),
            ),
            BlocBuilder<DetectorsBloc, DetectorsState>(
              builder: (context, state) {
                if (state is DetectorsLoaded) {
                  return IoTDevicesWidget(detectors: state.detectors);
                } else {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      width: double.infinity,
                      height: 300,
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
