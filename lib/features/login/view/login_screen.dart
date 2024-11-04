import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:logger/logger.dart';
import 'package:turdes/features/login/bloc/login_bloc.dart';
import 'package:turdes/features/login/bloc/login_state.dart';
import 'package:turdes/features/login/view/mixin/login_mixin.dart';
import 'package:turdes/product/init/language/locale_keys.g.dart';
import 'package:turdes/product/navigation/app_router.gr.dart';
import 'package:turdes/product/state/container/product_state_items.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          authenticationOperation: ProductStateItems.loginService,
          productCache: ProductStateItems.productCache,
        ),
        child: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.router.push(const AidrequestsRoute());
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget with LoginScreenMixin {
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: emailController,
            labelText: LocaleKeys.registerscreen_email.tr(),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: passwordController,
            labelText: LocaleKeys.loginscreen_password.tr(),
            obscureText: true,
          ),
          const SizedBox(height: 32),
          BlocBuilder<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              }
              return Column(
                children: [
                  CustomButton(
                    onPressed: () {
                      Logger().i('Login button pressed');
                      context.read<LoginBloc>().add(
                            LoginButtonPressed(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                    },
                    text: LocaleKeys.loginscreen_login.tr(),
                  ),
                  CustomButton(
                    onPressed: () {
                      context.router.push(RegisterRoute());
                    },
                    text: LocaleKeys.registerscreen_register.tr(),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
