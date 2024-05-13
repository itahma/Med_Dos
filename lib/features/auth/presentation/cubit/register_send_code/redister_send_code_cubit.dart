

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/features/auth/data/repository/auth_repository.dart';

import 'redister_send_code_state.dart';

class RegisterSendCodeCubit extends Cubit<RegisterSendCodeState> {
  RegisterSendCodeCubit(this.authRepository) : super(RegisterSendCodeInitial());
  GlobalKey<FormState>sendCodeKeyRegister = GlobalKey<FormState>();
  TextEditingController registerCodeController = TextEditingController();
  final AuthRepository authRepository;
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController datePickerController = TextEditingController();

  void registerSend() async {
    emit(RegisterSendCodeLoading());
    final res = await authRepository.registerSend(
      date: datePickerController.text,
      firstName: datePickerController.text,
      lastName:lastNameController.text,
      phone: phoneController.text,
      email:  emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      code: codeController.text,


    );
    res.fold((l) => emit(RegisterSendCodeError(l)),
            (r) => emit(RegisterSendCodeSuccess(r)));
  }


}
