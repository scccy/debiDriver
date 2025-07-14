import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarPickerWidget extends StatefulWidget {
  final XFile? initialImage;
  final ValueChanged<XFile?>? onImagePicked;

  const AvatarPickerWidget({Key? key, this.initialImage, this.onImagePicked}) : super(key: key);

  @override
  State<AvatarPickerWidget> createState() => _AvatarPickerWidgetState();
}

class _AvatarPickerWidgetState extends State<AvatarPickerWidget> {
  XFile? _avatarImage;

  @override
  void initState() {
    super.initState();
    _avatarImage = widget.initialImage;
  }

  Future<void> _pickAvatarFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _avatarImage = image);
      widget.onImagePicked?.call(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _pickAvatarFromGallery,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue[300],
              backgroundImage: _avatarImage != null ? FileImage(File(_avatarImage!.path)) : null,
              child: _avatarImage == null ? Icon(Icons.person, color: Colors.white, size: 48) : null,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.photo, size: 20, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 