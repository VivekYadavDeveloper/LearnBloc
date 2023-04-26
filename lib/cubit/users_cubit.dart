import 'package:bloc/bloc.dart';
import 'package:bloc_api_project/repo/users.repo.dart';
import 'package:equatable/equatable.dart';

import '../models/users.model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRepo usersRepo;
  UsersCubit(this.usersRepo) : super(UsersLoadingState());

  onLoadedUser() async {
    try {
      emit(UsersLoadingState());
      var dataResponse = await usersRepo.getUsersList();

      emit(UsersLoadedState(dataResponse));
    } catch (e) {
      emit(UsersErrorState(e.toString()));
    }
  }
}
