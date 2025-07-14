import 'package:flutter/material.dart';

class PlateRegisterScreen extends StatefulWidget {
  final VoidCallback onRegisterSuccess;
  final VoidCallback onGoToLogin;
  const PlateRegisterScreen({super.key, required this.onRegisterSuccess, required this.onGoToLogin});

  @override
  State<PlateRegisterScreen> createState() => _PlateRegisterScreenState();
}

class _PlateRegisterScreenState extends State<PlateRegisterScreen> {
  final List<String> provinces = ['苏', '粤', '京', '沪', '浙', '鲁', '川', '渝'];
  final List<String> cities = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'J', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'];
  String selectedProvince = '苏';
  String selectedCity = 'A';
  final TextEditingController plateController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注册车牌')),
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
                  onChanged: (v) => setState(() => selectedProvince = v!),
                ),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedCity,
                  items: cities.map((c) => DropdownMenuItem(value: c, child: Text(c))).toList(),
                  onChanged: (v) => setState(() => selectedCity = v!),
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
            TextField(
              controller: pwdController,
              obscureText: true,
              decoration: const InputDecoration(labelText: '设置密码'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                widget.onRegisterSuccess();
              },
              child: const Text('注册'),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: widget.onGoToLogin,
              child: const Text('已有账号？直接登录'),
            ),
          ],
        ),
      ),
    );
  }
} 