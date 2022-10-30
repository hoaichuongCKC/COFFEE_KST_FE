part of 'update_avatar_bloc.dart';

abstract class UpdateAvatarEvent extends Equatable {
  const UpdateAvatarEvent();

  @override
  List<Object> get props => [];
}

class SelectFileEvent extends UpdateAvatarEvent {}

class UploadFileFirebaseEvent extends UpdateAvatarEvent {}
