import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/bloc/introduce/introduce_bloc.dart';
import 'package:iotools/core/router/router.gr.dart';
import 'package:iotools/core/theme/fonts.dart';
import 'package:iotools/presentation/shared/iot_input_field.dart';
import 'package:iotools/presentation/shared/primary_button.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class IntroduceScreen extends StatefulWidget {
  const IntroduceScreen({super.key});

  @override
  State<IntroduceScreen> createState() => _IntroduceScreenState();
}

class _IntroduceScreenState extends State<IntroduceScreen> {
  late IntroduceBloc introduceBloc;
  @override
  Widget build(BuildContext context) {
    introduceBloc = context.read<IntroduceBloc>();
    final codeController = TextEditingController();

    return BlocListener<IntroduceBloc, IntroduceState>(
      bloc: introduceBloc,
      listener: (context, state) {
        if (state is IntroduceSuccess) {
          context.router.push(LoginRoute(companyId: state.companyId));
        } else if (state is IntroduceLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return const Center(child: CircularProgressIndicator.adaptive());
            },
            barrierDismissible: true,
          );
        } else {
          Navigator.of(context).pop();
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Lottie.asset('assets/lottie/IoToolsAnimation.json'),
                          SizedBox(height: 40),
                          InputField(
                            text: 'Код вашего предприятия',
                            controller: codeController,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Код предприятия можно узнать у человека отвественного за регистрацию предприятия в нашем приложении',
                            style: AppFonts.getCompactRegular(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 70,
                    child: PrimaryButton(
                      text: 'Войти',
                      onPressed: () {
                        introduceBloc.add(
                          GetCompanyId(code: codeController.text),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
