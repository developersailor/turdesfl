// aidrequest_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:turdes/features/aidrequest/services/aidrequest_service.dart';

part 'aidrequest_event.dart';
part 'aidrequest_state.dart';

class AidrequestBloc extends Bloc<AidrequestEvent, AidrequestState> {
  AidrequestBloc(this.aidrequestService) : super(AidrequestInitial()) {
    on<FetchAidrequestList>(_onFetchAidrequestList);
  }
  final AidrequestService aidrequestService;

  Future<void> _onFetchAidrequestList(
    FetchAidrequestList event,
    Emitter<AidrequestState> emit,
  ) async {
    emit(AidrequestLoading());
    try {
      final aidRequests = await aidrequestService.getAidrequestList();
      print('Aid Requests: $aidRequests'); // Debugging output
      if (aidRequests.isEmpty) {
        emit(const AidrequestEmpty());
      } else {
        emit(AidrequestLoaded(aidRequests));
      }
    } catch (e) {
      print('Error: $e'); // Debugging output
      emit(AidrequestError(e.toString()));
    }
  }
}
