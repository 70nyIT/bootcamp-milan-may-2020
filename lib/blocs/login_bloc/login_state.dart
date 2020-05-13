import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class Uninitialized extends LoginState {
  @override
  List<Object> get props => [];
}

class Authenticated extends LoginState {
  @override
  List<Object> get props => [];
}

class Unauthenticated extends LoginState {
  @override
  List<Object> get props => [];
}
