import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:turdes/features/aidrequest/services/aidrequest_service.dart';

part 'aidrequest_event.dart';
part 'aidrequest_state.dart';

class AidrequestBloc extends Bloc<AidrequestEvent, AidrequestState> {
  AidrequestBloc(this.aidrequestService) : super(AidrequestInitial()) {
    on<FetchAidrequestList>(_onFetchAidrequestList);
    on<CreateAidrequest>(_onCreateAidrequest);
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

  Future<void> _onCreateAidrequest(
    CreateAidrequest event,
    Emitter<AidrequestState> emit,
  ) async {
    emit(AidrequestLoading());
    try {
      final aidRequest =
          await aidrequestService.createAidrequest(event.request);
      print('Aid Request: $aidRequest'); // Debugging output
      if (aidRequest != null) {
        emit(AidrequestCreate(aidRequest));
        // Fetch the updated list of aid requests after creation
        add(FetchAidrequestList());
      } else {
        emit(const AidrequestEmpty());
      }
    } catch (e) {
      print('Error: $e'); // Debugging output
      emit(AidrequestCreateError(e.toString()));
    }
  }
}
