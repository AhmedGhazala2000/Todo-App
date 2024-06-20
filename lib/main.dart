import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/Core/utils/local_network.dart';
import 'package:todo_app/Features/Splash/presentation/views/splash_view.dart';

import 'Core/utils/constant.dart';
import 'Core/utils/dependency_injection.dart';
import 'Core/utils/simple_bloc_observers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObservers();
  await CachedNetwork.init();
  setupDependencyInjection();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const ToDoApp(),
    ),
  );
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 975),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
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
