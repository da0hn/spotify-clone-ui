import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowBorder(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: [
            const Expanded(
              flex: 5,
              child: WindowTitleBar(),
            ),
            Expanded(
              flex: 95,
              child: Row(
                children: const [
                  SideMenu(),
                  // TODO: PlaylistScreen
                ],
              ),
            ),
            Container(
              height: 84.0,
              width: double.infinity,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
