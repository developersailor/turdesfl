import 'package:turdes/features/aidrequest/bloc/aidrequest_bloc.dart';

import 'package:turdes/features/aidrequest/services/aidrequest_service.dart';
import 'package:turdes/features/login/bloc/login_bloc.dart';
import 'package:turdes/product/init/index.dart';
import 'package:turdes/features/login/service/login_service.dart';
import 'package:turdes/product/service/manager/index.dart';
import 'package:turdes/product/state/container/product_state_container.dart';
import 'package:turdes/product/state/view_model/product_view_model.dart';

final class ProductStateItems {
  const ProductStateItems._();

  static ProductNetworkManager get productNetworkManager =>
      ProductContainer.read<ProductNetworkManager>();

  static ProductViewModel get productViewModel =>
      ProductContainer.read<ProductViewModel>();

  static ProductCache get productCache => ProductContainer.read<ProductCache>();
  static LoginService get loginService => ProductContainer.read<LoginService>();
  static LoginBloc get loginBloc => ProductContainer.read<LoginBloc>();
  static AidrequestBloc get aidrequestBloc =>
      ProductContainer.read<AidrequestBloc>();
  static AidrequestService get aidrequestService =>
      ProductContainer.read<AidrequestService>();
}
