import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class ProceedToPasswordEvent extends AuthEvent {
  final String email;
  ProceedToPasswordEvent({required this.email});
  @override
  List<Object?> get props => [email];
}

class ProceedToEmailVerifyEvent extends AuthEvent {
  ProceedToEmailVerifyEvent();
  @override
  List<Object?> get props => [];
}

class ContinueToVerifyEvent extends AuthEvent {
  final String username;
  final dynamic password;
  final String emailUsername;
  final String emailPassword;
  ContinueToVerifyEvent({
    required this.username,
    required this.password,
    required this.emailUsername,
    required this.emailPassword,
  });

  @override
  List<Object?> get props => [
        username,
        password,
        emailUsername,
        emailPassword,
      ];
}

// swap
class FormModeChangedEvent extends AuthEvent {
  final bool isSignedIn;
  FormModeChangedEvent({required this.isSignedIn});

  @override
  List<Object?> get props => [isSignedIn];
}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent(
      {required this.name, required this.password, required this.email});

  @override
  List<Object?> get props => [email, name, password];
}
