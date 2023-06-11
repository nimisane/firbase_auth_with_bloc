// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProfileState extends Equatable {
    const ProfileState({
    required this.profileStatus,
    required this.user,
    required this.error
  });

  final ProfileStatus profileStatus;
  final UserModel user;
  final CustomError error;

   factory ProfileState.initial() {
    return ProfileState(
      profileStatus: ProfileStatus.initial,
      user: UserModel.initialUser(),
      error: const CustomError(),
    );
  }

  @override
  List<Object> get props => [profileStatus, user, error];

  @override
  String toString() {
    return 'ProfileState{profileStatus=$profileStatus, user=$user, error=$error}';
  }
  ProfileState copyWith({
    ProfileStatus? profileStatus,
    UserModel? user,
    CustomError? error    
  }) {
    return ProfileState(
          profileStatus: profileStatus ?? this.profileStatus,
      user: user ?? this.user,
      error: error ?? this.error
    );
  }
}
