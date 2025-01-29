import 'package:bloc_multiple_states/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_multiple_states/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_states.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerStates> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerStates()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(pickImageFromGallery);
  }

  void cameraCapture(
      CameraCapture event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    states(state.copyWith(file: file));
  }

  void pickImageFromGallery(
      GalleryImagePicker event, Emitter<ImagePickerStates> states) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();
    states(state.copyWith(file: file));
  }
}
