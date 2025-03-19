import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/bloc/auth/auth_bloc.dart';
import 'package:iotools/core/router/router.gr.dart';
import 'package:iotools/core/theme/fonts.dart';
import 'package:iotools/presentation/shared/iot_input_field.dart';
import 'package:iotools/presentation/shared/primary_button.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.companyId});

  final int companyId;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthBloc _authBloc;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _authBloc = context.read<AuthBloc>();

    final theme = Theme.of(context);
    return BlocListener(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is AuthLoading) {
          showDialog(
            context: context,
            builder: (context) {
              return Center(child: CircularProgressIndicator.adaptive());
            },
            barrierDismissible: false,
          );
        } else if (state is AuthError) {
          Navigator.of(context).pop();
        } else if (state is AuthSuccess) {
          Navigator.of(context).pop();
          context.router.replace(HomeRoute());
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: 50),
                            InputField(
                              controller: emailController,
                              text: 'Почта',
                              icon: Icon(
                                Icons.mail_outline,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            SizedBox(height: 20),
                            InputField(
                              controller: passwordController,
                              text: 'Пароль',
                              obscureText: true,
                              icon: Icon(
                                Icons.key,
                                color: theme.colorScheme.primary,
                              ),
                            ),
                            GestureDetector(
                              onTap:
                                  () => context.router.replace(
                                    RegistrationRoute(
                                      companyId: widget.companyId,
                                    ),
                                  ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  'Еще нету аккаунта?',
                                  style: AppFonts.getCompactRegular(
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: SizedBox(
                    height: 70,
                    child: PrimaryButton(
                      fontSize: 24,
                      text: 'Войти',
                      onPressed:
                          () => _authBloc.add(
                            SignIn(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
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
