import 'package:bloc_api_project/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().onLoadedUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UsersLoadedState) {
            return ListView.builder(
              itemCount: state.usersModel.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(state.usersModel[index].address!.street.toString());
              },
            );
          } else if (state is UsersErrorState) {
            return Text(state.errorMessage);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
