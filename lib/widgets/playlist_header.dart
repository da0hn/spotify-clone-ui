import 'package:flutter/material.dart';

import '../data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({super.key, required this.playlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200.0,
              width: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 60.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PLAYLIST',
                    style: Theme.of(context)
                        .textTheme
                        .overline!
                        .copyWith(fontSize: 12.0),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    playlist.name,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    playlist.description,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  const SizedBox(height: 16.0),
                  Text(playlist.playlistDetail),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        _PlaylistButtons(followers: playlist.followers),
      ],
    );
  }
}

class _PlaylistButtons extends StatelessWidget {
  final String followers;

  const _PlaylistButtons({required this.followers});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 48.0,
            ),
            shape: const CircleBorder(),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            primary: Colors.black,
          ),
          child: const Icon(Icons.play_arrow, size: 40.0),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_circle_down_sharp),
          iconSize: 30.0,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.person_add_outlined),
          iconSize: 30.0,
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
        const Spacer(),
        Text(
          'FOLLOWERS\n$followers',
          style: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
