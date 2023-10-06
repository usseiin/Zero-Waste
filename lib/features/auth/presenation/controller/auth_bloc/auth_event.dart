// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  final Map<String, dynamic> payload;
  const AuthEvent({required this.payload});

  @override
  List<Object?> get props => throw UnimplementedError();

  AuthEvent copyWith({Map<String, dynamic>? payload}) {
    return AuthEvent(payload: payload ?? this.payload);
  }
}

class LoginEvent extends AuthEvent {
  const LoginEvent({required super.payload});
}

class SignupEvent extends AuthEvent {
  final Map<String, dynamic>? userInfo;
  const SignupEvent({required super.payload, this.userInfo});
}

class ResetPasswordEvent extends AuthEvent {
  const ResetPasswordEvent({required super.payload});
}

class VerifyOtpEvent extends AuthEvent {
  const VerifyOtpEvent({required super.payload});
}
