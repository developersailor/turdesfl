class AidrequestPayload {
  const AidrequestPayload({
    this.userId,
    this.organizationId,
    this.type,
    this.description,
    this.status,
  });
  final int? userId;
  final int? organizationId;
  final String? type;
  final String? description;
  final String? status;
}
