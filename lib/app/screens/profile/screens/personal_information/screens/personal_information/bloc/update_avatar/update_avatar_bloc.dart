// ignore_for_file: depend_on_referenced_packages, unnecessary_null_comparison
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:coffee_kst/app/screens/profile/domain/entities/user.dart';
import 'package:coffee_kst/app/screens/profile/domain/usecases/update_avatar.dart';
import 'package:coffee_kst/core/error/failures.dart';
import 'package:coffee_kst/database/box/information_user.dart';
import 'package:coffee_kst/database/hive/infor_user/infor_user.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
part 'update_avatar_event.dart';
part 'update_avatar_state.dart';

class UpdateAvatarBloc extends Bloc<UpdateAvatarEvent, UpdateAvatarState> {
  final UpdateAvatarUsecases updateAvatarUsecases;
  UpdateAvatarBloc({required this.updateAvatarUsecases})
      : super(const UpdateAvatarState()) {
    on<SelectFileEvent>(_selectFile);
    on<UploadFileFirebaseEvent>(_uploadFileBase);
  }

  Future _selectFile(
      SelectFileEvent event, Emitter<UpdateAvatarState> emit) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) return;
    final path = result.files.single.path!;
    if (path.isNotEmpty) {
      emit(state.copyWith(urlFile: path, state: UploadingState()));
    }
  }

  Future _uploadFileBase(
      UploadFileFirebaseEvent event, Emitter<UpdateAvatarState> emit) async {
    if (state.urlFile.isEmpty) return;
    final fileName = basename(state.urlFile);
    final destination = 'files/$fileName';
    try {
      final ref = FirebaseStorage.instance.ref(destination);
      final task = ref.putFile(File(state.urlFile));
      if (task == null) return;
      final snapshot = await task.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      emit(state.copyWith(state: UploadSuccessState()));
      if (urlDownload.isNotEmpty) {
        final result = await updateAvatarUsecases.call(urlDownload);
        result.fold(
          (Failure result) {
            if (result is InternetFailure) {
              emit(state.copyWith(state: UploadFailedState()));
            } else if (result is ServerFailure) {
              emit(state.copyWith(state: UploadFailedState()));
            }
          },
          (UserEntity data) {
            // emit(state.copyWith(state: UploadSuccessState()));
            final hive = InformationUserHive(data.userId, data.phone,
                data.fullname, data.fullAddress, data.gender, data.avatarUrl);
            BoxesInformationUser.instance.saveInformationUser(hive);
          },
        );
      }
    } on FirebaseException {
      emit(state.copyWith(state: UploadFailedState()));
    }
  }
}
