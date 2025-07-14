import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> provinces = ['苏', '粤', '京', '沪', '浙', '鲁', '川', '渝'];
    final List<String> cities = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
    String selectedProvince = '苏';
    String selectedCity = 'A';
    final TextEditingController plateController = TextEditingController();
    // 图片上传功能后续可接入插件

    return Scaffold(
      appBar: AppBar(title: const Text('忘记密码')), 
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedProvince,
                  items: provinces.map((p) => DropdownMenuItem(value: p, child: Text(p))).toList(),
                  onChanged: (v) {},
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedCity,
                  items: cities.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (v) {},
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: plateController,
                    decoration: const InputDecoration(labelText: '号牌'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt),
              label: const Text('上传车牌照片'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
              child: const Text('提交验证'),
            ),
          ],
        ),
      ),
    );
  }
} 