import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:debi_driver_app/widgets/avatar_picker_widget.dart';
import 'package:debi_driver_app/widgets/custom_text_field.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController oldPwdController = TextEditingController();
  final TextEditingController newPwdController = TextEditingController();
  final TextEditingController confirmPwdController = TextEditingController();
  XFile? _avatarImage;

  Future<void> _pickAvatarFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) setState(() => _avatarImage = image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          AvatarPickerWidget(
            initialImage: _avatarImage,
            onImagePicked: (img) => setState(() => _avatarImage = img),
          ),
          const SizedBox(height: 32),
          CustomTextField(
            controller: oldPwdController,
            label: '原密码',
            obscureText: true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: newPwdController,
            label: '新密码',
            obscureText: true,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: confirmPwdController,
            label: '确认新密码',
            obscureText: true,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            child: const Text('保存设置'),
          ),
        ],
      ),
    );
  }
} 