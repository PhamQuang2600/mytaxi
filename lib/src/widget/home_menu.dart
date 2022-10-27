import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeMenu extends StatefulWidget {
  const HomeMenu({super.key});

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text(
            "Trang cá nhân",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        ListTile(
          leading: Icon(Icons.history),
          title: Text(
            "Lịch sử đi",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        ListTile(
          leading: Icon(Icons.local_offer),
          title: Text(
            "Ưu đãi",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          title: Text(
            "Thông báo",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text(
            "Trợ giúp",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text(
            "Đăng xuất",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
      ],
    );
  }
}
