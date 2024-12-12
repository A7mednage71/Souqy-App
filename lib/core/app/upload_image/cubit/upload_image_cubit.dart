import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_store/core/app/upload_image/repos/upload_image_repo.dart';
import 'package:my_store/core/helpers/image_picker.dart';

part 'upload_image_cubit.freezed.dart';
part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this.uploadImageRepo)
      : super(const UploadImageState.initial());
  final UploadImageRepo uploadImageRepo;

  String uploadImageUrl = '';

  // Upload Image
  Future<void> uploadImage() async {
    // pick the image
    final image = await ImagePickerHelper.pickImage();
    if (image == null) return;
    // upload the image
    emit(const UploadImageState.loading());
    final result = await uploadImageRepo.uploadImage(file: image);
    result.when(
      success: (data) {
        uploadImageUrl = data.location;
        emit(const UploadImageState.success());
      },
      failure: (failure) {
        emit(UploadImageState.failure(failure.errMessages));
      },
    );
  }

  // delete the image
  void deleteImage() {
    uploadImageUrl = '';
    emit(const UploadImageState.delete());
  }
}
