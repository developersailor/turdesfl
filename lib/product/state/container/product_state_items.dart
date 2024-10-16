import 'package:turdes/features/login/bloc/login_bloc.dart';
import 'package:turdes/product/init/index.dart';
import 'package:turdes/product/service/login_service.dart';
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
}
