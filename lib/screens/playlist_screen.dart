import 'package:flutter/material.dart';

import '../data/data.dart';
import '../data/palette.dart';
import '../widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({super.key, required this.playlist});

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _transparentAppBar(),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Palette.topBar.value, Theme.of(context).backgroundColor],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0, 0.3],
        ),
      ),
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 60.0,
          ),
          children: [
            PlaylistHeader(playlist: widget.playlist),
            TrackList(tracks: widget.playlist.songs),
          ],
        ),
      ),
    );
  }

  AppBar _transparentAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 140.0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _NavigationButton(
              onTap: () {},
              iconData: Icons.chevron_left,
            ),
            const SizedBox(width: 14),
            _NavigationButton(
              onTap: () {},
              iconData: Icons.chevron_right,
            ),
          ],
        ),
      ),
      actions: [
        TextButton.icon(
          style: TextButton.styleFrom(
            primary: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {},
          icon: const Icon(Icons.account_circle_outlined, size: 30.0),
          label: const Text('Gabriel Honda'),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          padding: const EdgeInsets.only(),
          onPressed: () {},
          icon: const Icon(Icons.keyboard_arrow_down, size: 30.0),
          color: Theme.of(context).iconTheme.color,
        ),
        const SizedBox(width: 20.0),
      ],
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;

  const _NavigationButton({
    required this.onTap,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6.0),
        decoration: const BoxDecoration(
          color: Colors.black26,
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconData,
          size: 28.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
