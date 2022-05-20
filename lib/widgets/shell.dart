import 'package:flutter/material.dart';

class Shell extends StatelessWidget {
  const Shell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // TODO: SideMenu
                Container(
                  height: double.infinity,
                  width: 280.0,
                  color: Theme.of(context).primaryColor,
                ),
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
    );
  }
}
