import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/database/cache/cache_helper.dart';
import 'package:med_dos/core/service/service_locatro.dart';
import 'package:med_dos/features/auth/data/models/register_model.dart';
import 'package:med_dos/features/auth/data/repository/auth_repository.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo,) : super(RegisterInitial());
  final AuthRepository authRepo;
  GlobalKey<FormState>registerKey = GlobalKey<FormState>(debugLabel: '4');
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController datePickerController = TextEditingController();
  bool isRegisterPasswordShowing = true;
  bool isRegisterConfirmPasswordShowing = true;
  IconData suffixIcon = Icons.visibility;
  IconData suffixIconConfirm = Icons.visibility;

  void changeRegisterPasswordSuffixIcon() {
    isRegisterPasswordShowing = !isRegisterPasswordShowing;
    suffixIcon =
    isRegisterPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeRegisterPasswordSuffixIcon());
  }
  void changeConfirmRegisterPasswordSuffixIcon() {
    isRegisterConfirmPasswordShowing = !isRegisterConfirmPasswordShowing;
    suffixIconConfirm =
    isRegisterConfirmPasswordShowing ? Icons.visibility : Icons.visibility_off;
    emit(ChangeRegisterConfirmPasswordSuffixIcon());
  }

  RegisterModel?registerModel;
  TextEditingController codeController = TextEditingController();
  TextEditingController gender = TextEditingController();
  void register() async {
    print(groupVal);
    emit(RegisterLoadingState());
    final result = await authRepo.register(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phone: phoneController.text,
        email: emailController.text,
        password: passwordController.text,
       // confirmPassword: confirmPasswordController.text,
        date: datePickerController.text,
      code: codeController.text,
      gender: groupVal,

    );
    result.fold((l) => emit(RegisterErrorState(l)), (r) async{
      registerModel=r;
      await sl<CacheHelper>().saveData(key: ApiKeys.token, value: r.token);
      emit(RegisterSucessState());
    });
  }


  void sendCodeRegister() async {
    emit(SendCodeRegisterLoading());
    final res = await authRepo.registerSendCode(emailController.text);
    res.fold((l) => emit(SendCodeRegisterError(l)),
            (r) => emit(RegisterSendCodeSucess(r)));
  }


  String groupVal = 'male';
  void changeGroupVal(val) {
    groupVal = val;
    emit(ChangeGroupState());
  }
  
  
  onTapFunction({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1900),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    datePickerController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
  }
}
