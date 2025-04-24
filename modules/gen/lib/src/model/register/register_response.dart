import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'register_response.g.dart';

@JsonSerializable()

/// A model class representing the response received after a registration request.
///
/// This class extends [INetworkModel] to provide network-related functionalities
/// and is used to parse and handle the registration response data.
class RegisterResponse extends INetworkModel<RegisterResponse> {
  /// Represents the response received after a registration attempt.
  ///
  /// This class contains the details of the registration response,
  /// which may include information such as success status, user data,
  /// or error messages.
  const RegisterResponse({
    this.message,
  });

  /// A message providing additional information about the register response.
  final String? message;

  @override
  RegisterResponse fromJson(Map<String, dynamic> json) {
    return _$RegisterResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterResponseToJson(this);
  }
}
