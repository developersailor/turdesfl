import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gen/gen.dart';
import 'package:turdes/features/aidrequest/services/aidrequest_service.dart';

part 'aidrequest_event.dart';
part 'aidrequest_state.dart';

class AidrequestBloc extends Bloc<AidrequestEvent, AidrequestState> {
  AidrequestBloc(this.aidrequestService) : super(AidrequestInitial()) {
    on<FetchAidrequestList>(_onFetchAidrequestList);
    on<CreateAidrequest>(_onCreateAidrequest);
    on<FetchAidrequestDetail>(_onFetchAidrequestDetail);
    on<PostComment>(_onPostComment);
    on<FilterAidrequestList>(_onFilterAidrequestList);
  }
  final AidrequestService aidrequestService;

  Future<void> _onFetchAidrequestList(
    FetchAidrequestList event,
    Emitter<AidrequestState> emit,
  ) async {
    emit(AidrequestLoading());
    try {
      final aidRequests = await aidrequestService.getAidrequestList();

      if (aidRequests.isEmpty) {
        emit(const AidrequestEmpty());
      } else {
        emit(AidrequestLoaded(aidRequests));
      }
    } catch (e) {
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

      if (aidRequest != null) {
        emit(AidrequestCreate(aidRequest));
        // Fetch the updated list of aid requests after creation
        add(FetchAidrequestList());
      } else {
        emit(const AidrequestEmpty());
      }
    } catch (e) {
      emit(AidrequestCreateError(e.toString()));
    }
  }

  Future<void> _onFetchAidrequestDetail(
    FetchAidrequestDetail event,
    Emitter<AidrequestState> emit,
  ) async {
    emit(AidrequestLoading());
    try {
      final aidRequest = await aidrequestService.getAidrequestDetail(event.aidRequestId);

      if (aidRequest != null) {
        emit(AidrequestDetailLoaded(aidRequest));
      } else {
        emit(const AidrequestEmpty());
      }
    } catch (e) {
      emit(AidrequestError(e.toString()));
    }
  }

  Future<void> _onPostComment(
    PostComment event,
    Emitter<AidrequestState> emit,
  ) async {
    emit(AidrequestLoading());
    try {
      final success = await aidrequestService.postComment(event.aidRequestId, event.comment);

      if (success) {
        emit(const AidrequestCommentPosted());
      } else {
        emit(const AidrequestError('Failed to post comment'));
      }
    } catch (e) {
      emit(AidrequestError(e.toString()));
    }
  }

  Future<void> _onFilterAidrequestList(
    FilterAidrequestList event,
    Emitter<AidrequestState> emit,
  ) async {
    emit(AidrequestLoading());
    try {
      final aidRequests = await aidrequestService.getAidrequestList();
      final filteredAidRequests = aidRequests.where((aidRequest) {
        return aidRequest.status == event.filter;
      }).toList();

      if (filteredAidRequests.isEmpty) {
        emit(const AidrequestEmpty());
      } else {
        emit(AidrequestLoaded(filteredAidRequests));
      }
    } catch (e) {
      emit(AidrequestError(e.toString()));
    }
  }
}
