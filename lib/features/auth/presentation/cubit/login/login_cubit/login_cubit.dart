import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/auth/data/models/login_model.dart';
import 'package:med_dos/features/auth/data/repository/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepository authRepo;
  GlobalKey<FormState>loginKey = GlobalKey<FormState>(debugLabel: '3');
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;

  void changeLoginPasswordSuffixIcon() {
    isLoginPasswordShowing = !isLoginPasswordShowing;
    suffixIcon =
    isLoginPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeLoginPasswordSuffixIcon());
  }

  //login method
  LoginModel? loginModel;

  void login() async {

      emit(LoginLoadingState());
      final result = await authRepo.login(
          email: emailController.text,
          password: passwordController.text);
      result.fold(
            (l) => emit(LoginErrorState(l)),
            (r) async {
          loginModel = r;

          await sl<CacheHelper>().saveData(
              key: ApiKeys.token,
              value: r.token,
          );
          emit(LoginSucessState());
        },
      );

  }

}
