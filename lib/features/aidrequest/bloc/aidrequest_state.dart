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

class AidrequestCreate extends AidrequestState {
  const AidrequestCreate(this.aidRequest);
  final AidrequestResponse aidRequest;
}

class AidrequestCreateError extends AidrequestState {
  const AidrequestCreateError(this.message);
  final String message;
}

class AidrequestError extends AidrequestState {
  const AidrequestError(this.message);
  final String message;
}

class AidrequestDetailLoaded extends AidrequestState {
  const AidrequestDetailLoaded(this.aidRequest);
  final AidrequestResponse aidRequest;
}

class AidrequestCommentPosted extends AidrequestState {
  const AidrequestCommentPosted();
}
