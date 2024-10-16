import 'package:flutter/material.dart';
import 'package:turdes/features/login/bloc/login_bloc.dart';
import 'package:turdes/features/login/view/login_screen.dart';
import 'package:turdes/product/service/manager/product_network_error_manager.dart';
import 'package:turdes/product/state/base/base_state.dart';
import 'package:turdes/product/state/container/product_state_items.dart';

mixin LoginScreenMixin on BaseState<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  late final LoginBloc _loginBloc;
  late final ProductNetworkErrorManager _productNetworkErrorManager;

  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );
    _loginBloc = LoginBloc(
      authenticationOperation: ProductStateItems.loginService,
      productCache: ProductStateItems.productCache,
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _loginBloc.close();
    super.dispose();
  }
}
