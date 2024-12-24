import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turdes/features/aidrequest/bloc/aidrequest_bloc.dart';
import 'package:turdes/product/state/base/base_state.dart';
import 'package:turdes/product/state/container/product_state_items.dart';
import 'package:widgets/widgets.dart';

class AidRequestListScreen extends StatefulWidget {
  const AidRequestListScreen({Key? key}) : super(key: key);

  @override
  _AidRequestListScreenState createState() => _AidRequestListScreenState();
}

class _AidRequestListScreenState extends BaseState<AidRequestListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aid Requests'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              context.read<AidrequestBloc>().add(FilterAidrequestList(value));
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'all',
                child: Text('All'),
              ),
              const PopupMenuItem(
                value: 'approved',
                child: Text('Approved'),
              ),
              const PopupMenuItem(
                value: 'pending',
                child: Text('Pending'),
              ),
              const PopupMenuItem(
                value: 'rejected',
                child: Text('Rejected'),
              ),
            ],
          ),
        ],
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
              return Center(child: Text('No aid requests available.'));
            } else if (state is AidrequestLoaded) {
              return AidRequestListView(aidrequests: state.aidRequests);
            } else {
              return Center(child: Text('Unexpected state.'));
            }
          },
        ),
      ),
    );
  }
}

class AidRequestListView extends StatelessWidget {
  const AidRequestListView({required this.aidrequests, Key? key})
      : super(key: key);

  final List<AidrequestResponse> aidrequests;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: aidrequests.length,
      itemBuilder: (context, index) {
        final aidrequest = aidrequests[index];
        return ListTile(
          title: Text(aidrequest.type.toString()),
          subtitle: Text(aidrequest.description.toString()),
          trailing: _buildStatusIcon(aidrequest.status),
        );
      },
    );
  }

  Widget _buildStatusIcon(String status) {
    switch (status) {
      case 'approved':
        return const Icon(Icons.check_circle, color: Colors.green);
      case 'pending':
        return const Icon(Icons.hourglass_empty, color: Colors.orange);
      case 'rejected':
        return const Icon(Icons.cancel, color: Colors.red);
      default:
        return const Icon(Icons.help, color: Colors.grey);
    }
  }
}
