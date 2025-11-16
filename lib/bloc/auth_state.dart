import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  bool get isChecked => false;
  bool get isLoading => false;
  bool get isSignInMode => true;
  const AuthState();
  @override
  List<Object?> get props => [isSignInMode, isLoading];
}

class InitialState extends AuthState {
  const InitialState();
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
  @override
  bool get isLoading => true;

  @override
  List<Object?> get props => [isLoading];
}

class AppleIdContinueState extends AuthState {
  final String email;
  const AppleIdContinueState({
    required this.email,
  });
  @override
  bool get isSignInMode => true;
}

class AppleIdAuthenticatedState extends AuthState {
  const AppleIdAuthenticatedState();
  @override
  bool get isSignInMode => true;
  @override
  List<Object?> get props => [isSignInMode];
}

class EmailVerifiedState extends AuthState {
  final String emailAddress;
  final String password;
  const EmailVerifiedState(
      {required this.emailAddress, required this.password});
  @override
  bool get isSignInMode => true;
}

class SignedUpState extends AuthState {
  final String name;
  final String email;
  final dynamic password;

  const SignedUpState(
      {required this.name, required this.password, required this.email});

  @override
  List<Object?> get props => [email, name, password];

  @override
  bool get isSignInMode => false;
}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message});
  @override
  List<Object?> get props => [message];
  @override
  bool get isSignInMode => true;
}

//swap
class FormModeChangedState extends AuthState {
  final bool signInMode;

  const FormModeChangedState({required this.signInMode});

  @override
  bool get isSignInMode => signInMode; // Use the parameter

  @override
  List<Object?> get props => [signInMode];
}

//checkbox
class CheckboxState extends AuthState {
  final bool checker;
  const CheckboxState({required this.checker});

  @override
  bool get isChecked => checker;
  @override
  List<Object?> get props => [isChecked];
}
