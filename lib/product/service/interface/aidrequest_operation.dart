import 'package:gen/gen.dart';

abstract class AidrequestOperation {
  Future<List<AidrequestResponse>> getAidrequestList();
  // Future<AidrequestResponse?> getAidrequestDetail(String id);
  Future<AidrequestResponse?> createAidrequest(AidrequestPayload? request);
  // Future<AidrequestResponse?> updateAidrequest(
  //   String id,
  //   AidrequestUpdatePayload? request,
  // );
  // Future<AidrequestResponse?> deleteAidrequest(String id);
  // Future<AidrequestUpdateRequest?> updateAidrequestStatus(
  //   String id,
  //   AidrequestUpdatePayload? request,
  // );
}
