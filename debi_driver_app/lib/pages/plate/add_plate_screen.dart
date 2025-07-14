import 'package:flutter/material.dart';
import 'package:debi_driver_app/constants/plate_constants.dart';
import 'package:debi_driver_app/widgets/plate_input_widget.dart';

class AddPlateScreen extends StatelessWidget {
  const AddPlateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String plate = '';
    return Scaffold(
      appBar: AppBar(
        title: const Text('绑定新车牌'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('上传照片示例', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    const SizedBox(height: 8),
                    Container(
                      width: 180,
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset(
                        'assets/plate_sample.png',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const Center(child: Text('示例图片')),
                      ),
                    ),
                    const SizedBox(height: 24),
                    PlateInputWidget(
                      onPlateChanged: (v) => plate = v,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.blue[400],
                        elevation: 2,
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('上传车牌照片', style: TextStyle(fontSize: 16)),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white, // 明确指定按钮文字为白色
                          elevation: 4,
                        ),
                        onPressed: () {
                          Navigator.pop(context); // 绑定后返回主页
                        },
                        child: const Text('提交绑定', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
} 