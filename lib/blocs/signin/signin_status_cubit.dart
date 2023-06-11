import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_bloc/repositories/auth_repository.dart';

import '../../models/custom_error.dart';

part 'signin_status_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepository authRepository;
  SigninCubit({required this.authRepository}) : super(SigninState.initial());

  Future<void> signin({required String email, required String password}) async {
    emit(
      state.copyWith(signinStatus: SigninStatus.submitting),
    );

    try {
      await authRepository.signin(email: email, password: password);
      emit(
        state.copyWith(signinStatus: SigninStatus.success),
      );
    } on CustomError catch (e) {
      emit(
        state.copyWith(
          signinStatus: SigninStatus.error,
          customError: e,
        ),
      );
    }
  }
}
