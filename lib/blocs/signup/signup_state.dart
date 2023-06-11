part of 'signup_cubit.dart';

enum SignupStatus {
  initial,
  submitting,
  success,
  error,
}

class SignupState extends Equatable {
  SignupState({required this.signupStatus, required this.error});

  final SignupStatus signupStatus;
  final CustomError error;

  factory SignupState.initial() {
    return SignupState(
      signupStatus: SignupStatus.initial,
      error: CustomError(),
    );
  }

  @override
  List<Object?> get props => [signupStatus, error];

  @override
  String toString() {
    return 'SignupState{signupStatus=$signupStatus, error=$error}';
  }

  SignupState copyWith({SignupStatus? signupStatus, CustomError? error}) {
    return SignupState(
        signupStatus: signupStatus ?? this.signupStatus,
        error: error ?? this.error);
  }
}
