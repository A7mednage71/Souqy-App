part of 'upload_image_cubit.dart';

@freezed
class UploadImageState with _$UploadImageState {
  const factory UploadImageState.initial() = _Initial;
  const factory UploadImageState.loading() = _Loading;
  const factory UploadImageState.loadingImageAtIndex(int index) =
      _LoadingImageAtIndex;
  const factory UploadImageState.success() = _Success;
  const factory UploadImageState.delete() = _Delete;
  const factory UploadImageState.failure(String errorMessage) = _Failure;
}
