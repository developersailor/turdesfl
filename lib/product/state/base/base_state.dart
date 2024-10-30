import 'package:flutter/material.dart';
import 'package:turdes/features/aidrequest/bloc/aidrequest_bloc.dart';

import 'package:turdes/features/login/bloc/login_bloc.dart';
import 'package:turdes/features/register/bloc/register_bloc.dart';
import 'package:turdes/product/service/manager/index.dart';
import 'package:turdes/product/state/container/product_state_items.dart';
import 'package:turdes/product/state/view_model/product_view_model.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  ProductNetworkManager get productNetworkManager =>
      ProductStateItems.productNetworkManager;

  ProductViewModel get productViewModel => ProductStateItems.productViewModel;
  LoginBloc get loginBloc => ProductStateItems.loginBloc;
  AidrequestBloc get aidrequestBloc => ProductStateItems.aidrequestBloc;
  RegisterBloc get registerBloc => ProductStateItems.registerBloc;
}
