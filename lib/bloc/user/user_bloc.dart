import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iotools/data/datasource/remote/remote_datasoure.dart';
import 'package:iotools/data/model/user/user.dart';

/// События для UserBloc
abstract class UserEvent {}

class GetUsers extends UserEvent {}

/// Состояния для UserBloc
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UsersLoaded extends UserState {
  final List<User> users;
  UsersLoaded(this.users);
}

class UserError extends UserState {
  final String message;
  UserError(this.message);
}

/// UserBloc для загрузки списка пользователей
class UserBloc extends Bloc<UserEvent, UserState> {
  final RemoteDatasoure datasoure;

  UserBloc(this.datasoure) : super(UserInitial()) {
    on<GetUsers>((event, emit) async {
      try {
        emit(UserLoading());
        final users = await datasoure.getUsers();
        emit(UsersLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
