import 'package:flutter/material.dart';

class VoiceChatScreen extends StatelessWidget {
  const VoiceChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 示例数据：true为自己，false为对方
    final List<Map<String, dynamic>> messages = [
      {'isMe': false, 'text': '对方语音消息1'},
      {'isMe': true, 'text': '我发的语音1'},
      {'isMe': false, 'text': '对方语音消息2'},
      {'isMe': true, 'text': '我发的语音2'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('语音聊天')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final isMe = messages[index]['isMe'] as bool;
                final text = messages[index]['text'] as String;
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment:
                        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      if (!isMe)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[400],
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue[100] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.mic, color: isMe ? Colors.blue : Colors.grey),
                            const SizedBox(width: 8),
                            Text(text),
                            IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      if (isMe)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue[300],
                            child: Icon(Icons.person, color: Colors.white),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(child: Text('按住录音...')),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 