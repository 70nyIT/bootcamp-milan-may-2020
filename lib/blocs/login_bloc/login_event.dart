import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class SignIn extends LoginEvent {
  final String email;
  final String password;

  SignIn(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}

class SignOut extends LoginEvent {
  @override
  List<Object> get props => [];
}

class CheckCurrentUser extends LoginEvent {
  @override
  List<Object> get props => [];
}

class Register extends LoginEvent {
  final String email;
  final String password;

  Register(this.email, this.password);
  @override
  List<Object> get props => [email, password];
}
