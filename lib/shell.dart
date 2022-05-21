import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WindowTitleBar(),
          Expanded(
            flex: 90,
            child: Row(
              children: const [
                SideMenu(),
                // TODO: PlaylistScreen
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
