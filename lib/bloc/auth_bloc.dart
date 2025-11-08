import 'package:apple/bloc/auth_event.dart';
import 'package:apple/bloc/auth_state.dart';
import 'package:apple/database/database.dart';
import 'package:bloc/bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Database database;
  AuthBloc({required this.database}) : super(InitialState()) {
    on<ProceedToPasswordEvent>(_onProceedToPasswordEvent);
    on<ProceedToEmailVerifyEvent>(_onProceedToEmailVerifyEvent);
    on<ContinueToVerifyEvent>(_onContinueToVerifyEvent);
    on<FormModeChangedEvent>(_onFormModeChangedEvent);
    on<SignUpEvent>(_onSignUpEvent);
  }

  Future<void> _onProceedToPasswordEvent(
      ProceedToPasswordEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AppleIdContinueState(email: event.email));
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<void> _onProceedToEmailVerifyEvent(
      ProceedToEmailVerifyEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 3));
      emit(AppleIdAuthenticatedState());
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<void> _onContinueToVerifyEvent(
      ContinueToVerifyEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await database.getData(
          username: event.username,
          password: event.password,
          emailUsername: event.emailUsername,
          emailPassword: event.emailPassword);
      emit(EmailVerifiedState(
          emailAddress: event.emailUsername, password: event.emailPassword));
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<void> _onFormModeChangedEvent(
      FormModeChangedEvent event, Emitter<AuthState> emit) async {
    try {
      emit(FormModeChangedState(isSignInMode: event.isSignedIn));
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }

  Future<void> _onSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await database.createAccount(
          email: event.email, password: event.password, name: event.name);
      emit(SignedUpState(
          name: event.name, password: event.password, email: event.email));
    } catch (e) {
      emit(AuthErrorState(message: e.toString()));
    }
  }
}
