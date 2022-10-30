// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'update_avatar_bloc.dart';

class UpdateAvatarState extends Equatable {
  final String urlFile;
  final UploadFileState state;
  const UpdateAvatarState({
    this.urlFile = '',
    this.state = const UploadInitState(),
  });

  @override
  List<Object> get props => [];

  UpdateAvatarState copyWith({
    String? urlFile,
    UploadFileState? state,
  }) {
    return UpdateAvatarState(
      urlFile: urlFile ?? this.urlFile,
      state: state ?? this.state,
    );
  }
}

abstract class UploadFileState {
  const UploadFileState();
}

class UploadInitState extends UploadFileState {
  const UploadInitState();
}

class UploadingState extends UploadFileState {}

class UploadSuccessState extends UploadFileState {}

class UploadFailedState extends UploadFileState {}
