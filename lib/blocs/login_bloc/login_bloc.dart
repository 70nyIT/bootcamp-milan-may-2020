import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:diarybootcamp/repositories/login_repository.dart';
import './bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository);

  @override
  LoginState get initialState => Uninitialized();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is CheckCurrentUser) {
      final user = await loginRepository.getCurrentUser();
      if (user != null) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    } else if (event is SignIn) {
      final user = await loginRepository.signIn(event.email, event.password);
      if (user != null) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    } else if (event is SignOut) {
      await loginRepository.signOut();
      yield Unauthenticated();
    } else if (event is Register) {
      final user = await loginRepository.register(event.email, event.password);
      if (user != null) {
        yield Authenticated();
      } else {
        yield Unauthenticated();
      }
    }
  }
}
