// aidrequest_event.dart
part of 'aidrequest_bloc.dart';

abstract class AidrequestEvent {
  const AidrequestEvent();
}

class FetchAidrequestList extends AidrequestEvent {}

class CreateAidrequest extends AidrequestEvent {
  CreateAidrequest(this.request);
  final AidrequestPayload request;
}
