import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:turdes/features/aidrequest/bloc/aidrequest_bloc.dart';
import 'package:turdes/features/aidrequest/view/aidrequest_mixin.dart';
import 'package:turdes/product/init/language/locale_keys.g.dart';
import 'package:turdes/product/state/base/base_state.dart';
import 'package:turdes/product/state/container/product_state_items.dart';
import 'package:turdes/product/widget/bottom_model_sheet/bottom_model_sheet.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class AidrequestsScreen extends StatefulWidget {
  const AidrequestsScreen({super.key});

  @override
  State<AidrequestsScreen> createState() => _AidrequestsScreenState();
}

class _AidrequestsScreenState extends BaseState<AidrequestsScreen>
    with AidrequestMixin {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AidrequestBloc, AidrequestState>(
      listener: (context, state) {
        if (state is AidrequestCreate) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(LocaleKeys.aidrequestscreen_success.tr())),
          );
        } else if (state is AidrequestCreateError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.message}')),
          );
        }
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await ShowSheetMixin.showCustomSheet<AidRequestCreateView>(
              context: context,
              child: AidRequestCreateView(),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<AidrequestBloc>().add(FetchAidrequestList());
          },
          child: BlocBuilder<AidrequestBloc, AidrequestState>(
            builder: (context, state) {
              if (state is AidrequestLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is AidrequestError) {
                return Center(child: Text('Error: ${state.message}'));
              } else if (state is AidrequestEmpty) {
                return Center(
                  child: Text(LocaleKeys.aidrequestscreen_emptyState.tr()),
                );
              } else if (state is AidrequestLoaded) {
                return AidrequestsList(aidrequests: state.aidRequests);
              } else if (state is AidrequestCreate) {
                // Handle the state after creation
                return SnackBar(
                  content: Text(LocaleKeys.aidrequestscreen_success.tr()),
                );
              } else {
                return Center(
                  child: Text(LocaleKeys.aidrequestscreen_unexpectedState.tr()),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class AidRequestCreateView extends StatefulWidget {
  AidRequestCreateView({super.key});
  final TextEditingController typeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  State<AidRequestCreateView> createState() => _AidRequestCreateViewState();
}

class _AidRequestCreateViewState extends State<AidRequestCreateView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: widget.typeController,
          labelText: LocaleKeys.aidrequestscreen_type.tr(),
        ),
        CustomTextField(
          controller: widget.descriptionController,
          labelText: LocaleKeys.aidrequestscreen_description.tr(),
        ),
        CustomButton(
          onPressed: () async {
            final id = await ProductStateItems.productCache.loginCacheOperation
                .read('userId');
            if (!context.mounted) return;
            context.read<AidrequestBloc>().add(
                  CreateAidrequest(
                    AidrequestPayload(
                      type: widget.typeController.text,
                      description: widget.descriptionController.text,
                      status: 'pending',
                      userId: int.parse(id ?? '0'),
                      organizationId: 1,
                    ),
                  ),
                );
          },
          text: LocaleKeys.aidrequestscreen_create.tr(),
        ),
      ],
    );
  }
}

class AidrequestsList extends StatelessWidget {
  const AidrequestsList({required this.aidrequests, super.key});

  final List<AidrequestResponse> aidrequests;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      itemCount: aidrequests.length,
      itemBuilder: (context, index) {
        final aidrequest = aidrequests[index];
        return ListTile(
          title: Text(aidrequest.type.toString()),
          subtitle: Text(aidrequest.description.toString()),
        );
      },
    );
  }
}
