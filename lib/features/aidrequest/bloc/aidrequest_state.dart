// aidrequest_state.dart
part of 'aidrequest_bloc.dart';

abstract class AidrequestState {
  const AidrequestState();
}

class AidrequestInitial extends AidrequestState {}

class AidrequestLoading extends AidrequestState {}

class AidrequestLoaded extends AidrequestState {
  const AidrequestLoaded(this.aidRequests);
  final List<AidrequestResponse> aidRequests;
}

class AidrequestEmpty extends AidrequestState {
  const AidrequestEmpty();
}

class AidrequestError extends AidrequestState {
  const AidrequestError(this.message);
  final String message;
}
