import 'package:firebase_auth_demo/domain/cubits/authentication_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'screens/dashboard.dart';
import 'screens/login_view.dart';
import 'utils/size_config.dart';
import 'utils/utils.dart';

class AuthConsumer extends StatefulWidget {
  const AuthConsumer({
    super.key,
  });

  @override
  State<AuthConsumer> createState() => _AuthConsumerState();
}

class _AuthConsumerState extends State<AuthConsumer> {
  Widget loadingScaffold = const Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    setStatusBarColors();
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      bloc: context.read<AuthenticationCubit>(),
      buildWhen: (previous, current) {
        bool condition1 = previous != current;
        return condition1;
      },
      builder: (context, state) {
        return state.maybeWhen(
          unauthenticated: () => const LoginForm(),
          unknown: () {
            return loadingScaffold;
          },
          loggedIn: (currentUser) {
            return const Dashboard();
          },
          orElse: () => loadingScaffold,
        );
      },
      listener: (context, state) {
        logger.e(state);
      },
    );
  }
}
