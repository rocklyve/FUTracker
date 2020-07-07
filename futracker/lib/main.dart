import 'package:FUTracker/auth/authentication.dart';
import 'package:FUTracker/repository/user_repository.dart';
import 'package:FUTracker/ui/home.dart';
import 'package:FUTracker/uicomponents/loading_indicator.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FUTracker/ui/login/login_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// this is just an instance to print all events, transitions and errors from BLoC
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  final userRepository = UserRepository();

  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
      child: MyApp(userRepository: userRepository),
    ),
  );
}

final OptimisticCache cache = OptimisticCache(
  dataIdFromObject: typenameDataIdFromObject,
);

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FUTracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
        if (state is AuthenticationSuccess) {
          return Home();
        } else if (state is AuthenticationFailure) {
          return LoginScreen(userRepository: userRepository);
        } else if (state is AuthenticationInProgress) {
          return LoadingIndicator();
        } else {
          return LoginScreen(userRepository: userRepository);
        }
      }),
    );
  }
}
