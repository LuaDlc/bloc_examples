import 'dart:io';

import 'package:bloc_multiple_states/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_multiple_states/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_multiple_states/bloc/image_picker/image_picker_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Bloc'),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerStates>(
          builder: (context, state) {
        if (state.file == null) {
          return Center(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(CameraCapture());
                  },
                  icon: const Icon(Icons.camera),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(GalleryImagePicker());
                  },
                  icon: const Icon(Icons.album),
                ),
              ],
            ),
          );
        } else {
          return Image.file(File(state.file!.path.toString()));
        }
      }),
    );
  }
}
