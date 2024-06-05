import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/utils/local_network.dart';
import 'package:todo_app/Features/Splash/presentation/views/splash_view.dart';

import 'Core/utils/constant.dart';
import 'Core/utils/service_locator.dart';
import 'Core/utils/simple_bloc_observers.dart';
import 'Features/Auth/data/repos/auth_repo_impl.dart';
import 'Features/Auth/presentation/manager/auth_cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObservers();
  await CachedNetwork.init();
  setupServiceLocator();
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(getIt.get<AuthRepoImpl>()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'DM Sans',
          datePickerTheme: DatePickerThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        routes: appRoutes(),
        initialRoute: SplashView.id,
      ),
    );
  }
}
