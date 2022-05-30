import 'package:flutter/material.dart';

import 'data/data.dart';
import 'screens/playlist_screen.dart';
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
                Expanded(
                  child: PlaylistScreen(playlist: lofihiphopPlaylist),
                ),
              ],
            ),
          ),
          const CurrentTrack(),
        ],
      ),
    );
  }
}
