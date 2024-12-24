import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turdes/features/aidrequest/bloc/aidrequest_bloc.dart';
import 'package:turdes/product/state/base/base_state.dart';
import 'package:turdes/product/state/container/product_state_items.dart';
import 'package:widgets/widgets.dart';

class AidRequestDetailScreen extends StatefulWidget {
  const AidRequestDetailScreen({Key? key, required this.aidRequestId}) : super(key: key);

  final int aidRequestId;

  @override
  _AidRequestDetailScreenState createState() => _AidRequestDetailScreenState();
}

class _AidRequestDetailScreenState extends BaseState<AidRequestDetailScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<AidrequestBloc>().add(FetchAidrequestDetail(widget.aidRequestId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aid Request Details'),
      ),
      body: BlocBuilder<AidrequestBloc, AidrequestState>(
        builder: (context, state) {
          if (state is AidrequestLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AidrequestError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is AidrequestDetailLoaded) {
            final aidRequest = state.aidRequest;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Title: ${aidRequest.title}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text('Description: ${aidRequest.description}', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    if (aidRequest.document != null) Text('Document: ${aidRequest.document}', style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    if (aidRequest.photo != null) Image.network(aidRequest.photo!),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        labelText: 'Add a comment',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AidrequestBloc>().add(PostComment(widget.aidRequestId, _commentController.text));
                      },
                      child: const Text('Send'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('Unexpected state.'));
          }
        },
      ),
    );
  }
}
