import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Core/utils/service_locator.dart';
import 'Core/utils/simple_bloc_observers.dart';
import 'Features/Auth/data/repos/auth_repo_impl.dart';
import 'Features/Auth/presentation/manager/cubits/auth_cubit/auth_cubit.dart';
import 'Features/Splash/presentation/views/splash_view.dart';

void main() {
  Bloc.observer = SimpleBlocObservers();
  setupServiceLocator();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<RegisterRepoImpl>()),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'DM Sans',
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashView(),
      ),
    );
  }
}
