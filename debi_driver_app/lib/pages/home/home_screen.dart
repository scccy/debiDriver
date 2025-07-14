import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onLogout;
  const HomeScreen({super.key, required this.onLogout});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  List<String> plates = ['苏A5UR36', '粤B12345'];
  String selectedPlate = '苏A5UR36';
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addPlate() {
    Navigator.pushNamed(context, '/add_plate');
  }

  void _openSettings() {
    Navigator.pushNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    final Color drawerBg = Theme.of(context).colorScheme.surface;
    return Scaffold(
      drawer: Drawer(
        width: 240,
        backgroundColor: drawerBg,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text(selectedPlate),
                    accountEmail: const Text('个人信息'),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.blue[300],
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.directions_car),
                    title: SizedBox(
                      width: double.infinity,
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        value: selectedPlate,
                        items: plates
                            .map((p) => DropdownMenuItem(
                                  value: p,
                                  child: Text(
                                    p,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (v) {
                          setState(() {
                            selectedPlate = v!;
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 48,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: drawerBg,
                          ),
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: drawerBg,
                          ),
                          elevation: 4,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('添加/绑定新车牌'),
                    onTap: _addPlate,
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('设置'),
                    onTap: _openSettings,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('退出登录'),
              onTap: widget.onLogout,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('黛比驾驶员 - $selectedPlate'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: '历史标记'),
            Tab(text: '历史被标记'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // 历史标记列表
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) => ListTile(
                    leading: const Icon(Icons.flag, color: Colors.blue),
                    title: Text('标记车牌：粤B1234$index'),
                    subtitle: Text('原因：示例原因$index'),
                    trailing: Text('2024-01-0${index + 1}'),
                    onTap: () => Navigator.pushNamed(context, '/chat'),
                  ),
                ),
                // 历史被标记列表
                ListView(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.warning, color: Colors.red),
                      title: const Text('被标记车牌：苏A5UR36'),
                      subtitle: const Text('原因：龟速车'),
                      trailing: const Text('2024-01-01'),
                      onTap: () => Navigator.pushNamed(context, '/chat'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[200],
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: const Center(
              child: Text(
                '黛比大舞台',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}