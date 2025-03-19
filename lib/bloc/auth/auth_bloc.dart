import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:iotools/data/model/datasource/remote/remote_datasoure.dart';
import 'package:iotools/data/model/user/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RemoteDatasoure remoteDatasoure;
  AuthBloc(this.remoteDatasoure) : super(AuthInitial()) {
    on<SignIn>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = User(email: event.email, password: event.password);
        final response = await remoteDatasoure.signIn(user);
        debugPrint(response);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError());
      }
    });

    on<SignUp>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = User(
          companyId: event.companyId,
          isMaster: true,
          name: event.name,
          email: event.email,
          password: event.password,
        );
        final response = await remoteDatasoure.signUp(user);
        debugPrint(response);
        emit(AuthSuccess());
      } catch (e) {
        emit(AuthError());
      }
    });
  }
}
