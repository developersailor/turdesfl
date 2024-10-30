import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turdes/features/aidrequest/bloc/aidrequest_bloc.dart';
import 'package:turdes/features/login/bloc/login_bloc.dart';
import 'package:turdes/features/register/bloc/register_bloc.dart';
import 'package:turdes/product/state/container/index.dart';
import 'package:turdes/product/state/view_model/product_view_model.dart';

final class StateInitialize extends StatelessWidget {
  const StateInitialize({required this.child, super.key});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductViewModel>.value(
          value: ProductStateItems.productViewModel,
        ),
        BlocProvider<LoginBloc>.value(
          value: ProductStateItems.loginBloc,
        ),
        BlocProvider<AidrequestBloc>.value(
          value: ProductStateItems.aidrequestBloc,
        ),
        RepositoryProvider(
          create: (context) => ProductStateItems.aidrequestService,
        ),
        RepositoryProvider(
          create: (context) => ProductStateItems.registerService,
        ),
        BlocProvider<RegisterBloc>.value(
          value: ProductStateItems.registerBloc,
        ),
      ],
      child: child,
    );
  }
}
