part of 'aidrequest_bloc.dart';

abstract class AidrequestEvent {
  const AidrequestEvent();
}

class FetchAidrequestList extends AidrequestEvent {}

class CreateAidrequest extends AidrequestEvent {
  CreateAidrequest(this.request);
  final AidrequestPayload request;
}

class FetchAidrequestDetail extends AidrequestEvent {
  const FetchAidrequestDetail(this.aidRequestId);
  final int aidRequestId;
}

class PostComment extends AidrequestEvent {
  const PostComment(this.aidRequestId, this.comment);
  final int aidRequestId;
  final String comment;
}

class FilterAidrequestList extends AidrequestEvent {
  const FilterAidrequestList(this.filter);
  final String filter;
}
