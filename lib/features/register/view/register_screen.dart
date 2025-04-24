import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:turdes/features/register/bloc/register_bloc.dart';
import 'package:turdes/features/register/service/register_service.dart';
import 'package:turdes/product/init/language/locale_keys.g.dart';
import 'package:turdes/product/service/manager/product_service_manager.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => RegisterBloc(
            RegisterService(
              productServiceManager: ProductNetworkManager.base(),
            ),
          ),
      child: Scaffold(
        appBar: AppBar(title: Text(LocaleKeys.registerscreen_title.tr())),
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state.status == RegisterStatus.success) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Registration successful!')),
              );
            } else if (state.status == RegisterStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.errorMessage}')),
              );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextField(
                  controller: nameController,
                  labelText: LocaleKeys.registerscreen_name.tr(),
                ),
                CustomTextField(
                  controller: emailController,
                  labelText: LocaleKeys.registerscreen_email.tr(),
                ),
                CustomTextField(
                  controller: phoneController,
                  labelText: LocaleKeys.registerscreen_phone.tr(),
                ),
                CustomTextField(
                  controller: passwordController,
                  labelText: LocaleKeys.registerscreen_password.tr(),
                ),
                const SizedBox(height: 16),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state.status == RegisterStatus.loading) {
                      return const CircularProgressIndicator();
                    }
                    return CustomButton(
                      onPressed: () {
                        final payload = RegisterPayload(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                          password: passwordController.text,
                          role: 'aid_recipient',
                        );
                        context.read<RegisterBloc>().add(RegisterUser(payload));
                      },
                      text: LocaleKeys.registerscreen_register.tr(),
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
