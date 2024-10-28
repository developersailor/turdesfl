import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:turdes/features/aidrequest/bloc/aidrequest_bloc.dart';
import 'package:turdes/features/aidrequest/view/aidrequest_mixin.dart';
import 'package:turdes/product/state/base/base_state.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aid Requests'),
      ),
      body: BlocBuilder<AidrequestBloc, AidrequestState>(
        builder: (context, state) {
          if (state is AidrequestLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AidrequestError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is AidrequestEmpty) {
            return const Center(child: Text('No aid requests available.'));
          } else if (state is AidrequestLoaded) {
            return AidrequestsList(aidrequests: state.aidRequests);
          } else {
            return const Center(child: Text('Unexpected state.'));
          }
        },
      ),
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
