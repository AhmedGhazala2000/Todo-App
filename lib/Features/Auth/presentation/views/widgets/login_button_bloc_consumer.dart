import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/Core/function/show_snack_bar.dart';
import 'package:todo_app/Core/utils/styles.dart';
import 'package:todo_app/Core/widgets/custom_buttons.dart';
import 'package:todo_app/Features/Home/presentation/views/home_view.dart';

import '../../manager/cubits/auth_cubit/auth_cubit.dart';

class LoginButtonBlocConsumer extends StatelessWidget {
  const LoginButtonBlocConsumer({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          showSnackBar(context,
              message: 'Login Success, Welcome', color: Colors.green);
          Navigator.pushNamedAndRemoveUntil(
            context,
            HomeView.id,
            (route) => false,
          );
        } else if (state is LoginFailureState) {
          showSnackBar(context, message: state.errMessage, color: Colors.red);
        }
      },
      builder: (context, state) {
        return CustomButton(
          onPressed: onPressed,
          child: state is LoginLoadingState
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(color: Colors.white),
                )
              : Text(
                  'Sign In',
                  style: AppStyles.styleBold16.copyWith(color: Colors.white),
                ),
        );
      },
    );
  }
}
