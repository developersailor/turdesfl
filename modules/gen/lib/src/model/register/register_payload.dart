/**
 * {
  "name": "John Doe",
  "email": "john.doe@example.com",
  "phone": "1234567890",
  "password": "Password123",
  "role": "aid_recipient"
} 

 */
library;

class RegisterPayload {
  RegisterPayload({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.role,
  });
  String name;
  String email;
  String phone;
  String password;
  String role;
}
