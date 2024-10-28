import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turdes/features/aidrequest/bloc/aidrequest_bloc.dart';
import 'package:turdes/features/aidrequest/view/aidrequest_screen.dart';
import 'package:turdes/product/service/manager/product_network_error_manager.dart';
import 'package:turdes/product/state/base/base_state.dart';
import 'package:turdes/product/state/container/product_state_items.dart';

/// Manage your home view business logic
mixin AidrequestMixin on BaseState<AidrequestsScreen> {
  late final ProductNetworkErrorManager _productNetworkErrorManager;
  @override
  void initState() {
    super.initState();
    _productNetworkErrorManager = ProductNetworkErrorManager(context);
    ProductStateItems.productNetworkManager.listenErrorState(
      onErrorStatus: _productNetworkErrorManager.handleError,
    );
    context.read<AidrequestBloc>().add(FetchAidrequestList());
  }
}
