import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  bool get isLoading => false;
  bool get isSignedIn;
  const AuthState();
  @override
  List<Object?> get props => [isSignedIn, isLoading];
}

class InitialState extends AuthState {
  const InitialState();
  @override
  bool get isSignedIn => true;
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();
  @override
  bool get isLoading => true;
  @override
  bool get isSignedIn => true;

  @override
  List<Object?> get props => [isLoading];
}

class AppleIdContinueState extends AuthState {
  final String email;
  const AppleIdContinueState({
    required this.email,
  });
  @override
  bool get isSignedIn => true;
}

class AppleIdAuthenticatedState extends AuthState {
  const AppleIdAuthenticatedState();
  @override
  bool get isSignedIn => true;
  @override
  List<Object?> get props => [isSignedIn];
}

class EmailVerifiedState extends AuthState {
  final String emailAddress;
  final String password;
  const EmailVerifiedState(
      {required this.emailAddress, required this.password});
  @override
  bool get isSignedIn => true;
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
  bool get isSignedIn => false;
}

class AuthErrorState extends AuthState {
  final String message;
  const AuthErrorState({required this.message});
  @override
  List<Object?> get props => [message];
  @override
  bool get isSignedIn => true;
}

//swap
class FormModeChangedState extends AuthState {
  final bool isSignInMode;

  const FormModeChangedState({required this.isSignInMode});

  @override
  bool get isSignedIn => isSignInMode;

  @override
  List<Object?> get props => [isSignInMode];
}
