import 'package:flutter/material.dart';

class FixNowAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const FixNowAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('FixNow'));
  }

  @override
  Size get preferredSize => throw UnimplementedError();
}
