part of 'signin_status_cubit.dart';

enum SigninStatus {
  initial,
  submitting,
  success,
  error,
}

class SigninState extends Equatable {
  SigninState({required this.signinStatus, required this.customError});

  final SigninStatus signinStatus;
  final CustomError customError;

  factory SigninState.initial() {
    return SigninState(
      signinStatus: SigninStatus.initial,
      customError: CustomError(),
    );
  }

  @override
  List<Object> get props => [signinStatus, customError];

  @override
  String toString() {
    return 'SigninState{signinStatus=$signinStatus, customError=$customError}';
  }

  SigninState copyWith({SigninStatus? signinStatus, CustomError? customError}) {
    return SigninState(
        signinStatus: signinStatus ?? this.signinStatus,
        customError: customError ?? this.customError);
  }
}
