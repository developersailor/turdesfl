import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:logger/logger.dart';
import 'package:turdes/features/login/bloc/login_bloc.dart';
import 'package:turdes/features/login/bloc/login_state.dart';
import 'package:turdes/features/login/view/mixin/login_mixin.dart';
import 'package:turdes/product/navigation/app_router.gr.dart';
import 'package:turdes/product/state/base/base_state.dart';
import 'package:turdes/product/state/container/product_state_items.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen> with LoginScreenMixin {
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
              Logger().i('Login successful, navigating to HomeRoute');
              context.router.push(const HomeRoute());
            } else if (state is LoginFailure) {
              Logger().e('Login failed: ${state.error}');
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'E-posta'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(labelText: 'Şifre'),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const CircularProgressIndicator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        Logger().i('Login button pressed');
                        context.read<LoginBloc>().add(
                              LoginButtonPressed(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      },
                      child: const Text('Giriş Yap'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
