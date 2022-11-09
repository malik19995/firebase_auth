import 'package:firebase_auth_demo/data/constants/constants.dart';
import 'package:firebase_auth_demo/data/dto/sparkuser.dart';
import 'package:firebase_auth_demo/domain/cubits/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthenticationCubit>();
    var authState = cubit.state;
    SparkUser? sparkUser;
    authState.whenOrNull(
      loggedIn: (currentUser) {
        sparkUser = currentUser;
      },
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              cubit.logout();
            },
            icon: logoutIcon,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Woo Hoo! You\'re logged in'),
            Text(sparkUser?.name ?? 'N/A'),
            Text(sparkUser?.email ?? 'N/A'),
          ],
        ),
      ),
    );
  }
}
